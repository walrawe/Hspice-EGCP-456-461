* cuircuit
.include '45nm.txt'
.tran 1ps 60ns
.options post
.temp 40
.global Vdd
.global Vss
.param techlength=45n

vSupply Vdd 0 1.1V
vLoad load_vdd 0 1.1V
vGround Vss 0 0V

****Width for Pmos and Nmos
.param wpmos=2*techlength
.param wnmos=2*techlength
.param PGwnmos=4*techlength
.param Vswing = 1.1

****Trnstr Drain Gate Source Substrate Type Width Length************

*Power gate
MPN1 BVss Vdd Vss Vss NMOS W=PGwnmos L=techlength

*2 input NAND gate
.subckt NAND N_in1 N_in2  N_out
MPN1 N_out N_in1 Vdd Vdd PMOS W=wpmos L=techlength
MPN2 N_out N_in2 Vdd Vdd PMOS W=wpmos L=techlength
MNN1 N_out N_in1 N2 BVss NMOS W=wnmos L=techlength
MNN3 N2 N_in2 BVss BVss NMOS W=wnmos L=techlength
.ends

*Logic circuit connection

****Connection for gate diagram
XG1 C C out1 NAND
XG2 C B out2 NAND
XG3 B B out3 NAND
XG4 out1 out2 out4 NAND
XG5 A out3 out5 NAND
XG6 out4 out5 out6 NAND
XG7 out6 load_vdd out7 NAND


* Inputs ABC = logic '000' case
vA A Vss pulse (0 0 0 0.005ns 0.005ns 0.5ns 1ns)
vB B Vss pulse (0 0 0 0.005ns 0.005ns 0.4ns 1ns)
vC C Vss pulse (0 0 0 0.005ns 0.005ns 0.5ns 1ns)
.measure tran leakage0 rms I(vSupply) FROM=0n TO=20n
.print leakage0
.alter
.tran 1p 60ns



* Inputs ABC = logic '001' case
vA A Vss pulse (0 0 0 0.005ns 0.005ns 0.5ns 1ns)
vB B Vss pulse (0 0 0 0.005ns 0.005ns 0.4ns 1ns)
vC C Vss pulse (Vswing Vswing 0 0.005ns 0.005ns 0.5ns 1ns)
.measure tran leakage1 rms I(vSupply) FROM=0n TO=20n
.print leakage1
.alter
.tran 1p 60ns


* Inputs ABC = logic '010' case
vA A Vss pulse (0 0 0 0.005ns 0.005ns 0.5ns 1ns)
vB B Vss pulse (Vswing Vswing 0 0.005ns 0.005ns 0.4ns 1ns)
vC C Vss pulse (0 0 0 0.005ns 0.005ns 0.5ns 1ns)
.measure tran leakage2 rms I(vSupply) FROM=0n TO=20n
.print leakage2
.alter
.tran 1p 60ns

* Inputs ABC = logic '011' case
vA A Vss pulse (0 0 0 0.005ns 0.005ns 0.5ns 1ns)
vB B Vss pulse (Vswing Vswing 0 0.005ns 0.005ns 0.4ns 1ns)
vC C Vss pulse (Vswing Vswing 0 0.005ns 0.005ns 0.5ns 1ns)

.measure tran leakage3 rms I(vSupply) FROM=0n TO=20n
.print leakage3
.alter
.tran 1p 60ns

* Inputs ABC = logic '100' case
vA A Vss pulse (Vswing Vswing 0 0.005ns 0.005ns 0.5ns 1ns)
vB B Vss pulse (0 0 0 0.005ns 0.005ns 0.4ns 1ns)
vC C Vss pulse (0 0 0 0.005ns 0.005ns 0.5ns 1ns)
.measure tran leakage4 rms I(vSupply) FROM=0n TO=20n
.print leakage4
.alter
.tran 1p 60ns


* Inputs ABC = logic '101' case
vA A Vss pulse (Vswing Vswing 0 0.005ns 0.005ns 0.5ns 1ns)
vB B Vss pulse (0 0 0 0.005ns 0.005ns 0.4ns 1ns)
vC C Vss pulse (Vswing Vswing 0 0.005ns 0.005ns 0.5ns 1ns)
.measure tran leakage5 rms I(vSupply) FROM=0n TO=20n
.print leakage5
.alter
.tran 1p 60ns


* Inputs ABC = logic '110' case

vA A Vss pulse (Vswing Vswing 0 0.005ns 0.005ns 0.5ns 1ns)
vB B Vss pulse (Vswing Vswing 0 0.005ns 0.005ns 0.4ns 1ns)
vC C Vss pulse (0 0 0 0.005ns 0.005ns 0.5ns 1ns)
.measure tran leakage6 rms I(vSupply) FROM=0n TO=20n
.print leakage6
.alter
.tran 1p 60ns


* Inputs ABC = logic '111' case
vA A Vss pulse (Vswing Vswing 0 0.005ns 0.005ns 0.5ns 1ns)
vB B Vss pulse (Vswing Vswing 0 0.005ns 0.005ns 0.4ns 1ns)
vC C Vss pulse (Vswing Vswing 0 0.005ns 0.005ns 0.5ns 1ns)
.measure tran leakage7 rms I(vSupply) FROM=0n TO=20n
.print leakage7

.end
