# PIC-ADC
Use of internal ADC in PIC 16F877
The PIC 16F877 has a 10-bit, 8-channel Analog-to-Digital converter. The A/D module has high and low voltage reference input that is software selectable to some combination of VDD, VSS, RA2, or RA3. The A/D converter has a unique feature of being able to operate while the device is in SLEEP mode. To operate in SLEEP, the A/D clock must be derived from the A/D’s internal RC oscillator. The A/D module has four registers. These registers are: A/D Result High Register (ADRESH)
A/D Result Low Register (ADRESL)
A/D Control Register0 (ADCON0)
A/D Control Register1 (ADCON1)
Steps for doing an A/D Conversion
• Configure the A/D module:
– Configure analog pins/voltage reference and digital I/O (ADCON1)
– Select A/D input channel (ADCON0)
– Select A/D conversion clock (ADCON0)
– Turn on A/D module (ADCON0)
• Configure A/D interrupt (if desired):
– Clear ADIF bit
– Set ADIE bit
– Set PEIE bit
– Set GIE bit
• Start conversion:
– Set GO/DONE bit (ADCON0)
• Wait for A/D conversion to complete, by either
– Polling for the GO/DONE bit to be cleared OR Waiting for the A/D interrupt
• Read A/D result register pair (ADRESH: ADRESL), clear bit ADIF if required
