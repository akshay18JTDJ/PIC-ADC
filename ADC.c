#include<htc.h>
__CONFIG(FOSC_HS & WDTE_OFF);
#define _XTAL_FREQ 4000000
void main()
{
TRISD = 0x00;
TRISC0 = 0;
TRISC1 = 0;
ADCON1 = 0x80;
ADCON0 = 0x00;
ADON = 1;
while(1)
{
GO_nDONE = 1;
while(GO_nDONE==1);
PORTD = ADRESL;
PORTC = ADRESH;
}
}