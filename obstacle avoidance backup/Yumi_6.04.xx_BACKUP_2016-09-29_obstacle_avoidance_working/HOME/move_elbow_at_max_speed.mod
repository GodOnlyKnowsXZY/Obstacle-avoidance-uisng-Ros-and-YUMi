MODULE move_elbow_at_max_speed
        PROC main()
        
		CONST jointtarget Sycnpos_R := [[0,-130,30,0,30,0],[-135,9E+09,9E+09,9E+09,9E+09,9E+09]];
		CONST jointtarget pc1 := [[52.3125,-81.8827,33.4559,70.2626,90.0619,-54.4188],[-162.388,9E+09,9E+09,9E+09,9E+09,9E+09]];

		

		
		FOR i FROM 1 TO 10 DO       
            MoveABSJ pc1, vmax, fine, tool0;
            MoveABSJ Sycnpos_R, vmax, fine, tool0;
        ENDFOR
		
		
    ENDPROC
ENDMODULE