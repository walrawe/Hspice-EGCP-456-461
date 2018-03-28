****gdi cmos full adder
.include '32nm_LP.pm'

.options post
.temp 40
.global Vdd
.global Vss

vSupply Vdd 0 0.9V
vGround Vss 0 0V

****For gates G1 and G2 only, use:
.param techlength=32n
.param wpmos=64n
.param wnmos=32n

.subckt cell g_input p_input n_input d_output
MPN1 d_output g_input p_input p_input PMOS W=wpmos L=techlength
MNN1 d_output g_input n_input n_input NMOS W=wnmos L=techlength
.ends

Xg1 B_in Vdd Vss out1 cell
Xg2 A_in B_in out1 out2 cell
Xg3 out2 Vdd Vss out3 cell
Xg4 C_in out2 out3 sum cell
Xg5 out3 C_in B_in Cout cell



********pulse with delay
VA A_in Vss pwl (0ns 0v 680ns 0v  700ns 0.9v)

VB B_in Vss pwl (0ns 0v 300ns 0v 320ns 0.9v 420ns 0.9v 440ns 0v 500ns 0v  520ns 0.9v 620ns 0.9v 640ns 0v 1000ns 0v 1020ns 0.9v 1120ns 0.9v 1140ns 0v 1200ns 0v 1220ns 0.9v 1320ns 0.9v 1340ns 0v)

VC C_in Vss pwl (0ns 0v 100ns 0v 120ns 0.9v 220ns 0.9v 240ns 0v 500ns 0v 520ns 0.9v 620ns 0.9v 640ns 0v 800ns 0v 820ns 0.9v 920ns 0.9v 940ns 0v 1200ns 0v 1220ns 0.9v 1320ns 0.9v 1340ns 0v)


***single input
*VA A_in Vss
*VB B_in Vdd
*VC C_in Vdd

*******pulse
VA A_in Vss pulse (0 0.9 390n 20ns 20ns 390n 820n )
VB B_in Vss pulse (0 0.9 190n 20ns 20ns 190n 820n )
VC C_in Vss pulse (0 0.9 90n 20ns 20ns 90n 820n )

.op
.tran 1p 2u
.option post
.end
