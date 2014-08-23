// 0;buck.sml
//*************************************************************************************************
//                                           SML Netlist File                                     *
//                                   created by Ansys Simplorer 2014.0                            *
//                                                                                                *
//*************************************************************************************************

// Global Ports

// begin toplevel circuit

INTERN PULSE Square_wave1 (FREQ:=50000, TPERIO:=Tend + 1, AMPL:=1, PHASE:=0, PERIO:=0, OFF:=1, TDELAY:=0 ) ;
INTERN R R1 N1:= out , N2:= GND (R:=5);
INTERN C C1 N1:= out , N2:= GND (C:=2.2e-005, V0:=0);
INTERN L L1 N1:= N0019 , N2:= out (L:=5e-005, I0:=0);
INTERN E E1 N1:= GND , N2:= N0021 (EMF:= 12, PARTDERIV:= 1, SPC:=0, AC_PHASE := 0, AC_MAG := 0.001);
INTERN DEQUL D1 A:= GND , C:= N0019 ( VF:=0.8, RB:=0.001, RR:=100000 ) ;
MODEL PWM PWM1 ( PERIOD:= 2e-005, DC:= 0.2, TD:= 0, PHASE:= 0) SRC: DB(Lib:="Simplorer Elements\Basic Elements\Basic Elements") ;
INTERN S S1 N1 := N0021 , N2 := N0019 ( CTRL:=PWM1.VAL) ;

// end toplevel circuit

SIMCTL TR
{
SIMCFG SECM Options_SECM ( Iteratmax:=20, IEmax:=0.001, VEmax:=0.001);
SIMCFG SIMPLORER_TR TR ( Tend := 0.001, Hmin := 1e-007, Hmax := 1e-006 );
}
OUTCTL OutCtl1
{
RESULT SDB SDB_0(out.V);
RESULT VIEW VANALOG_0(out.V);
RESULT SDB SDB_1(C1.V);
RESULT VIEW VANALOG_1(C1.V);
RESULT SDB SDB_2(L1.I);
RESULT VIEW VANALOG_2(L1.I);
RESULT SDB SDB_3(S1.V);
RESULT VIEW VANALOG_3(S1.V);
RESULT SDB SDB_4(PWM1.VAL);
RESULT VIEW VANALOG_4(PWM1.VAL);
OUTCFG VIEWTOOL VT1 ( Xmin := 0, Xmax := Tend);
OUTCFG SimplorerDB DB1 ( Xmin := 0, Xmax := Tend);
}