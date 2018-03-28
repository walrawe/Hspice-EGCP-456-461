 
* This is sub 32nm FinFET prdictive model 
.options post=2 brief

.param tbsi=8.6n

** subckt for NMOS **

.subckt DGNMOS NVd NVgf NVgb NVs wdg=80n ldg=32n

.include './soinmos1.pm'  * front soi model card
.include './soinmos2.pm'  * back soi model card

.param pnch = 2e16
.param ptox = 1.4e-9
.param ptsi = 'tbsi' 
.param ptbox = 1.4e-9
.param npvthf0 = 0.29
.param npvthb0 = 0.29
.param esi = 11.7
.param eox = 3.9
.param nlambda1 ='(-1)*(ptox/(ptbox+ptsi/(esi/eox)))'
.param nlambda2 ='(-1)*(ptbox/(ptox+ptsi/(esi/eox)))'

.param delta1 = 0.008
.param delta2 = 0.008

.param Voff2=-0.09
.param N = 0.2
.param Vt = 0.0259
.param Voff1 = 0.0

mn1  NVd  NVgf1 NVs  0  nmos1 w='wdg/2' l='ldg'
+ as='wdg/2*2*ldg' ad='wdg/2*2*ldg'
+ ps='wdg/2+4*ldg' pd='wdg/2+4*ldg'
mn2  NVd  NVgb1 NVs  0  nmos2 w='wdg/2' l='ldg'
+ as='wdg/2*2*ldg' ad='wdg/2*2*ldg'
+ ps='wdg/2+4*ldg' pd='wdg/2+4*ldg'

En1 NVgf NVgf1 VOL = 'nlambda1*(-1*N*Vt*log(1+exp((((nlambda2*(npvthb0-(v(NVd)-v(NVs))*delta2)+(npvthf0-(v(NVd)-v(NVs))*delta1))/(1-(nlambda1*nlambda2))+Voff2)-(v(NVgb)-v(NVs))-Voff1)/N/Vt))+N*Vt*log(1+exp((((nlambda2*(npvthb0-(v(NVd)-v(NVs))*delta2)+(npvthf0-(v(NVd)-v(NVs))*delta1))/(1-(nlambda1*nlambda2))+Voff2)-Voff1)/N/Vt))-1*N*Vt*log(1+exp(((-1)*((nlambda2*(npvthb0-(v(NVd)-v(NVs))*delta2)+(npvthf0-(v(NVd)-v(NVs))*delta1))/(1-(nlambda1*nlambda2))+Voff2)-Voff1)/N/Vt))+N*Vt*log(1+exp((-Voff1)/N/Vt)))'
En2 NVgb NVgb1 VOL = 'nlambda2*(-1*N*Vt*log(1+exp((((nlambda1*(npvthf0-(v(NVd)-v(NVs))*delta1)+(npvthb0-(v(NVd)-v(NVs))*delta2))/(1-(nlambda1*nlambda2))+Voff2)-(v(NVgf)-v(NVs))-Voff1)/N/Vt))+N*Vt*log(1+exp((((nlambda1*(npvthf0-(v(NVd)-v(NVs))*delta1)+(npvthb0-(v(NVd)-v(NVs))*delta2))/(1-(nlambda1*nlambda2))+Voff2)-Voff1)/N/Vt))-1*N*Vt*log(1+exp(((-1)*((nlambda1*(npvthf0-(v(NVd)-v(NVs))*delta1)+(npvthb0-(v(NVd)-v(NVs))*delta2))/(1-(nlambda1*nlambda2))+Voff2)-Voff1)/N/Vt))+N*Vt*log(1+exp((-Voff1)/N/Vt)))'
.ends





** sub ckt for PMOS **

.subckt DGPMOS PVd PVgf PVgb PVs  wdg=1u ldg=32n

.include './soipmos1.pm' * front soi model card
.include './soipmos2.pm' * back soi model card

.param pnch =2e16
.param ptox = 1.4e-9
.param ptsi = 'tbsi' 
.param ptbox = 1.4e-9
.param ppvthf0 = -0.25
.param ppvthb0 = -0.25
.param esi = 11.7
.param eox = 3.9
.param plambda1 ='(-1)*(ptox/(ptbox+ptsi/(esi/eox)))'
.param plambda2 ='(-1)*(ptbox/(ptox+ptsi/(esi/eox)))'

.param pdelta1 = 0.008
.param pdelta2 = 0.008

.param Voff2 = 0.12
.param N = 0.2
.param Vt = 0.0259
.param Voff1 = 0.0

mp1  PVd  PVgf1 PVs  n1  pmos1 w='wdg/2' l='ldg'
+ as='wdg/2*2*ldg' ad='wdg/2*2*ldg'
+ ps='wdg/2+4*ldg' pd='wdg/2+4*ldg'
mp2  PVd  PVgb1 PVs  n1  pmos2 w='wdg/2' l='ldg'
+ as='wdg/2*2*ldg' ad='wdg/2*2*ldg'
+ ps='wdg/2+4*ldg' pd='wdg/2+4*ldg'

vvdd n1 0 1

Ep1 PVgf PVgf1 VOL = 'plambda1*(-1*(-1*N*Vt*log(1+exp((-1*((plambda2*(ppvthb0-(v(PVd)-v(PVs))*pdelta2)+(ppvthf0-(v(PVd)-v(PVs))*pdelta1))/(1-(plambda1*plambda2))+Voff2)+(v(PVgb)-v(PVs))+Voff1)/N/Vt))+N*Vt*log(1+exp((-1*((plambda2*(ppvthb0-(v(PVd)-v(PVs))*pdelta2)+(ppvthf0-(v(PVd)-v(PVs))*pdelta1))/(1-(plambda1*plambda2))+Voff2)+Voff1)/N/Vt))-1*N*Vt*log(1+exp((((plambda2*(ppvthb0-(v(PVd)-v(PVs))*pdelta2)+(ppvthf0-(v(PVd)-v(PVs))*pdelta1))/(1-(plambda1*plambda2))+Voff2)+Voff1)/N/Vt))+N*Vt*log(1+exp((Voff1)/N/Vt))))' 
Ep2 PVgb PVgb1 VOL = 'plambda2*(-1*(-1*N*Vt*log(1+exp((-1*((plambda1*(ppvthf0-(v(PVd)-v(PVs))*pdelta1)+(ppvthb0-(v(PVd)-v(PVs))*pdelta2))/(1-(plambda1*plambda2))+Voff2)+(v(PVgf)-v(PVs))+Voff1)/N/Vt))+N*Vt*log(1+exp((-1*((plambda1*(ppvthf0-(v(PVd)-v(PVs))*pdelta1)+(ppvthb0-(v(PVd)-v(PVs))*pdelta2))/(1-(plambda1*plambda2))+Voff2)+Voff1)/N/Vt))-1*N*Vt*log(1+exp((((plambda1*(ppvthf0-(v(PVd)-v(PVs))*pdelta1)+(ppvthb0-(v(PVd)-v(PVs))*pdelta2))/(1-(plambda1*plambda2))+Voff2)+Voff1)/N/Vt))+N*Vt*log(1+exp((Voff1)/N/Vt))))'
.ends

**Sample Code
*X1 nd vg1 vg1 0 DGNMOS
**X2 nd vg1 vg1 nvdd DGPMOS
*
*vvdd nvdd 0 0.9
*vfg vg1 0 0
*vd  nd 0 0.05
*
*.op
*.dc vfg 0 0.9 0.1
*.print i(vd)
*.end
*
