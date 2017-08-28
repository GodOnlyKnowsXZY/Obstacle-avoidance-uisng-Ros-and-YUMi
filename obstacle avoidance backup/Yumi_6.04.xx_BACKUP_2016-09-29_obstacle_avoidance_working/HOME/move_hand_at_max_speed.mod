MODULE move_hand_at_max_speed
        PROC main()
        
		CONST jointtarget Sycnpos_R := [[0,-130,30,0,40,0],[-135,9E+09,9E+09,9E+09,9E+09,9E+09]];
		CONST jointtarget pc1 := [[45.764,-68.5067,-55.699,-12.4601,90.7463,51.5616],[-58.914,9E+09,9E+09,9E+09,9E+09,9E+0]];
		CONST jointtarget pc2 := [[46.0727,0.683649,-55.699,-12.4601,90.7464,51.5616],[-58.914,9E+09,9E+09,9E+09,9E+09,9E+09]];
		

		
		FOR i FROM 1 TO 10 DO       
            MoveABSJ pc1, vmax, fine, tool0;
            MoveABSJ pc2, vmax, fine, tool0; 
        ENDFOR
		
		MoveABSJ Sycnpos_R, vmax, fine, tool0;
		
    ENDPROC
ENDMODULE
