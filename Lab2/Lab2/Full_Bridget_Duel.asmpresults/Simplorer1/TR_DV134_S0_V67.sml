// 0;Simplorer1.sml
//*************************************************************************************************
//                                           SML Netlist File                                     *
//                                   created by Ansys Simplorer 11.0                              *
//                                                                                                *
//*************************************************************************************************

// Global Ports

// begin toplevel circuit

INTERN DEQUL Dp1 A:= net_10 , C:= net_3 ( VF:=0.8, RB:=0.001, RR:=100000 ) ;
INTERN DEQUL DP4 A:= net_12 , C:= net_3 ( VF:=0.8, RB:=0.001, RR:=100000 ) ;
INTERN DEQUL DP2 A:= GND , C:= net_10 ( VF:=0.8, RB:=0.001, RR:=100000 ) ;
INTERN DEQUL DP3 A:= GND , C:= net_12 ( VF:=0.8, RB:=0.001, RR:=100000 ) ;
INTERN E Vin N1:= GND , N2:= net_3 (EMF:= 24, PARTDERIV:= 0, SPC:=0, AC_PHASE := 0, AC_MAG := 0.001);
MODEL PWM PWM1 ( PERIOD:= 2e-005, DC:= 0.2, TD:= 0, PHASE:= 0) SRC: DB(Lib:="Simplorer Elements\Basic Elements\Basic Elements") ;
MODEL PWM PWM2 ( PERIOD:= 2e-005, DC:= 0.2, TD:= 0, PHASE:= 180) SRC: DB(Lib:="Simplorer Elements\Basic Elements\Basic Elements") ;
MODEL TWT TWT1 N1L1:= net_10, N2L1:= net_12, N1L2:= net_15, N2L2:= net_14 ( n:= 1) SRC: DB(Lib:="Simplorer Elements\Basic Elements\Basic Elements") ;
INTERN DEXP DS1 A:= net_14 , C:= net_17 ( RR:=100000, ISAT:=1e-012, VT:=0.035 ) ;
INTERN DEXP DS4 A:= net_15 , C:= net_17 ( RR:=100000, ISAT:=1e-012, VT:=0.035 ) ;
INTERN DEXP DS2 A:= GND , C:= net_14 ( RR:=100000, ISAT:=1e-012, VT:=0.035 ) ;
INTERN DEXP DS3 A:= GND , C:= net_15 ( RR:=100000, ISAT:=1e-012, VT:=0.035 ) ;
INTERN L L1 N1:= net_17 , N2:= net_18 (L:=5e-005, I0:=0);
INTERN C C1 N1:= net_18 , N2:= GND (C:=2.2e-005, V0:=0);
INTERN R R1 N1:= net_18 , N2:= GND (R:=2);
INTERN S T1 N1 := net_3 , N2 := net_10 ( CTRL:=PWM1.VAL) ;
INTERN S T3 N1 := net_12 , N2 := GND ( CTRL:=PWM1.VAL) ;
INTERN S T4 N1 := net_3 , N2 := net_12 ( CTRL:=PWM2.VAL) ;
INTERN S T2 N1 := net_10 , N2 := GND ( CTRL:=PWM2.VAL) ;

// end toplevel circuit

SIMCTL TR
{
SIMCFG SIMPLORER_TR TR ( Tend := 0.0004, Hmin := 1e-007, Hmax := 5e-007 );
}
OUTCTL OutCtl1
{
RESULT SDB SDB_0(Dp1.V);
RESULT SDB SDB_1(Dp1.I);
RESULT SDB SDB_2(T1.V);
RESULT SDB SDB_3(T1.I);
RESULT SDB SDB_4(T4.V);
RESULT SDB SDB_5(T4.I);
RESULT SDB SDB_6(DP4.V);
RESULT SDB SDB_7(DP4.I);
RESULT SDB SDB_8(T2.V);
RESULT SDB SDB_9(T2.I);
RESULT SDB SDB_10(DP2.V);
RESULT SDB SDB_11(DP2.I);
RESULT SDB SDB_12(DP3.V);
RESULT SDB SDB_13(DP3.I);
RESULT SDB SDB_14(T3.V);
RESULT SDB SDB_15(T3.I);
RESULT SDB SDB_16(TWT1.V1);
RESULT SDB SDB_17(TWT1.V2);
RESULT SDB SDB_18(TWT1.I1);
RESULT SDB SDB_19(TWT1.I2);
RESULT SDB SDB_20(L1.V);
RESULT SDB SDB_21(L1.I);
RESULT SDB SDB_22(C1.V);
RESULT SDB SDB_23(C1.I);
RESULT SDB SDB_24(R1.V);
RESULT SDB SDB_25(R1.I);
RESULT SDB SDB_26(DS1.V);
RESULT SDB SDB_27(DS1.I);
RESULT SDB SDB_28(DS4.V);
RESULT SDB SDB_29(DS4.I);
RESULT SDB SDB_30(DS2.V);
RESULT SDB SDB_31(DS2.I);
RESULT SDB SDB_32(DS3.V);
RESULT SDB SDB_33(DS3.I);
RESULT SDB SDB_34(PWM1.VAL);
RESULT SDB SDB_35(PWM2.VAL);
RESULT SDB SDB_36(Vin.V);
RESULT SDB SDB_37(Vin.I);
OUTCFG VIEWTOOL VT1 ( Xmin := 0, Xmax := Tend);
OUTCFG SimplorerDB DB1 ( Xmin := 0, Xmax := Tend);
}