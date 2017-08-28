MODULE DanceR
  TASK PERS num nActPitch:=165;
  TASK PERS num nActDia:=180;
  TASK PERS bool bCirc:=TRUE;
  CONST pos axis_dir{3,2}:=[[[1,1,1],[-1,-1,1]],
                              [[-1,1,1],[1,-1,-1]],
                              [[1,-1,1],[1,1,-1]]];
  PERS num nDia_R:=180;
  PERS num nPitch_R:=15;
  PERS num nAxis_R:=3;

  PERS speeddata helix_speed{5}:=[[80,500,5000,1000],[80,500,5000,1000],[100,500,5000,1000],[200,500,5000,1000],[300,500,5000,1000]];
  VAR speeddata vDance:=[500,500,1000,5000];

  VAR robtarget helix_return;

  TASK PERS tooldata tHandDance:=[TRUE,[[0,0,135.14],[1,0,0,0]],[0.2,[0,0,50],[1,0,0,0],0,0,0]];

  PERS tasks taskYuMi{2}:=[["T_ROB_R"],["T_ROB_L"]];
  VAR syncident sync_dance_start;
  VAR syncident sync_dance01;
  VAR syncident sync_dance02;
  VAR syncident sync_dance07;
  VAR syncident sync_dance08;

  PERS robtarget pHelix_R:=[[547.59,-9.12,341.68],[0.0201017,-0.0484601,-0.70938,-0.702871],[1,-1,-1,11],[-175.428,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST jointtarget jpDance10:=[[20.000007956,-99.999986846,30.000014495,0,40.000015912,0],[-79.999977182,9E9,9E9,9E9,9E9,9E9]];
  CONST jointtarget jpDance20:=[[50.000020744,-99.999986846,40.000015912,79.999977182,40.000015912,0],[-79.999977182,9E9,9E9,9E9,9E9,9E9]];
  CONST jointtarget jpDance30:=[[74.60419604,-87.881352956,15.810692645,94.168159596,27.416237602,-4.597865637],[-62.00641755,9E9,9E9,9E9,9E9,9E9]];
  CONST jointtarget jpDance40:=[[89.999982014,-85.000010334,24.999981343,119.999989679,50.000020744,-44.999991007],[-79.999977182,9E9,9E9,9E9,9E9,9E9]];
  CONST jointtarget jpDance50:=[[127.132291776,-49.825840674,33.091463981,171.816810006,106.800478353,-172.340726496],[-79.098084853,9E9,9E9,9E9,9E9,9E9]];
  CONST jointtarget jpDance60:=[[89.999982014,-85.000010334,24.999981343,119.999989679,50.000020744,60.00002899],[-79.999977182,9E9,9E9,9E9,9E9,9E9]];
  CONST jointtarget jpDance70:=[[95.513556599,-85.772620842,8.672314241,84.831031454,60.461886382,-18.964899617],[-85.03561611,9E9,9E9,9E9,9E9,9E9]];
  CONST jointtarget jpDance80:=[[114.423966675,-59.72199931,-8.200460014,246.914398421,113.896539467,-107.592356825],[-50.021143104,9E9,9E9,9E9,9E9,9E9]];
  CONST jointtarget jpDance90:=[[78.857839779,-76.454227909,11.346741405,255.067567912,114.853797309,-124.359521841],[-29.624897091,9E9,9E9,9E9,9E9,9E9]];
  CONST jointtarget jpDance100:=[[78.857839779,-76.454227909,11.346741405,-30.946139129,74.81722964,-124.359521841],[-29.624897091,9E9,9E9,9E9,9E9,9E9]];
  CONST jointtarget jpDance110:=[[84.159418953,-73.473239657,18.443225137,-36.226288584,62.441452788,-120.379925782],[-35.601476539,9E9,9E9,9E9,9E9,9E9]];
  CONST jointtarget jpDance120:=[[104.303176777,-37.680312915,7.981454267,-77.225998304,113.294615386,-75.504380821],[-24.930533688,9E9,9E9,9E9,9E9,9E9]];
  CONST jointtarget jpDance130:=[[100.777317015,-32.239934052,0.49406152,-73.944959841,118.550118103,-77.591379273],[-17.112588173,9E9,9E9,9E9,9E9,9E9]];
  CONST jointtarget jpDance140:=[[103.254510513,-79.037603528,-4.973522199,20.388976984,83.168085297,-181.330484878],[-73.226717639,9E9,9E9,9E9,9E9,9E9]];
  CONST jointtarget jpDance150:=[[103.430797696,-77.978521226,-1.700882522,21.460935901,79.49623024,-182.228764037],[-72.835484403,9E9,9E9,9E9,9E9,9E9]];

  PROC main()
    WaitSyncTask sync_Dance_Start,taskYuMi;
    vDance:=[300,100,100,100];
    mvDance_2;
    mvHelix;
    vDance:=[500,100,100,100];
    mvDance_2;
  ENDPROC

  PROC mvHelix()
    nPitch_R:=5;
    nAxis_R:=2;
    SyncMoveOn sync_dance07,taskYuMi;
    MoveL helix(\Init,pHelix_R,nPitch_R,nDia_R,nAxis_R)\ID:=10,v300,z10,tHandDance\WObj:=wobj0;
    MoveC helix(pHelix_R,nPitch_R,nDia_R,nAxis_R),helix(\EndPoint,pHelix_R,nPitch_R,nDia_R,nAxis_R)\ID:=20,helix_speed{1},z10,tHandDance\WObj:=wobj0;
    MoveC helix(pHelix_R,nPitch_R,nDia_R,nAxis_R),helix(\EndPoint,pHelix_R,nPitch_R,nDia_R,nAxis_R)\ID:=30,helix_speed{2},z10,tHandDance\WObj:=wobj0;
    MoveC helix(pHelix_R,nPitch_R,nDia_R,nAxis_R),helix(\EndPoint,pHelix_R,nPitch_R,nDia_R,nAxis_R)\ID:=40,helix_speed{3},z10,tHandDance\WObj:=wobj0;
    MoveC helix(pHelix_R,nPitch_R,nDia_R,nAxis_R),helix(\EndPoint,pHelix_R,nPitch_R,nDia_R,nAxis_R)\ID:=50,helix_speed{4},z10,tHandDance\WObj:=wobj0;
    MoveC helix(pHelix_R,nPitch_R,nDia_R,nAxis_R),helix(\EndPoint,pHelix_R,nPitch_R,nDia_R,nAxis_R)\ID:=60,helix_speed{5},z10,tHandDance\WObj:=wobj0;

    helix_return:=Offs(pHelix_R,0,(nActPitch-nPitch_R),0);

    MoveL helix(\Init\Neg,helix_return,nPitch_R,nDia_R,nAxis_R)\ID:=65,v300,z10,tHandDance\WObj:=wobj0;
    MoveC helix(\Neg,helix_return,nPitch_R,nDia_R,nAxis_R),helix(\EndPoint\Neg,helix_return,nPitch_R,nDia_R,nAxis_R)\ID:=70,helix_speed{5},z10,tHandDance\WObj:=wobj0;
    MoveC helix(\Neg,helix_return,nPitch_R,nDia_R,nAxis_R),helix(\EndPoint\Neg,helix_return,nPitch_R,nDia_R,nAxis_R)\ID:=80,helix_speed{4},z10,tHandDance\WObj:=wobj0;
    MoveC helix(\Neg,helix_return,nPitch_R,nDia_R,nAxis_R),helix(\EndPoint\Neg,helix_return,nPitch_R,nDia_R,nAxis_R)\ID:=90,helix_speed{3},z10,tHandDance\WObj:=wobj0;
    MoveC helix(\Neg,helix_return,nPitch_R,nDia_R,nAxis_R),helix(\EndPoint\Neg,helix_return,nPitch_R,nDia_R,nAxis_R)\ID:=100,helix_speed{2},z10,tHandDance\WObj:=wobj0;
    MoveC helix(\Neg,helix_return,nPitch_R,nDia_R,nAxis_R),helix(\EndPoint\Neg,helix_return,nPitch_R,nDia_R,nAxis_R)\ID:=110,helix_speed{1},z10,tHandDance\WObj:=wobj0;

    MoveL pHelix_R\ID:=120,v300,z1,tHandDance;

    nPitch_R:=15;

    nAxis_R:=3;
    MoveL helix(\Init,pHelix_R,nPitch_R,nDia_R,nAxis_R)\ID:=235,v300,z10,tHandDance\WObj:=wobj0;
    MoveC helix(pHelix_R,nPitch_R,nDia_R,nAxis_R),helix(\EndPoint,pHelix_R,nPitch_R,nDia_R,nAxis_R)\ID:=240,helix_speed{1},z10,tHandDance\WObj:=wobj0;
    MoveC helix(pHelix_R,nPitch_R,nDia_R,nAxis_R),helix(\EndPoint,pHelix_R,nPitch_R,nDia_R,nAxis_R)\ID:=250,helix_speed{2},z10,tHandDance\WObj:=wobj0;
    MoveC helix(pHelix_R,nPitch_R,nDia_R,nAxis_R),helix(\EndPoint,pHelix_R,nPitch_R,nDia_R,nAxis_R)\ID:=260,helix_speed{3},z10,tHandDance\WObj:=wobj0;
    MoveC helix(pHelix_R,nPitch_R,nDia_R,nAxis_R),helix(\EndPoint,pHelix_R,nPitch_R,nDia_R,nAxis_R)\ID:=270,helix_speed{4},z10,tHandDance\WObj:=wobj0;
    MoveC helix(pHelix_R,nPitch_R,nDia_R,nAxis_R),helix(\EndPoint,pHelix_R,nPitch_R,nDia_R,nAxis_R)\ID:=280,helix_speed{5},z10,tHandDance\WObj:=wobj0;

    helix_return:=Offs(pHelix_R,0,0,(nActPitch-nPitch_R));

    MoveL helix(\Init\Neg,helix_return,nPitch_R,nDia_R,nAxis_R)\ID:=285,v300,z10,tHandDance\WObj:=wobj0;
    MoveC helix(\Neg,helix_return,nPitch_R,nDia_R,nAxis_R),helix(\EndPoint\Neg,helix_return,nPitch_R,nDia_R,nAxis_R)\ID:=290,helix_speed{5},z10,tHandDance\WObj:=wobj0;
    MoveC helix(\Neg,helix_return,nPitch_R,nDia_R,nAxis_R),helix(\EndPoint\Neg,helix_return,nPitch_R,nDia_R,nAxis_R)\ID:=300,helix_speed{4},z10,tHandDance\WObj:=wobj0;
    MoveC helix(\Neg,helix_return,nPitch_R,nDia_R,nAxis_R),helix(\EndPoint\Neg,helix_return,nPitch_R,nDia_R,nAxis_R)\ID:=310,helix_speed{3},z10,tHandDance\WObj:=wobj0;
    MoveC helix(\Neg,helix_return,nPitch_R,nDia_R,nAxis_R),helix(\EndPoint\Neg,helix_return,nPitch_R,nDia_R,nAxis_R)\ID:=320,helix_speed{2},z10,tHandDance\WObj:=wobj0;
    MoveC helix(\Neg,helix_return,nPitch_R,nDia_R,nAxis_R),helix(\EndPoint\Neg,helix_return,nPitch_R,nDia_R,nAxis_R)\ID:=330,helix_speed{1},z10,tHandDance\WObj:=wobj0;

    MoveL pHelix_R\ID:=340,v300,z1,tHandDance;

    SyncMoveOff sync_dance08;
  ENDPROC

  PROC mvDance_2()
    SyncMoveOn sync_dance01,taskYuMi;
    MoveAbsJ jpDance10\ID:=10,vDance,z20,tHandDance\WObj:=wobj0;
    MoveAbsJ jpDance20\ID:=20,vDance,z20,tHandDance\WObj:=wobj0;
    MoveAbsJ jpDance30\ID:=30,vDance,z20,tHandDance\WObj:=wobj0;
    MoveAbsJ jpDance40\ID:=40,vDance,z20,tHandDance\WObj:=wobj0;
    MoveAbsJ jpDance50\ID:=50,vDance,z20,tHandDance\WObj:=wobj0;
    MoveAbsJ jpDance40\ID:=60,vDance,z20,tHandDance\WObj:=wobj0;
    MoveAbsJ jpDance60\ID:=70,vDance,z20,tHandDance\WObj:=wobj0;
    MoveAbsJ jpDance40\ID:=80,vDance,z20,tHandDance\WObj:=wobj0;
    MoveAbsJ jpDance70\ID:=90,vDance,z20,tHandDance\WObj:=wobj0;
    MoveAbsJ jpDance80\ID:=100,vDance,z20,tHandDance\WObj:=wobj0;
    MoveAbsJ jpDance90\ID:=110,vDance,z20,tHandDance\WObj:=wobj0;
    MoveAbsJ jpDance100\ID:=120,vDance,z20,tHandDance\WObj:=wobj0;
    MoveAbsJ jpDance110\ID:=130,vDance,z20,tHandDance\WObj:=wobj0;
    MoveAbsJ jpDance120\ID:=140,vDance,z20,tHandDance\WObj:=wobj0;
    MoveAbsJ jpDance130\ID:=150,vDance,z20,tHandDance\WObj:=wobj0;
    MoveAbsJ jpDance120\ID:=160,vDance,z20,tHandDance\WObj:=wobj0;
    MoveAbsJ jpDance110\ID:=170,vDance,z20,tHandDance\WObj:=wobj0;
    MoveAbsJ jpDance140\ID:=180,vDance,z20,tHandDance\WObj:=wobj0;
    MoveAbsJ jpDance150\ID:=190,vDance,z20,tHandDance\WObj:=wobj0;
    MoveAbsJ jpDance140\ID:=200,vDance,z20,tHandDance\WObj:=wobj0;
    MoveAbsJ jpDance110\ID:=210,vDance,z20,tHandDance\WObj:=wobj0;
    MoveAbsJ jpDance100\ID:=220,vDance,z20,tHandDance\WObj:=wobj0;
    MoveAbsJ jpDance90\ID:=230,vDance,z20,tHandDance\WObj:=wobj0;
    MoveAbsJ jpDance80\ID:=240,vDance,z20,tHandDance\WObj:=wobj0;
    MoveAbsJ jpDance70\ID:=250,vDance,z20,tHandDance\WObj:=wobj0;
    MoveAbsJ jpDance40\ID:=260,vDance,z20,tHandDance\WObj:=wobj0;
    MoveAbsJ jpDance30\ID:=310,vDance,z20,tHandDance\WObj:=wobj0;
    MoveAbsJ jpDance20\ID:=320,vDance,z20,tHandDance\WObj:=wobj0;
    MoveAbsJ jpDance10\ID:=330,vDance,z20,tHandDance\WObj:=wobj0;
    SyncMoveOff sync_dance02;
  ENDPROC

  FUNC robtarget helix(\switch Init,\switch EndPoint,\switch Neg,robtarget start_pos,num nPitch,num nDia,num nAxis,\num nDiaOffs,\num nPitchOffs)
    VAR robtarget actPos;
    VAR num nNegativ:=1;
    IF Present(Neg) THEN
      nNegativ:=2;
    ENDIF
    IF Present(Init) THEN
      nActDia:=0;
      nActPitch:=0;
      bCirc:=False;
      TEST nAxis
      CASE 1:
        actPos:=Offs(start_pos,0*axis_dir{nAxis,nNegativ}.x,(nDia/2)*axis_dir{nAxis,nNegativ}.y,0*axis_dir{nAxis,nNegativ}.z);
        nActPitch:=nPitch;
        nActDia:=nDia;
        RETURN actPos;
      CASE 2:
        actPos:=Offs(start_pos,(nDia/2)*axis_dir{nAxis,nNegativ}.x,0*axis_dir{nAxis,nNegativ}.y,0*axis_dir{nAxis,nNegativ}.z);
        nActPitch:=nPitch;
        nActDia:=nDia;
        RETURN actPos;
      CASE 3:
        actPos:=Offs(start_pos,0*axis_dir{nAxis,nNegativ}.x,(nDia/2)*axis_dir{nAxis,nNegativ}.y,0*axis_dir{nAxis,nNegativ}.z);
        nActPitch:=nPitch;
        nActDia:=nDia;
        RETURN actPos;
      DEFAULT:
        ErrWrite\W,"Wrong rotation axis","Value for axis is not correct!";
        RETURN start_pos;
      ENDTEST
    ENDIF
    TEST nAxis
    CASE 1:
      IF Present(EndPoint) THEN
        IF bCirc=TRUE THEN
          actPos:=Offs(start_pos,nActPitch*axis_dir{nAxis,nNegativ}.x,(nActDia/2)*axis_dir{nAxis,nNegativ}.y,0*axis_dir{nAxis,nNegativ}.z);
        ELSE
          actPos:=Offs(start_pos,nActPitch*axis_dir{nAxis,nNegativ}.x,-(nActDia/2)*axis_dir{nAxis,nNegativ}.y,0*axis_dir{nAxis,nNegativ}.z);
        ENDIF
        IF Present(nPitchOffs) THEN
          nActPitch:=nActPitch+nPitch+nPitchOffs;
        ELSE
          nActPitch:=nActPitch+nPitch;
        ENDIF
        IF Present(nDiaOffs) THEN
          nActDia:=nActDia+nDiaOffs;
        ENDIF
        IF bCirc=False THEN
          bCirc:=TRUE;
        ELSE
          bCirc:=FALSE;
        ENDIF
      ELSE
        IF bCirc=TRUE THEN
          actPos:=Offs(start_pos,nActPitch*axis_dir{nAxis,nNegativ}.x,0*axis_dir{nAxis,nNegativ}.y,(nActDia/2)*axis_dir{nAxis,nNegativ}.z);
        ELSE
          actPos:=Offs(start_pos,nActPitch*axis_dir{nAxis,nNegativ}.x,0*axis_dir{nAxis,nNegativ}.y,-(nActDia/2)*axis_dir{nAxis,nNegativ}.z);
        ENDIF
        IF Present(nPitchOffs) THEN
          nActPitch:=nActPitch+nPitch+nPitchOffs;
        ELSE
          nActPitch:=nActPitch+nPitch;
        ENDIF
      ENDIF
      RETURN actPos;
    CASE 2:
      IF Present(EndPoint) THEN
        IF bCirc=TRUE THEN
          actPos:=Offs(start_pos,(nActDia/2)*axis_dir{nAxis,nNegativ}.x,nActPitch*axis_dir{nAxis,nNegativ}.y,0*axis_dir{nAxis,nNegativ}.z);
        ELSE
          actPos:=Offs(start_pos,-(nActDia/2)*axis_dir{nAxis,nNegativ}.x,nActPitch*axis_dir{nAxis,nNegativ}.y,0*axis_dir{nAxis,nNegativ}.z);
        ENDIF
        IF Present(nPitchOffs) THEN
          nActPitch:=nActPitch+nPitch+nPitchOffs;
        ELSE
          nActPitch:=nActPitch+nPitch;
        ENDIF
        IF Present(nDiaOffs) THEN
          nActDia:=nActDia+nDiaOffs;
        ENDIF
        IF bCirc=False THEN
          bCirc:=TRUE;
        ELSE
          bCirc:=FALSE;
        ENDIF
      ELSE
        IF bCirc=TRUE THEN
          actPos:=Offs(start_pos,0*axis_dir{nAxis,nNegativ}.x,nActPitch*axis_dir{nAxis,nNegativ}.y,-(nActDia/2)*axis_dir{nAxis,nNegativ}.z);
        ELSE
          actPos:=Offs(start_pos,0*axis_dir{nAxis,nNegativ}.x,nActPitch*axis_dir{nAxis,nNegativ}.y,(nActDia/2)*axis_dir{nAxis,nNegativ}.z);
        ENDIF
        IF Present(nPitchOffs) THEN
          nActPitch:=nActPitch+nPitch+nPitchOffs;
        ELSE
          nActPitch:=nActPitch+nPitch;
        ENDIF
      ENDIF
      RETURN actPos;
    CASE 3:
      IF Present(EndPoint) THEN
        IF bCirc=TRUE THEN
          actPos:=Offs(start_pos,0*axis_dir{nAxis,nNegativ}.x,(nActDia/2)*axis_dir{nAxis,nNegativ}.y,nActPitch*axis_dir{nAxis,nNegativ}.z);
        ELSE
          actPos:=Offs(start_pos,0*axis_dir{nAxis,nNegativ}.x,-(nActDia/2)*axis_dir{nAxis,nNegativ}.y,nActPitch*axis_dir{nAxis,nNegativ}.z);
        ENDIF
        IF Present(nPitchOffs) THEN
          nActPitch:=nActPitch+nPitch+nPitchOffs;
        ELSE
          nActPitch:=nActPitch+nPitch;
        ENDIF
        IF Present(nDiaOffs) THEN
          nActDia:=nActDia+nDiaOffs;
        ENDIF
        IF bCirc=False THEN
          bCirc:=TRUE;
        ELSE
          bCirc:=FALSE;
        ENDIF
      ELSE
        IF bCirc=TRUE THEN
          actPos:=Offs(start_pos,(nActDia/2)*axis_dir{nAxis,nNegativ}.x,0*axis_dir{nAxis,nNegativ}.y,nActPitch*axis_dir{nAxis,nNegativ}.z);
        ELSE
          actPos:=Offs(start_pos,-(nActDia/2)*axis_dir{nAxis,nNegativ}.x,0*axis_dir{nAxis,nNegativ}.y,nActPitch*axis_dir{nAxis,nNegativ}.z);
        ENDIF
        IF Present(nPitchOffs) THEN
          nActPitch:=nActPitch+nPitch+nPitchOffs;
        ELSE
          nActPitch:=nActPitch+nPitch;
        ENDIF
      ENDIF
      RETURN actPos;
    DEFAULT:
      ErrWrite\W,"Wrong rotation axis","Value for axis is not correct!";
      RETURN start_pos;
    ENDTEST
  ENDFUNC
ENDMODULE