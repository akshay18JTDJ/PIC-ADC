list p = 16f877 ; list directive to define processor
#include <p16f877.inc> ; processor specific variable definitions
__CONFIG _CP_OFF & _WDT_OFF & _BODEN_ON & _PWRTE_ON & _HS_OSC & _WRT_ENABLE_ON & _LVP_ON & _DEBUG_OFF & _CPD_OFF
ORG 0x000 ; processor reset vector
goto main ; go to beginning of program
main
BANKSEL TRISD
MOVLW 00H ; copy 00H to W reg.
MOVWF TRISD ; copy W reg. to TRISD to make PORTD as output
BCF TRISC,0
BCF TRISC,1
START:
BANKSEL ADCON1
MOVLW 80H ; copy 80H to W reg.
MOVWF ADCON1 ; copy W reg. to ADCON1 to select right justified result and configure all ADC pins as analog input pins
BANKSEL ADCON0
MOVLW 00H ; copy 00H to W reg.
MOVWF ADCON0 ; copy W reg. to ADCON0 to use clk as fosc/2 and select ch. 0 of ADC
BSF ADCON0, ADON ; set ADON bit to turn on ADC module
BSF ADCON0, 2 ; set go/done bit to start ADC conversion
HERE: BTFSC ADCON0, 2 ; wait till go/done bit becomes 0
GOTO HERE
BANKSEL ADRESL
MOVF ADRESL, W ; copy result from ADRESL to W reg.
BANKSEL PORTD
MOVWF PORTD ; copy W reg. to PORTD
BANKSEL ADRESL
MOVF ADRESH, W ; copy result from ADRESH to W reg.
BANKSEL PORTC
MOVWF PORTC ; copy W reg. to PORTC
GOTO START ; continous loop
END ; directive 'end of program'