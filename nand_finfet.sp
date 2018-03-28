* FinFET Transient Behavior
* 
* Model file for 22 nm MOSFET technology from ASU PTM

.include '32nm_finfet.pm'
.global Vdd
.global Vss

vSupply1 Vdd_N 0 1V
vSupply2 Vdd_L 0 1V

vGround1 Vss_N 0 0V
vGround2 Vss_L 0 0V

.SUBCKT nand in_1 in_2 in_3 in_4 out Vdd Vss

XNP1 out in_1 in_1 Vdd dgpmos w=80n l=32n
XNP2 out in_2 in_2 Vdd dgpmos w=80n l=32n
XNP3 out in_3 in_3 Vdd dgpmos w=80n l=32n
XNP4 out in_4 in_4 Vdd dgpmos w=80n l=32n

XNN1 out in_1 in_1 n1 dgnmos w=80n l=32n
XNN2 n1 in_2 in_2 n2 dgnmos w=80n l=32n
XNN3 n2 in_3 in_3 n3 dgnmos w=80n l=32n
XNN4 n3 in_4 in_4 Vss dgnmos w=80n l=32n
 
.ENDS nand


XNAND A B C D out Vdd_N Vss_N nand

VA A Vss_N pwl (0 1 100n 1 150n 0 350n 0 400n 1 1800n 1 )
VB B Vss_N pwl (0 1 500n 1 550n 0 750n 0 800n 1 1800n 1 )
VC C Vss_N pwl (0 1 900n 1 950n 0 1150n 0 1200n 1 1800n 1)
VD D Vss_N pwl (0 1 1300n 1 1350n 0 1550n 0 1600n 1 1800n 1)

XLOAD out out out out out_L Vdd_L Vss_L nand

.op
.tran 1p 5u
.option post
.end

