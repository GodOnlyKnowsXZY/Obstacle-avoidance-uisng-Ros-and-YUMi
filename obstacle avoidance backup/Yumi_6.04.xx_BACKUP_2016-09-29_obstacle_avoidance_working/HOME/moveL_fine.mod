MODULE moveL_fine
    PROC main()
        
		CONST jointtarget Sycnpos_R := [[0,-130,30,0,30,0],[-135,9E+09,9E+09,9E+09,9E+09,9E+09]];
        CONST jointtarget j1 := [[45,-20,20,10,30,0],[0,9E+09,9E+09,9E+09,9E+09,9E+09]];
        CONST robtarget t1 := [[456.30,91.51,626.11],[0.0595514,-0.176676,0.705283,0.683971],[0,0,0,4],[-174.877,9E+09,9E+09,9E+09,9E+09,9E+09]];
        CONST robtarget t2 := [[446.30,41.51,626.11],[0.0595514,-0.176676,0.705283,0.683971],[0,0,0,4],[-174.877,9E+09,9E+09,9E+09,9E+09,9E+09]];
      
        MoveABSJ j1, vmax, fine, tool0;

        FOR i FROM 1 TO 10 DO                     
            MoveL t1, vmax,fine,tool0; 
            MoveL t2, vmax,fine,tool0;   
        ENDFOR
		
		MoveABSJ Sycnpos_R, vmax, fine, tool0;
		
    ENDPROC
ENDMODULE