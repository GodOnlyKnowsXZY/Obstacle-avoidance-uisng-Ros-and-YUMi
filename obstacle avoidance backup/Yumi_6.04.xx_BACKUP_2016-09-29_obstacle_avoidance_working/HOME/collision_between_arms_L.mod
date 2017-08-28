MODULE Collide
    PROC main()
	
		CONST jointtarget Sycnpos_L := [[0,-130,30,0,30,0],[135,9E+09,9E+09,9E+09,9E+09,9E+09]];
        CONST jointtarget Col_Pos := [[0,0,0,0,0,0],[0,9E+09,9E+09,9E+09,9E+09,9E+09]];
       
        MoveABSJ Col_Pos, vmax, fine, tool0;
		
		MoveABSJ Sycnpos_L, vmax, fine, tool0;
        
    ENDPROC

ENDMODULE