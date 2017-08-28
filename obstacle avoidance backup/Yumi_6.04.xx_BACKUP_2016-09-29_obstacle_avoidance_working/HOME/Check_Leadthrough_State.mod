MODULE Check_Leadthrough_State
!
! DESCRIPTION
!	This program checks the state of Lead-through on both arms of Yumi
!	
!	
! $Revision: 1.0 $
!

CONST string MODULE_NAME := "Check_Leadthrough_State";
CONST string LOGFILE_NAME := MODULE_NAME + ".log";
  
VAR iodev logfile;		
PERS Num ASTready:=0;
PERS Num ASTerror:=0;		

PROC state_leadthrough()
  
! Check the current state of Lead through on Mechanical Unit ROB_R 
	 
  IF IsLeadThrough(\MechUnit:=ROB_R\Set) THEN 
	Write logfile, "Current status of Lead through is Active for ROB_R";
  ELSE
    Write logfile, "Current status of Lead through is Disable for ROB_R";
  ENDIF 
	 
! Check the current state of Lead through on Mechanical Unit ROB_L 
	 
  IF IsLeadThrough(\MechUnit:=ROB_L\Set) THEN 
	Write logfile, "Current status of Lead through is Active for ROB_L";
  ELSE
    Write logfile, "Current status of Lead through is Disable for ROB_L";
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
    
  state_leadthrough;
   
  Write logfile, CDate() + " " + CTime() + " :"\NoNewLine;
  Write logfile, "End " + LOGFILE_NAME;
  Close logfile;
	
  ASTready := 1;
ENDPROC
	
ENDMODULE