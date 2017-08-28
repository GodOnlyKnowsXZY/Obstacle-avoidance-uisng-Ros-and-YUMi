MODULE go_to_sync_R
        PROC main()
        
		CONST jointtarget Sycnpos_R := [[0,-130,30,0,40,0],[-135,9E+09,9E+09,9E+09,9E+09,9E+09]];
        
		MoveABSJ Sycnpos_R, vmax, fine, tool0;
		
    ENDPROC
ENDMODULE