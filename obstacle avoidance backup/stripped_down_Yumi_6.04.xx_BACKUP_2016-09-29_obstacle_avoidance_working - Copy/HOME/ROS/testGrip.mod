MODULE Gripper_read
    
PROC readGripper()
    left_joints.extax.eax_b := Hand_GetActualPos();
ENDPROC

ENDMODULE