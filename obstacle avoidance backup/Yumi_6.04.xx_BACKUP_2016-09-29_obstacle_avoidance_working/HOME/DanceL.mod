MODULE DanceL

  TASK PERS num nActPitch:=165;
  TASK PERS num nActDia:=180;
  TASK PERS bool bCirc:=TRUE;
  CONST pos axis_dir{3,2}:=[[[1,1,1],[-1,-1,1]],
                            [[-1,1,1],[1,-1,-1]],
                            [[1,-1,1],[1,1,-1]]];

  PERS num nDia_R;
  PERS num nPitch_R;
  PERS num nAxis_R;
  PERS num nDiaOffs_R;

  VAR speeddata vDance:=[500,500,1000,5000];

  PERS speeddata helix_speed{5};
  VAR robtarget helix_return;
  VAR robtarget pHelix_L;
  PERS robtarget pHelix_R;

  TASK PERS tooldata tHandDance:=[TRUE,[[0,0,135.14],[1,0,0,0]],[0.2,[0,0,50],[1,0,0,0],0,0,0]];

  PERS tasks taskYuMi{2}:=[["T_ROB_R"],["T_ROB_L"]];
  VAR syncident sync_dance_start;
  VAR syncident sync_dance01;
  VAR syncident sync_dance02;
  VAR syncident sync_dance07;
  VAR syncident sync_dance08;

  CONST jointtarget jpDance10:=[[-20.000007956,-99.999986846,30.000014495,0,40.000015912,0],[79.999977182,9E9,9E9,9E9,9E9,9E9]];
  CONST jointtarget jpDance20:=[[-50.000020744,-99.999986846,40.000015912,-79.999977182,40.000015912,0],[79.999977182,9E9,9E9,9E9,9E9,9E9]];
  CONST jointtarget jpDance30:=[[-74.618983399,-87.870465634,15.789112663,-94.166930162,27.410071649,4.591626686],[62.000161096,9E9,9E9,9E9,9E9,9E9]];
  CONST jointtarget jpDance40:=[[-89.999982014,-85.000010334,24.999981343,-119.999989679,50.000020744,44.999991007],[79.999977182,9E9,9E9,9E9,9E9,9E9]];
  CONST jointtarget jpDance50:=[[-89.86264057,-84.957779274,25.332526179,-119.999989679,49.730101913,-60.00002899],[79.778016525,9E9,9E9,9E9,9E9,9E9]];
  CONST jointtarget jpDance60:=[[-128,-50,33,-172,106,172],[80,9E9,9E9,9E9,9E9,9E9]];
  CONST jointtarget jpDance70:=[[-95.346708738,-85.778201107,9.105617173,-85.448576177,60.083849072,19.434326566],[84.950908104,9E9,9E9,9E9,9E9,9E9]];
  CONST jointtarget jpDance80:=[[-114.765114133,-59.604916207,-8.801720713,-246.976334576,114.268982852,107.760468271],[50.05983954,9E9,9E9,9E9,9E9,9E9]];
  CONST jointtarget jpDance90:=[[-79.088918739,-76.236105817,10.901267076,-255.109286708,115.321624286,124.395380334],[29.638936545,9E9,9E9,9E9,9E9,9E9]];
  CONST jointtarget jpDance100:=[[-79.088918739,-76.236105817,10.901267076,30.999995171,75.000005502,124.395380334],[29.638936545,9E9,9E9,9E9,9E9,9E9]];
  CONST jointtarget jpDance110:=[[-84.386543233,-73.298489267,18.006115228,36.23860683,62.644685067,120.44557756],[35.620498616,9E9,9E9,9E9,9E9,9E9]];
  CONST jointtarget jpDance120:=[[-96.072300224,-75.518471502,5.673771976,-29.637102639,79.616325456,179.969993158],[66.979567077,9E9,9E9,9E9,9E9,9E9]];
  CONST jointtarget jpDance130:=[[-96.336150431,-78.039829004,-2.64150736,-26.894523848,88.606835159,177.648370878],[69.324569094,9E9,9E9,9E9,9E9,9E9]];
  CONST jointtarget jpDance140:=[[-95.049404264,-54.197339328,18.673038804,79.114525119,106.357984548,82.997002718],[22.864797615,9E9,9E9,9E9,9E9,9E9]];
  CONST jointtarget jpDance150:=[[-96.211642913,-55.802423538,20.399474985,81.314112409,104.398123237,82.653744731],[26.065053722,9E9,9E9,9E9,9E9,9E9]];

  PROC main()
    WaitSyncTask sync_Dance_Start,taskYuMi;
    vDance:=[300,100,100,100];
    mvDance_2;
    mvHelix;
    vDance:=[500,100,100,100];
    mvDance_2;
  ENDPROC

  PROC mvHelix()
    nAxis_R:=2;
    pHelix_L:=mirror_robT(pHelix_R);
    SyncMoveOn sync_dance07,taskYuMi;
    MoveL helix(\Init\Neg,pHelix_L,nPitch_R,nDia_R,nAxis_R)\ID:=10,v300,z10,tHandDance\WObj:=wobj0;
    MoveC helix(\Neg,pHelix_L,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R),helix(\EndPoint\Neg,pHelix_L,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R)\ID:=20,helix_speed{1},z10,tHandDance\WObj:=wobj0;
    MoveC helix(\Neg,pHelix_L,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R),helix(\EndPoint\Neg,pHelix_L,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R)\ID:=30,helix_speed{2},z10,tHandDance\WObj:=wobj0;
    MoveC helix(\Neg,pHelix_L,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R),helix(\EndPoint\Neg,pHelix_L,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R)\ID:=40,helix_speed{3},z10,tHandDance\WObj:=wobj0;
    MoveC helix(\Neg,pHelix_L,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R),helix(\EndPoint\Neg,pHelix_L,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R)\ID:=50,helix_speed{4},z10,tHandDance\WObj:=wobj0;
    MoveC helix(\Neg,pHelix_L,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R),helix(\EndPoint\Neg,pHelix_L,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R)\ID:=60,helix_speed{5},z10,tHandDance\WObj:=wobj0;

    helix_return:=Offs(pHelix_L,0,-(nActPitch-nPitch_R),0);

    MoveL helix(\Init,helix_return,nPitch_R,nDia_R,nAxis_R)\ID:=65,v300,z10,tHandDance\WObj:=wobj0;
    MoveC helix(helix_return,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R),helix(\EndPoint,helix_return,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R)\ID:=70,helix_speed{5},z10,tHandDance\WObj:=wobj0;
    MoveC helix(helix_return,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R),helix(\EndPoint,helix_return,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R)\ID:=80,helix_speed{4},z10,tHandDance\WObj:=wobj0;
    MoveC helix(helix_return,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R),helix(\EndPoint,helix_return,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R)\ID:=90,helix_speed{3},z10,tHandDance\WObj:=wobj0;
    MoveC helix(helix_return,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R),helix(\EndPoint,helix_return,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R)\ID:=100,helix_speed{2},z10,tHandDance\WObj:=wobj0;
    MoveC helix(helix_return,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R),helix(\EndPoint,helix_return,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R)\ID:=110,helix_speed{1},z10,tHandDance\WObj:=wobj0;

    MoveL pHelix_L\ID:=120,v300,z1,tHandDance;

    nAxis_R:=3;
    MoveL helix(\Init,pHelix_L,nPitch_R,nDia_R,nAxis_R)\ID:=235,v300,z10,tHandDance\WObj:=wobj0;
    MoveC helix(pHelix_L,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R),helix(\EndPoint,pHelix_L,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R)\ID:=240,helix_speed{1},z10,tHandDance\WObj:=wobj0;
    MoveC helix(pHelix_L,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R),helix(\EndPoint,pHelix_L,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R)\ID:=250,helix_speed{2},z10,tHandDance\WObj:=wobj0;
    MoveC helix(pHelix_L,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R),helix(\EndPoint,pHelix_L,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R)\ID:=260,helix_speed{3},z10,tHandDance\WObj:=wobj0;
    MoveC helix(pHelix_L,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R),helix(\EndPoint,pHelix_L,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R)\ID:=270,helix_speed{4},z10,tHandDance\WObj:=wobj0;
    MoveC helix(pHelix_L,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R),helix(\EndPoint,pHelix_L,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R)\ID:=280,helix_speed{5},z10,tHandDance\WObj:=wobj0;

    helix_return:=Offs(pHelix_L,0,0,(nActPitch-nPitch_R));

    MoveL helix(\Init\Neg,helix_return,nPitch_R,nDia_R,nAxis_R)\ID:=285,v300,z10,tHandDance\WObj:=wobj0;
    MoveC helix(\Neg,helix_return,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R),helix(\EndPoint\Neg,helix_return,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R)\ID:=290,helix_speed{5},z10,tHandDance\WObj:=wobj0;
    MoveC helix(\Neg,helix_return,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R),helix(\EndPoint\Neg,helix_return,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R)\ID:=300,helix_speed{4},z10,tHandDance\WObj:=wobj0;
    MoveC helix(\Neg,helix_return,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R),helix(\EndPoint\Neg,helix_return,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R)\ID:=310,helix_speed{3},z10,tHandDance\WObj:=wobj0;
    MoveC helix(\Neg,helix_return,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R),helix(\EndPoint\Neg,helix_return,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R)\ID:=320,helix_speed{2},z10,tHandDance\WObj:=wobj0;
    MoveC helix(\Neg,helix_return,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R),helix(\EndPoint\Neg,helix_return,nPitch_R,nDia_R,nAxis_R,\nDiaOffs:=nDiaOffs_R)\ID:=330,helix_speed{1},z10,tHandDance\WObj:=wobj0;

    MoveL pHelix_L\ID:=340,v300,z1,tHandDance;

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

  FUNC robtarget mirror_robT(robtarget robT)
    robT.trans.y:=-robT.trans.y;
    robT.rot.q2:=-robT.rot.q2;
    robT.rot.q4:=-robT.rot.q4;
    robT.robconf.cf1:=-robT.robconf.cf1-1;
    robT.robconf.cf4:=-robT.robconf.cf4-1;
    robT.robconf.cf6:=-robT.robconf.cf6-1;
    robT.extax.eax_a:=-robT.extax.eax_a;
    RETURN robT;
  ENDFUNC

ENDMODULE