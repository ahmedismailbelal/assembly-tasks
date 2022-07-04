LIST                    p=18f4550             
INCLUDE                 <p18f4550.inc>

; AHMED ISMAIL BELAL ABDULLAH 20190016
; MAHINAZ ABDULLAH ABDELGHANI ABDULLAH 20190411
    

ORG 0x000
    GOTO MAIN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

MAIN: 
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    R2 EQU 0x21
    R3 EQU 0x22			; VALUES FOR THE DELAY FUNC 
    R4 EQU 0x23
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    i EQU 0x01			    ; COUNTER FOR OUTER LOOP OF BUBBLE SORT
    j EQU 0x02			    ; COUNTER FOR INNER LOOP OF BUBBLE SORT
    n EQU 0x03			    ; SIZE OF ARRAY FOR BUBBEL SORT
    NEWTEMP EQU 0x04		    ; TEMP VALUER FOR BUBBEL SORT
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    A1 EQU 0x30			    ; SELF DECLARTION FOR SENDING IT TO PORTB
    A2 EQU 0x31			    
    A3 EQU 0x32			    
    A4 EQU 0x33
    A5 EQU 0x34
    A6 EQU 0x35
    A7 EQU 0x36
    A8 EQU 0x37
    A9 EQU 0x38
    A10 EQU 0x39

    MOVLW D'0'			    ; RANDOM VALUES
    MOVWF A1
    MOVLW D'3'
    MOVWF A2
    MOVLW D'6'
    MOVWF A3
    MOVLW D'9'
    MOVWF A4
    MOVLW D'7'
    MOVWF A5
    MOVLW D'8'
    MOVWF A6
    MOVLW D'4'
    MOVWF A7
    MOVLW D'5'
    MOVWF A8
    MOVLW D'1'
    MOVWF A9
    MOVLW D'2'
    MOVWF A10
    
    B1 EQU 0x10				; THE ADDRESSES THAT MEANT TO STORE THE DATA INTO IT
    B2 EQU 0x11
    B3 EQU 0x12
    B4 EQU 0x13
    B5 EQU 0x14
    B6 EQU 0x15
    B7 EQU 0x16
    B8 EQU 0x17
    B9 EQU 0x18
    B10 EQU 0x19
 
 
  
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    COUNTER EQU 0x20				;COUNTER FOR THE NAMES AND IDS
    VALUECOUNTER EQU D'44'
    MOVLW VALUECOUNTER
    MOVWF COUNTER
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ORG 0x500					; THE NAMES AND IDS
    NAME1 DB "AHMED ISMAIL"
    NAME2 DB "MAHINAZ ABDULLAH"
    ID1 DB "20190016"
    ID2 DB "20190411"
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    MOVLW 0x0					; PUTTING THE NAMES AND IDS IN PROGRAM MEMEORY
    MOVWF TBLPTR				; AND TAKE PORTC AS OUTPUT
    MOVLW 0x05	
    MOVWF TBLPTRH
    CLRF TRISC
    LOOP:				    ; WRITE IN PORT C 
	TBLRD*
	MOVFF TABLAT,PORTC
	INCF TBLPTRL,F
	DECF COUNTER,F
	BNZ LOOP
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     
    SETF TRISB				    ; READS FROM PORTB
    LFSR 0,0x30
    MOVF PORTB,W
    MOVFF PLUSW0,B1
    CALL DELAY
    
    LFSR 0,0x31
    MOVF PORTB,W
    MOVFF PLUSW0,B2
    CALL DELAY
    
    LFSR 0,0x32
    MOVF PORTB,W
    MOVFF PLUSW0,B3
    CALL DELAY
    
    LFSR 0,0x33
    MOVF PORTB,W
    MOVFF PLUSW0,B4
    CALL DELAY
    
    LFSR 0,0x34
    MOVF PORTB,W
    MOVFF PLUSW0,B5
    CALL DELAY
    
    LFSR 0,0x35
    MOVF PORTB,W
    MOVFF PLUSW0,B6
    CALL DELAY
    
    LFSR 0,0x36
    MOVF PORTB,W
    MOVFF PLUSW0,B7
    CALL DELAY
    
    LFSR 0,0x37
    MOVF PORTB,W
    MOVFF PLUSW0,B8
    CALL DELAY
    
    LFSR 0,0x38
    MOVF PORTB,W
    MOVFF PLUSW0,B9
    CALL DELAY
    
    LFSR 0,0x39
    MOVF PORTB,W
    MOVFF PLUSW0,B10
    CALL DELAY
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    CALL SORT
    H GOTO H
   
DELAY				    ; DELAY ON 100MS                     
	    MOVLW D'20'
	    MOVWF R4
    BACK    MOVLW D'100'
	    MOVWF R3
    AGAIN   MOVLW D'50'
	    MOVWF R2
    HERE    NOP
	    NOP
	    DECF R2,F
	    BNZ HERE
	    DECF R3,F
	    BNZ AGAIN
	    DECF R4,F
	    BNZ BACK
	    RETURN
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SORT:				; BUBBLE SORT
     
    MOVLW d'10'
    MOVWF n
    MOVLW d'10'
    MOVWF i


SORTLOOP1:
    LFSR 1,0x10
    LFSR 2,0x11
    MOVLW d'9'
    MOVWF j

SORTLOOP2:
    MOVF INDF1,W
    CPFSGT INDF2
    CALL SWAP
    INCF FSR1L,F
    INCF FSR2L,F
    DECFSZ j,F
    GOTO SORTLOOP2
    DECFSZ i,F
    GOTO SORTLOOP1
    RETURN

SWAP:    
    MOVFF INDF1,NEWTEMP
    MOVFF INDF2,INDF1
    MOVFF NEWTEMP,INDF2
    Return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
 
END $

