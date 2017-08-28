MODULE moveC_z200
        PROC main()
        
		CONST jointtarget Sycnpos_R := [[0,-130,30,0,30,0],[-135,9E+09,9E+09,9E+09,9E+09,9E+09]];
        CONST jointtarget j1 := [[45,-20,20,10,30,0],[0,9E+09,9E+09,9E+09,9E+09,9E+09]];
        CONST robtarget t1 := [[456.30,91.51,626.11],[0.0595514,-0.176676,0.705283,0.683971],[0,0,0,4],[-174.877,9E+09,9E+09,9E+09,9E+09,9E+09]];
        CONST robtarget pc1 := [[486.30,61.51,626.11],[0.0595514,-0.176676,0.705283,0.683971],[0,0,0,4],[-174.877,9E+09,9E+09,9E+09,9E+09,9E+09]];
        CONST robtarget pc2 := [[426.30,71.51,626.11],[0.0595514,-0.176676,0.705283,0.683971],[0,0,0,4],[-174.877,9E+09,9E+09,9E+09,9E+09,9E+09]];
        CONST robtarget t2 := [[446.30,41.51,626.11],[0.0595514,-0.176676,0.705283,0.683971],[0,0,0,4],[-174.877,9E+09,9E+09,9E+09,9E+09,9E+09]];
      
        MoveABSJ j1, vmax, fine, tool0;

        FOR i FROM 1 TO 10 DO       
            MoveC pc1, t1, vmax, z200, tool0;
            MoveC pc2, t2, vmax, z200, tool0; 
        ENDFOR
		
		MoveABSJ Sycnpos_R, vmax, fine, tool0;
		
		ERROR
		IF ERRNO=ERR_COLL_STOP THEN
			StorePath;
            MoveAbsJ Sycnpos_R\NoEOffs,v100,fine,tool0;
            RestoPath;
            ClearPath;
            StartMove;
            RETRY;                                  
		ELSE
			Stop;
		ENDIF
		
		
		
		
    ENDPROC
ENDMODULE