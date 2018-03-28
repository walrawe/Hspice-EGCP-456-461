* cuircuit
.include '45nm.txt'
.tran 1ps 60ns
.options post
.temp 40
.global Vdd
.global Vss
.param techlength=45n

vSupply Vdd 0 1V
vLoad load_vdd 0 1V
vGround Vss 0 0V

****For gates G1 and G2 only, use:
.param wpmos=2*techlength
.param wnmos=2*techlength

.param Vswing = 1.1

****2 input NAND gate
****Trnstr Drain Gate Source Substrate Type Width Length

.subckt NAND N_in1 N_in2  N_out
MPN1 N_out N_in1 Vdd Vdd PMOS W=wpmos L=techlength
MPN2 N_out N_in2 Vdd Vdd PMOS W=wpmos L=techlength
MNN1 N_out N_in1 N2 Vss NMOS W=wnmos L=techlength
MNN3 N2 N_in2 Vss Vss NMOS W=wnmos L=techlength
.ends

****equation

XG1 C C out1 NAND
XG4 C B out2 NAND
XG6 B B out3 NAND

XG2 out1 out2 out4 NAND
XG5 A out3 out5 NAND

XG3 out4 out5 out6 NAND

XG7 out6 load_vdd out7 NAND

 ****Input
vA A Vss pulse (0 Vswing 0 0.005ns 0.005ns 0.5ns 1ns)
vB B Vss pulse (0 Vswing 0 0.005ns 0.005ns 0.4ns 1ns)
vC C Vss pulse (0 Vswing 0 0.005ns 0.005ns 0.5ns 1ns)


****delay measurement of A with respect to circuitout

.measure TRAN tdelay1 TRIG v(a) val=0.45 fall=2 td=0n TARG v(out6) val=0.45 rise=2
.measure TRAN tdelay2 TRIG v(a) val=0.45 rise=2 td=0n TARG v(out6) val=0.45 fall=2


.print tdelay1
.print tdelay2


.measure dynpower avg power from 0n to 60n
.print dynpower
.end
