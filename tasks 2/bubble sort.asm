
LIST                    p=18f4550             
INCLUDE                 <p18f4550.inc>
    
numtemp EQU 0x10
i EQU 0x11
j EQU 0x12
n EQU 0x13
ii EQU 0x14
ARR0 EQU 0X20
ARR1 EQU 0X21
ARR2 EQU 0X22
ARR3 EQU 0X23
ARR4 EQU 0X24
ARR5 EQU 0X25
ARR6 EQU 0X26
ARR7 EQU 0X27
ARR8 EQU 0X28
ARR9 EQU 0X29
ARR10 EQU 0X2A
ARR11 EQU 0X2B
ARR12 EQU 0X2C
ARR13 EQU 0X2D
ARR14 EQU 0X2E
ARR15 EQU 0X2F
 
ORG 0x00

 MOVLW d'99'
 MOVWF ARR0
 MOVLW d'1'
 MOVWF ARR1
 MOVLW d'79'
 MOVWF ARR2
 MOVLW d'48'
 MOVWF ARR3
 MOVLW d'89'
 MOVWF ARR4
 MOVLW d'18'
 MOVWF ARR5
 MOVLW d'55'
 MOVWF ARR6
 MOVLW d'19'
 MOVWF ARR7
 MOVLW d'5'
 MOVWF ARR8
 MOVLW d'250'
 MOVWF ARR9
 MOVLW d'15'
 MOVWF ARR10
 MOVLW d'22'
 MOVWF ARR11
 MOVLW d'101'
 MOVWF ARR12
 MOVLW d'15'
 MOVWF ARR13
 MOVLW d'16'
 MOVWF ARR14
 MOVLW d'45'
 MOVWF ARR15
 

 
 
MOVLW d'16'
MOVWF n
 
MOVF n,w
ADDLW -1
MOVWF i


LOOP1
LFSR 0,0x20
LFSR 1,0x21
MOVLW d'15'
;SUBFWB i,w
;MOVWF ii
;MOVF ii,w
;SUBWF n,w
;ADDLW -1
MOVWF j


LOOP2
 
MOVF INDF0,W
    
CPFSGT INDF1
CALL SWAP

 
 
 
INCF FSR0L,F
INCF FSR1L,F
 
DECFSZ j,F
GOTO LOOP2
DECFSZ i,F
GOTO LOOP1
 
GOto eee
SWAP
MOVFF INDF0,numtemp
MOVFF INDF1,INDF0
MOVFF numtemp,INDF1
Return
eee
END
 
 

 
 
 
 
 