MODULE go_to_sync_L
    PROC main()
	
		CONST jointtarget Sycnpos_L := [[0,-130,30,0,40,0],[135,9E+09,9E+09,9E+09,9E+09,9E+09]];

		
		MoveABSJ Sycnpos_L, vmax, fine, tool0;
        
    ENDPROC

ENDMODULE