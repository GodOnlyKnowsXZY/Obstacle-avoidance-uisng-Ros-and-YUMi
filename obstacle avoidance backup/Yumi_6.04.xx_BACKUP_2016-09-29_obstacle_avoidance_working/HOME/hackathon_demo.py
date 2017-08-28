# Web socket client using https://pypi.python.org/pypi/websocket-client/

import sys, argparse
import xml.etree.ElementTree as ET
#import websocket
from ws4py.client.threadedclient import WebSocketClient
import threading
import time
import requests
from requests.auth import HTTPDigestAuth
import datetime
import json

namespace = '{http://www.w3.org/1999/xhtml}'

equipment_id = '71a7aaf0-cd3f-45cc-a38d-18a930aedfbd'

raise_url = "https://gateway.raise.stage.e.abb.com/cloud/operational/senddata?deviceID=%(devid)s" % {'devid':equipment_id}

event_data = '{"version":{"familyVersion":"0","typeVersion":"1","modelVersion":"1","instanceVersion":"1","deviceUniqueId":"%(devid)s"},"valuesList":[{"VariableName":"%(name)s","EventData":[{"TimeStamp":"%(timestamp)s","LocalTimeZone":"IST","Value":"%(value)s","Kind":"Alarm","Priority":"1","Severity":"1","Code":"%(code)s","Message":"%(value)s","EventGroup":"1"}]}]}'

class Event():
    def __init__(self, name, timestamp, message, code, conseqs, causes, actions):
        self.name = name
        self.timestamp = timestamp
        self.message = message
        self.code = code
        self.conseqs = conseqs
        self.causes = causes
        self.actions = actions
        

def print_event(evt):
    root = ET.fromstring(evt)        
    if root.findall(".//{0}li[@class='pnl-ctrlstate-ev']".format(namespace)):
        print ("\tController State : " + root.find(".//{0}li[@class='pnl-ctrlstate-ev']/{0}span".format(namespace)).text)
    if root.findall(".//{0}li[@class='pnl-opmode-ev']".format(namespace)):
        print ("\tOperation Mode : " + root.find(".//{0}li[@class='pnl-opmode-ev']/{0}span".format(namespace)).text)
    if root.findall(".//{0}li[@class='pnl-speedratio-ev']".format(namespace)):
        print ("\tSpeed Ratio : " + root.find(".//{0}li[@class='pnl-speedratio-ev']/{0}span".format(namespace)).text)



class RWPanel(WebSocketClient):

    def opened(self):
        print ("Web Sockect connection established")

    def closed(self, code, reason=None):
        print ("Closed down", code, reason)

    def received_message(self, event_xml):        
        if event_xml.is_text:            
            print ("Events : ")
            self.handle_event(event_xml.data.decode("utf-8"))
            #print_event(event_xml.data.decode("utf-8"))
        else:
            print ("Received Illegal Event " + str(event_xml))
       
   

    def __init__(self, host, username, password):
        self.host = host
        self.username = username
        self.password = password
        self.digest_auth = HTTPDigestAuth(self.username,self.password)
        self.subscription_url = 'http://{0}/subscription'.format(self.host)
        # send only elogs defined as alarms below
        self.alarms = [10024,10012,50055]
        print (self.subscription_url)

    def handle_event(self,evt):
        print (evt)
        root = ET.fromstring(evt)        
        if root.findall(".//{0}li[@class='elog-message-ev']".format(namespace)):
            uri = root.find(".//{0}li[@class='elog-message-ev']/{0}a[@rel='self']".format(namespace)).attrib['href']
            e = self.get_elog('http://{0}/{1}?lang=en'.format(self.host, uri))
            print (str(e))
            self.send_event(e)

    def get_elog(self, url):
        response = requests.get(url, auth=self.digest_auth)
        print (url)
        print (response.status_code)
        print (response.text)
        root = ET.fromstring(response.text)              
        code = root.find(".//{0}li[@class='elog-message']/{0}span[@class='code']".format(namespace)).text
        print ("code " + code)
        tstamp = root.find(".//{0}li[@class='elog-message']/{0}span[@class='tstamp']".format(namespace)).text
        title = root.find(".//{0}li[@class='elog-message']/{0}span[@class='title']".format(namespace)).text
        desc = root.find(".//{0}li[@class='elog-message']/{0}span[@class='desc']".format(namespace)).text
        conseqs = root.find(".//{0}li[@class='elog-message']/{0}span[@class='conseqs']".format(namespace)).text
        causes = root.find(".//{0}li[@class='elog-message']/{0}span[@class='causes']".format(namespace)).text
        actions = root.find(".//{0}li[@class='elog-message']/{0}span[@class='actions']".format(namespace)).text
        e = Event("NewElog", tstamp, title, code, conseqs, causes, actions)
        return e
   
    def send_event(self, event):
        if int(event.code) in self.alarms:
            headers ={'Content-Type':'application/json'}
            data = event_data %  {'name':event.name,'devid':equipment_id,'timestamp':event.timestamp,'value':event.message,'code':event.code}
            print (data)
            thingSpeak_url = "http://52.200.157.52/update.json?api_key=MDWLY6K54K2NRIVD&field1=%(devid)s" % {'devid':str(event.code) + " @ " + time.strftime("%d-%m-%Y %H:%M:%S")}
            response = requests.post(thingSpeak_url, data=data, headers=headers)
            print ("Send Event - Raise status " + str(response.status_code))
        else:
            print ("Recieved Elog Code=>" + event.code + " . Ignoring...")
    

    def start(self):
                
        return self.subscribe()
    

    def subscribe(self):            
        payload = {'resources':['1','2'],
                    '1':'/rw/elog/5',
                    '1-p':'1',
                    '2':'/rw/elog/1',
                    '2-p':'1'}        
        resp = requests.post(self.subscription_url , auth=self.digest_auth, data=payload)
        print ("Initial Events : ")
        #print_event(resp.text)           
        if resp.status_code == 201:
            self.location = resp.headers['Location']
            self.cookie = 'ABBCX={0}'.format(resp.cookies['ABBCX'])
            return True
        else:
           print ('Error subscribing ' + str(resp.status_code))
           return False  

    def start_recv_events(self):
        # It is not enough to just send the Cookie. The Authorization header should be included for Web Socket Upgrade 
        # request otherwise we get an Unauthorized error. 
        header = [('Cookie',self.cookie),
                    ('Authorization',self.digest_auth.build_digest_header("GET",self.subscription_url))]        
        #self.ws = RobWebSocketClient(self.location, 
        super(RWPanel,self).__init__(self.location, 
                                     protocols=['robapi2_subscription'], 
                                     headers=header)
        self.connect()
        self.run_forever()

    def close(self):
        self.ws.close()  


def enable_http_debug():
     websocket.enableTrace(True)     

def main(argv):
    try:
      parser = argparse.ArgumentParser()
      parser.add_argument("-host",help="The host to connect. Defaults to localhost on port 80", default='10.140.60.194')
      #10.140.60.149
      parser.add_argument("-user",help="The login user name. Defaults to default user name", default='Default User')
      parser.add_argument("-passcode",help="The login password. Defaults to default password", default='robotics')  
      parser.add_argument("-debug",help="Enable HTTP level debugging.", action='store_true')  
      args = parser.parse_args()       
      
      if args.debug:
        enable_http_debug()
     
      rwpanel = RWPanel(args.host, args.user, args.passcode)
      if rwpanel.start():
        rwpanel.start_recv_events()
    except KeyboardInterrupt:
      rwpanel.close()


if __name__ == "__main__":
    main(sys.argv[1:])








