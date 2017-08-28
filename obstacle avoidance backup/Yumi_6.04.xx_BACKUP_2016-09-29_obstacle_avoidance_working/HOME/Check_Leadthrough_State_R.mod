MODULE Check_Leadthrough_State_R
!
! DESCRIPTION
!	This program checks the state of Lead-through on right arm of Yumi
!	
!	
! $Revision: 1.0 $
!

CONST string MODULE_NAME := "Check_Leadthrough_State_R";
CONST string LOGFILE_NAME := MODULE_NAME + ".log";
  
VAR iodev logfile;		
PERS Num ASTready:=0;
PERS Num ASTerror:=0;		

PROC enable_leadthrough()
   
		 
	! Enable Lead through on Mechanical Unit ROB_R
	  	 	 
	SetLeadThrough\On;
	Write logfile, "Lead through is activated on mechanical unit ROB_R"; 	 	 
	  
		  
ENDPROC


PROC disable_leadthrough()

	! Disable Lead through on Mechanical Unit ROB_R
	 
	SetLeadThrough\Off;
	Write logfile, "Lead through is deactivated on mechanical unit ROB_R"; 	
	 

ENDPROC

PROC state_leadthrough()
  
! Check the current state of Lead through on Mechanical Unit ROB_R 
	 
  IF IsLeadThrough(\MechUnit:=ROB_R\Set) THEN 
	Write logfile, "Current status of Lead through is Active for ROB_R";
  ELSE
    Write logfile, "Current status of Lead through is Disable for ROB_R";
  ENDIF 
	  		  
ENDPROC


PROC main()
	ASTready:=0;
	ASTerror:=0;
			
  TPErase;
  Close logFile;
  Open diskhome\File := LOGFILE_NAME, logFile;
  Write logfile, CDate() + " " + CTime() + " :"\NoNewLine;
  Write logfile," Starting " + LOGFILE_NAME;
    
  IF IsLeadThrough(\MechUnit:=ROB_R\Set) THEN 
	Write logfile, "Current status of Lead through is Active for ROB_R";
	disable_leadthrough;
  ELSE
    Write logfile, "Current status of Lead through is Disable for ROB_R";
    enable_leadthrough;
  ENDIF 
  
  state_leadthrough;  
   
  Write logfile, CDate() + " " + CTime() + " :"\NoNewLine;
  Write logfile, "End " + LOGFILE_NAME;
  Close logfile;
	
  ASTready := 1;
ENDPROC
	
ENDMODULE












