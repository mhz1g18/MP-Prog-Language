{-# OPTIONS_GHC -w #-}
module MPGrammar where
import MPTokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.9

data HappyAbsSyn t4 t5 t7 t8 t9 t11 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 ([FunctionDeclaration])
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 ([(Type,String)])
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 ([Expr])
	| HappyAbsSyn16 ([Statement])
	| HappyAbsSyn17 ([Int])
	| HappyAbsSyn18 ([[Int]])
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20
	| HappyAbsSyn21 t21
	| HappyAbsSyn22 t22
	| HappyAbsSyn23 t23
	| HappyAbsSyn24 t24
	| HappyAbsSyn25 t25
	| HappyAbsSyn26 t26
	| HappyAbsSyn27 t27
	| HappyAbsSyn28 t28
	| HappyAbsSyn29 t29
	| HappyAbsSyn30 t30

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,670) ([0,0,2048,0,0,0,32768,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,496,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,1,0,0,0,0,0,7936,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,0,65344,4102,1796,0,0,0,0,0,0,31,0,0,0,256,16384,0,0,0,0,64,0,0,0,0,0,0,31,0,0,0,8,0,0,0,0,65296,3,0,0,0,0,0,0,0,0,0,0,4,0,0,0,64,0,512,0,0,0,0,0,0,0,0,0,0,8,0,16,0,0,0,128,0,0,0,0,0,16384,1791,1040,7,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,9204,16640,112,0,0,0,4,0,62464,35,28737,0,0,0,0,2,0,9204,16640,112,0,4096,128,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16192,4098,1796,0,62464,35,28737,0,16384,575,1040,7,0,0,16368,1,0,0,0,0,0,0,61696,63,0,16384,575,1040,7,0,0,16368,4,0,16192,4098,1796,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,128,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16384,575,1040,7,0,9204,16640,112,0,16192,4098,1796,0,62464,35,28737,0,16384,575,1040,7,0,9204,16640,112,0,16192,4098,1796,0,62464,35,28737,0,16384,575,1040,7,0,9204,16640,112,0,0,0,0,0,0,1024,256,0,32768,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31,0,0,0,0,0,0,0,0,63488,0,0,0,32768,47,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,14,0,0,0,224,0,0,0,16304,0,0,0,63744,3,0,0,32768,47,0,0,0,0,0,0,9204,16640,112,0,0,65312,3,0,0,16,0,0,0,0,5119,0,0,0,0,0,0,0,0,0,0,0,61440,575,0,0,0,1023,0,0,0,4,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16192,4098,1796,0,0,0,128,0,0,0,0,0,0,0,0,4,0,16192,4098,1796,0,0,0,0,0,32768,0,0,1,0,0,0,0,0,0,65312,3,0,0,0,0,0,16384,575,1040,7,0,0,16368,0,0,0,65280,35,0,0,32768,1,0,0,0,4096,0,0,0,0,32,0,0,0,512,0,0,2048,0,0,16384,575,1040,7,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","Program","MainMethod","FunctionsDeclarations","Expr","Statement","FunctionApplication","FuncParamList","FunctionDeclaration","argsListRev","ArgsList","paramListRev","ParamList","Block","IntStreamRow","Stream","ArithExpr","BoolExpr","Type","IncOrDec","ord_list__FunctionDeclaration__","ord_list__Statement__","ord_list__int__","rev__argsListRev__","rev__paramListRev__","rev_list__FunctionDeclaration__","rev_list__Statement__","rev_list__int__","eol","'->'","IntegerT","intStreamType","BooleanType","boolType","unitType","bool","loop","if","else","print","return","main","';'","':'","','","'='","'=='","'&&'","'||'","'+'","'-'","'*'","'/'","'%'","'!'","'<'","'('","'['","')'","']'","'{'","'}'","var","int","string","%eof"]
        bit_start = st * 68
        bit_end = (st + 1) * 68
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..67]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (44) = happyShift action_3
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_5
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (44) = happyShift action_3
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyFail (happyExpListPerState 2)

action_3 (37) = happyShift action_16
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (68) = happyAccept
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (33) = happyShift action_11
action_5 (34) = happyShift action_12
action_5 (35) = happyShift action_13
action_5 (36) = happyShift action_14
action_5 (37) = happyShift action_15
action_5 (6) = happyGoto action_6
action_5 (11) = happyGoto action_7
action_5 (21) = happyGoto action_8
action_5 (23) = happyGoto action_9
action_5 (28) = happyGoto action_10
action_5 _ = happyReduce_1

action_6 _ = happyReduce_2

action_7 _ = happyReduce_64

action_8 (32) = happyShift action_20
action_8 (65) = happyShift action_21
action_8 _ = happyFail (happyExpListPerState 8)

action_9 _ = happyReduce_4

action_10 (33) = happyShift action_11
action_10 (34) = happyShift action_12
action_10 (35) = happyShift action_13
action_10 (36) = happyShift action_14
action_10 (37) = happyShift action_15
action_10 (11) = happyGoto action_19
action_10 (21) = happyGoto action_8
action_10 _ = happyReduce_59

action_11 _ = happyReduce_51

action_12 _ = happyReduce_54

action_13 _ = happyReduce_53

action_14 _ = happyReduce_52

action_15 _ = happyReduce_55

action_16 (63) = happyShift action_18
action_16 (16) = happyGoto action_17
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_3

action_18 (31) = happyShift action_38
action_18 (33) = happyShift action_11
action_18 (34) = happyShift action_12
action_18 (35) = happyShift action_13
action_18 (36) = happyShift action_14
action_18 (37) = happyShift action_15
action_18 (38) = happyShift action_39
action_18 (39) = happyShift action_40
action_18 (40) = happyShift action_41
action_18 (42) = happyShift action_42
action_18 (43) = happyShift action_43
action_18 (53) = happyShift action_44
action_18 (59) = happyShift action_45
action_18 (65) = happyShift action_46
action_18 (66) = happyShift action_47
action_18 (67) = happyShift action_48
action_18 (7) = happyGoto action_26
action_18 (8) = happyGoto action_27
action_18 (9) = happyGoto action_28
action_18 (17) = happyGoto action_29
action_18 (18) = happyGoto action_30
action_18 (19) = happyGoto action_31
action_18 (20) = happyGoto action_32
action_18 (21) = happyGoto action_33
action_18 (24) = happyGoto action_34
action_18 (25) = happyGoto action_35
action_18 (29) = happyGoto action_36
action_18 (30) = happyGoto action_37
action_18 _ = happyFail (happyExpListPerState 18)

action_19 _ = happyReduce_65

action_20 (33) = happyShift action_11
action_20 (34) = happyShift action_12
action_20 (35) = happyShift action_13
action_20 (36) = happyShift action_14
action_20 (37) = happyShift action_15
action_20 (21) = happyGoto action_25
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (37) = happyShift action_23
action_21 (59) = happyShift action_24
action_21 (10) = happyGoto action_22
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (63) = happyShift action_18
action_22 (16) = happyGoto action_82
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_23

action_24 (33) = happyShift action_11
action_24 (34) = happyShift action_12
action_24 (35) = happyShift action_13
action_24 (36) = happyShift action_14
action_24 (37) = happyShift action_15
action_24 (14) = happyGoto action_78
action_24 (15) = happyGoto action_79
action_24 (21) = happyGoto action_80
action_24 (27) = happyGoto action_81
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (32) = happyShift action_20
action_25 _ = happyReduce_56

action_26 (45) = happyShift action_67
action_26 (49) = happyShift action_68
action_26 (50) = happyShift action_69
action_26 (51) = happyShift action_70
action_26 (52) = happyShift action_71
action_26 (53) = happyShift action_72
action_26 (54) = happyShift action_73
action_26 (55) = happyShift action_74
action_26 (56) = happyShift action_75
action_26 (57) = happyShift action_76
action_26 (58) = happyShift action_77
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_66

action_28 _ = happyReduce_13

action_29 (31) = happyShift action_66
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (31) = happyShift action_64
action_30 (66) = happyShift action_65
action_30 (17) = happyGoto action_63
action_30 (25) = happyGoto action_35
action_30 (30) = happyGoto action_37
action_30 _ = happyReduce_5

action_31 _ = happyReduce_6

action_32 _ = happyReduce_7

action_33 (32) = happyShift action_20
action_33 (65) = happyShift action_62
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (64) = happyShift action_61
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_33

action_36 (31) = happyShift action_38
action_36 (33) = happyShift action_11
action_36 (34) = happyShift action_12
action_36 (35) = happyShift action_13
action_36 (36) = happyShift action_14
action_36 (37) = happyShift action_15
action_36 (38) = happyShift action_39
action_36 (39) = happyShift action_40
action_36 (40) = happyShift action_41
action_36 (42) = happyShift action_42
action_36 (43) = happyShift action_43
action_36 (53) = happyShift action_44
action_36 (59) = happyShift action_45
action_36 (65) = happyShift action_46
action_36 (66) = happyShift action_47
action_36 (67) = happyShift action_48
action_36 (7) = happyGoto action_26
action_36 (8) = happyGoto action_60
action_36 (9) = happyGoto action_28
action_36 (17) = happyGoto action_29
action_36 (18) = happyGoto action_30
action_36 (19) = happyGoto action_31
action_36 (20) = happyGoto action_32
action_36 (21) = happyGoto action_33
action_36 (25) = happyGoto action_35
action_36 (30) = happyGoto action_37
action_36 _ = happyReduce_60

action_37 (66) = happyShift action_59
action_37 _ = happyReduce_61

action_38 _ = happyReduce_34

action_39 _ = happyReduce_45

action_40 (59) = happyShift action_58
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (31) = happyShift action_38
action_41 (33) = happyShift action_11
action_41 (34) = happyShift action_12
action_41 (35) = happyShift action_13
action_41 (36) = happyShift action_14
action_41 (37) = happyShift action_15
action_41 (38) = happyShift action_39
action_41 (42) = happyShift action_42
action_41 (53) = happyShift action_44
action_41 (59) = happyShift action_45
action_41 (65) = happyShift action_46
action_41 (66) = happyShift action_47
action_41 (67) = happyShift action_48
action_41 (7) = happyGoto action_57
action_41 (9) = happyGoto action_28
action_41 (17) = happyGoto action_29
action_41 (18) = happyGoto action_30
action_41 (19) = happyGoto action_31
action_41 (20) = happyGoto action_32
action_41 (21) = happyGoto action_33
action_41 (25) = happyGoto action_35
action_41 (30) = happyGoto action_37
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (59) = happyShift action_56
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (31) = happyShift action_38
action_43 (33) = happyShift action_11
action_43 (34) = happyShift action_12
action_43 (35) = happyShift action_13
action_43 (36) = happyShift action_14
action_43 (37) = happyShift action_15
action_43 (38) = happyShift action_39
action_43 (42) = happyShift action_42
action_43 (53) = happyShift action_44
action_43 (59) = happyShift action_45
action_43 (65) = happyShift action_46
action_43 (66) = happyShift action_47
action_43 (67) = happyShift action_48
action_43 (7) = happyGoto action_55
action_43 (9) = happyGoto action_28
action_43 (17) = happyGoto action_29
action_43 (18) = happyGoto action_30
action_43 (19) = happyGoto action_31
action_43 (20) = happyGoto action_32
action_43 (21) = happyGoto action_33
action_43 (25) = happyGoto action_35
action_43 (30) = happyGoto action_37
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (66) = happyShift action_54
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (31) = happyShift action_38
action_45 (33) = happyShift action_11
action_45 (34) = happyShift action_12
action_45 (35) = happyShift action_13
action_45 (36) = happyShift action_14
action_45 (37) = happyShift action_15
action_45 (38) = happyShift action_39
action_45 (42) = happyShift action_42
action_45 (53) = happyShift action_44
action_45 (59) = happyShift action_45
action_45 (65) = happyShift action_46
action_45 (66) = happyShift action_47
action_45 (67) = happyShift action_48
action_45 (7) = happyGoto action_53
action_45 (9) = happyGoto action_28
action_45 (17) = happyGoto action_29
action_45 (18) = happyGoto action_30
action_45 (19) = happyGoto action_31
action_45 (20) = happyGoto action_32
action_45 (21) = happyGoto action_33
action_45 (25) = happyGoto action_35
action_45 (30) = happyGoto action_37
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (37) = happyShift action_49
action_46 (48) = happyShift action_50
action_46 (59) = happyShift action_51
action_46 (60) = happyShift action_52
action_46 _ = happyReduce_9

action_47 (45) = happyReduce_39
action_47 (46) = happyReduce_39
action_47 (47) = happyReduce_39
action_47 (49) = happyReduce_39
action_47 (50) = happyReduce_39
action_47 (51) = happyReduce_39
action_47 (52) = happyReduce_39
action_47 (53) = happyReduce_39
action_47 (54) = happyReduce_39
action_47 (55) = happyReduce_39
action_47 (56) = happyReduce_39
action_47 (57) = happyReduce_39
action_47 (58) = happyReduce_39
action_47 (61) = happyReduce_39
action_47 (62) = happyReduce_39
action_47 (63) = happyReduce_39
action_47 _ = happyReduce_68

action_48 _ = happyReduce_8

action_49 _ = happyReduce_21

action_50 (31) = happyShift action_38
action_50 (33) = happyShift action_11
action_50 (34) = happyShift action_12
action_50 (35) = happyShift action_13
action_50 (36) = happyShift action_14
action_50 (37) = happyShift action_15
action_50 (38) = happyShift action_39
action_50 (42) = happyShift action_42
action_50 (53) = happyShift action_44
action_50 (59) = happyShift action_45
action_50 (65) = happyShift action_46
action_50 (66) = happyShift action_47
action_50 (67) = happyShift action_48
action_50 (7) = happyGoto action_108
action_50 (9) = happyGoto action_28
action_50 (17) = happyGoto action_29
action_50 (18) = happyGoto action_30
action_50 (19) = happyGoto action_31
action_50 (20) = happyGoto action_32
action_50 (21) = happyGoto action_33
action_50 (25) = happyGoto action_35
action_50 (30) = happyGoto action_37
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (31) = happyShift action_38
action_51 (33) = happyShift action_11
action_51 (34) = happyShift action_12
action_51 (35) = happyShift action_13
action_51 (36) = happyShift action_14
action_51 (37) = happyShift action_15
action_51 (38) = happyShift action_39
action_51 (42) = happyShift action_42
action_51 (53) = happyShift action_44
action_51 (59) = happyShift action_45
action_51 (65) = happyShift action_46
action_51 (66) = happyShift action_47
action_51 (67) = happyShift action_48
action_51 (7) = happyGoto action_104
action_51 (9) = happyGoto action_28
action_51 (12) = happyGoto action_105
action_51 (13) = happyGoto action_106
action_51 (17) = happyGoto action_29
action_51 (18) = happyGoto action_30
action_51 (19) = happyGoto action_31
action_51 (20) = happyGoto action_32
action_51 (21) = happyGoto action_33
action_51 (25) = happyGoto action_35
action_51 (26) = happyGoto action_107
action_51 (30) = happyGoto action_37
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (31) = happyShift action_38
action_52 (33) = happyShift action_11
action_52 (34) = happyShift action_12
action_52 (35) = happyShift action_13
action_52 (36) = happyShift action_14
action_52 (37) = happyShift action_15
action_52 (38) = happyShift action_39
action_52 (42) = happyShift action_42
action_52 (53) = happyShift action_44
action_52 (59) = happyShift action_45
action_52 (65) = happyShift action_46
action_52 (66) = happyShift action_47
action_52 (67) = happyShift action_48
action_52 (7) = happyGoto action_103
action_52 (9) = happyGoto action_28
action_52 (17) = happyGoto action_29
action_52 (18) = happyGoto action_30
action_52 (19) = happyGoto action_31
action_52 (20) = happyGoto action_32
action_52 (21) = happyGoto action_33
action_52 (25) = happyGoto action_35
action_52 (30) = happyGoto action_37
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (49) = happyShift action_68
action_53 (50) = happyShift action_69
action_53 (51) = happyShift action_70
action_53 (52) = happyShift action_71
action_53 (53) = happyShift action_72
action_53 (54) = happyShift action_73
action_53 (55) = happyShift action_74
action_53 (56) = happyShift action_75
action_53 (57) = happyShift action_76
action_53 (58) = happyShift action_77
action_53 (61) = happyShift action_102
action_53 _ = happyFail (happyExpListPerState 53)

action_54 _ = happyReduce_38

action_55 (45) = happyShift action_101
action_55 (49) = happyShift action_68
action_55 (50) = happyShift action_69
action_55 (51) = happyShift action_70
action_55 (52) = happyShift action_71
action_55 (53) = happyShift action_72
action_55 (54) = happyShift action_73
action_55 (55) = happyShift action_74
action_55 (56) = happyShift action_75
action_55 (57) = happyShift action_76
action_55 (58) = happyShift action_77
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (31) = happyShift action_38
action_56 (33) = happyShift action_11
action_56 (34) = happyShift action_12
action_56 (35) = happyShift action_13
action_56 (36) = happyShift action_14
action_56 (37) = happyShift action_15
action_56 (38) = happyShift action_39
action_56 (42) = happyShift action_42
action_56 (53) = happyShift action_44
action_56 (59) = happyShift action_45
action_56 (65) = happyShift action_46
action_56 (66) = happyShift action_47
action_56 (67) = happyShift action_48
action_56 (7) = happyGoto action_100
action_56 (9) = happyGoto action_28
action_56 (17) = happyGoto action_29
action_56 (18) = happyGoto action_30
action_56 (19) = happyGoto action_31
action_56 (20) = happyGoto action_32
action_56 (21) = happyGoto action_33
action_56 (25) = happyGoto action_35
action_56 (30) = happyGoto action_37
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (49) = happyShift action_68
action_57 (50) = happyShift action_69
action_57 (51) = happyShift action_70
action_57 (52) = happyShift action_71
action_57 (53) = happyShift action_72
action_57 (54) = happyShift action_73
action_57 (55) = happyShift action_74
action_57 (56) = happyShift action_75
action_57 (57) = happyShift action_76
action_57 (58) = happyShift action_77
action_57 (63) = happyShift action_18
action_57 (16) = happyGoto action_99
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (31) = happyShift action_38
action_58 (33) = happyShift action_11
action_58 (34) = happyShift action_12
action_58 (35) = happyShift action_13
action_58 (36) = happyShift action_14
action_58 (37) = happyShift action_15
action_58 (38) = happyShift action_39
action_58 (42) = happyShift action_42
action_58 (53) = happyShift action_44
action_58 (59) = happyShift action_45
action_58 (65) = happyShift action_46
action_58 (66) = happyShift action_47
action_58 (67) = happyShift action_48
action_58 (7) = happyGoto action_98
action_58 (9) = happyGoto action_28
action_58 (17) = happyGoto action_29
action_58 (18) = happyGoto action_30
action_58 (19) = happyGoto action_31
action_58 (20) = happyGoto action_32
action_58 (21) = happyGoto action_33
action_58 (25) = happyGoto action_35
action_58 (30) = happyGoto action_37
action_58 _ = happyFail (happyExpListPerState 58)

action_59 _ = happyReduce_69

action_60 _ = happyReduce_67

action_61 _ = happyReduce_32

action_62 (48) = happyShift action_97
action_62 _ = happyReduce_10

action_63 (31) = happyShift action_96
action_63 _ = happyFail (happyExpListPerState 63)

action_64 _ = happyReduce_36

action_65 _ = happyReduce_68

action_66 _ = happyReduce_35

action_67 _ = happyReduce_16

action_68 (31) = happyShift action_38
action_68 (33) = happyShift action_11
action_68 (34) = happyShift action_12
action_68 (35) = happyShift action_13
action_68 (36) = happyShift action_14
action_68 (37) = happyShift action_15
action_68 (38) = happyShift action_39
action_68 (42) = happyShift action_42
action_68 (53) = happyShift action_44
action_68 (59) = happyShift action_45
action_68 (65) = happyShift action_46
action_68 (66) = happyShift action_47
action_68 (67) = happyShift action_48
action_68 (7) = happyGoto action_95
action_68 (9) = happyGoto action_28
action_68 (17) = happyGoto action_29
action_68 (18) = happyGoto action_30
action_68 (19) = happyGoto action_31
action_68 (20) = happyGoto action_32
action_68 (21) = happyGoto action_33
action_68 (25) = happyGoto action_35
action_68 (30) = happyGoto action_37
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (31) = happyShift action_38
action_69 (33) = happyShift action_11
action_69 (34) = happyShift action_12
action_69 (35) = happyShift action_13
action_69 (36) = happyShift action_14
action_69 (37) = happyShift action_15
action_69 (38) = happyShift action_39
action_69 (42) = happyShift action_42
action_69 (53) = happyShift action_44
action_69 (59) = happyShift action_45
action_69 (65) = happyShift action_46
action_69 (66) = happyShift action_47
action_69 (67) = happyShift action_48
action_69 (7) = happyGoto action_94
action_69 (9) = happyGoto action_28
action_69 (17) = happyGoto action_29
action_69 (18) = happyGoto action_30
action_69 (19) = happyGoto action_31
action_69 (20) = happyGoto action_32
action_69 (21) = happyGoto action_33
action_69 (25) = happyGoto action_35
action_69 (30) = happyGoto action_37
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (31) = happyShift action_38
action_70 (33) = happyShift action_11
action_70 (34) = happyShift action_12
action_70 (35) = happyShift action_13
action_70 (36) = happyShift action_14
action_70 (37) = happyShift action_15
action_70 (38) = happyShift action_39
action_70 (42) = happyShift action_42
action_70 (53) = happyShift action_44
action_70 (59) = happyShift action_45
action_70 (65) = happyShift action_46
action_70 (66) = happyShift action_47
action_70 (67) = happyShift action_48
action_70 (7) = happyGoto action_93
action_70 (9) = happyGoto action_28
action_70 (17) = happyGoto action_29
action_70 (18) = happyGoto action_30
action_70 (19) = happyGoto action_31
action_70 (20) = happyGoto action_32
action_70 (21) = happyGoto action_33
action_70 (25) = happyGoto action_35
action_70 (30) = happyGoto action_37
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (31) = happyShift action_38
action_71 (33) = happyShift action_11
action_71 (34) = happyShift action_12
action_71 (35) = happyShift action_13
action_71 (36) = happyShift action_14
action_71 (37) = happyShift action_15
action_71 (38) = happyShift action_39
action_71 (42) = happyShift action_42
action_71 (53) = happyShift action_44
action_71 (59) = happyShift action_45
action_71 (65) = happyShift action_46
action_71 (66) = happyShift action_47
action_71 (67) = happyShift action_48
action_71 (7) = happyGoto action_92
action_71 (9) = happyGoto action_28
action_71 (17) = happyGoto action_29
action_71 (18) = happyGoto action_30
action_71 (19) = happyGoto action_31
action_71 (20) = happyGoto action_32
action_71 (21) = happyGoto action_33
action_71 (25) = happyGoto action_35
action_71 (30) = happyGoto action_37
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (31) = happyShift action_38
action_72 (33) = happyShift action_11
action_72 (34) = happyShift action_12
action_72 (35) = happyShift action_13
action_72 (36) = happyShift action_14
action_72 (37) = happyShift action_15
action_72 (38) = happyShift action_39
action_72 (42) = happyShift action_42
action_72 (53) = happyShift action_44
action_72 (59) = happyShift action_45
action_72 (65) = happyShift action_46
action_72 (66) = happyShift action_47
action_72 (67) = happyShift action_48
action_72 (7) = happyGoto action_91
action_72 (9) = happyGoto action_28
action_72 (17) = happyGoto action_29
action_72 (18) = happyGoto action_30
action_72 (19) = happyGoto action_31
action_72 (20) = happyGoto action_32
action_72 (21) = happyGoto action_33
action_72 (25) = happyGoto action_35
action_72 (30) = happyGoto action_37
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (31) = happyShift action_38
action_73 (33) = happyShift action_11
action_73 (34) = happyShift action_12
action_73 (35) = happyShift action_13
action_73 (36) = happyShift action_14
action_73 (37) = happyShift action_15
action_73 (38) = happyShift action_39
action_73 (42) = happyShift action_42
action_73 (53) = happyShift action_44
action_73 (59) = happyShift action_45
action_73 (65) = happyShift action_46
action_73 (66) = happyShift action_47
action_73 (67) = happyShift action_48
action_73 (7) = happyGoto action_90
action_73 (9) = happyGoto action_28
action_73 (17) = happyGoto action_29
action_73 (18) = happyGoto action_30
action_73 (19) = happyGoto action_31
action_73 (20) = happyGoto action_32
action_73 (21) = happyGoto action_33
action_73 (25) = happyGoto action_35
action_73 (30) = happyGoto action_37
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (31) = happyShift action_38
action_74 (33) = happyShift action_11
action_74 (34) = happyShift action_12
action_74 (35) = happyShift action_13
action_74 (36) = happyShift action_14
action_74 (37) = happyShift action_15
action_74 (38) = happyShift action_39
action_74 (42) = happyShift action_42
action_74 (53) = happyShift action_44
action_74 (59) = happyShift action_45
action_74 (65) = happyShift action_46
action_74 (66) = happyShift action_47
action_74 (67) = happyShift action_48
action_74 (7) = happyGoto action_89
action_74 (9) = happyGoto action_28
action_74 (17) = happyGoto action_29
action_74 (18) = happyGoto action_30
action_74 (19) = happyGoto action_31
action_74 (20) = happyGoto action_32
action_74 (21) = happyGoto action_33
action_74 (25) = happyGoto action_35
action_74 (30) = happyGoto action_37
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (31) = happyShift action_38
action_75 (33) = happyShift action_11
action_75 (34) = happyShift action_12
action_75 (35) = happyShift action_13
action_75 (36) = happyShift action_14
action_75 (37) = happyShift action_15
action_75 (38) = happyShift action_39
action_75 (42) = happyShift action_42
action_75 (53) = happyShift action_44
action_75 (59) = happyShift action_45
action_75 (65) = happyShift action_46
action_75 (66) = happyShift action_47
action_75 (67) = happyShift action_48
action_75 (7) = happyGoto action_88
action_75 (9) = happyGoto action_28
action_75 (17) = happyGoto action_29
action_75 (18) = happyGoto action_30
action_75 (19) = happyGoto action_31
action_75 (20) = happyGoto action_32
action_75 (21) = happyGoto action_33
action_75 (25) = happyGoto action_35
action_75 (30) = happyGoto action_37
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (31) = happyShift action_38
action_76 (33) = happyShift action_11
action_76 (34) = happyShift action_12
action_76 (35) = happyShift action_13
action_76 (36) = happyShift action_14
action_76 (37) = happyShift action_15
action_76 (38) = happyShift action_39
action_76 (42) = happyShift action_42
action_76 (53) = happyShift action_44
action_76 (59) = happyShift action_45
action_76 (65) = happyShift action_46
action_76 (66) = happyShift action_47
action_76 (67) = happyShift action_48
action_76 (7) = happyGoto action_87
action_76 (9) = happyGoto action_28
action_76 (17) = happyGoto action_29
action_76 (18) = happyGoto action_30
action_76 (19) = happyGoto action_31
action_76 (20) = happyGoto action_32
action_76 (21) = happyGoto action_33
action_76 (25) = happyGoto action_35
action_76 (30) = happyGoto action_37
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (31) = happyShift action_38
action_77 (33) = happyShift action_11
action_77 (34) = happyShift action_12
action_77 (35) = happyShift action_13
action_77 (36) = happyShift action_14
action_77 (37) = happyShift action_15
action_77 (38) = happyShift action_39
action_77 (42) = happyShift action_42
action_77 (53) = happyShift action_44
action_77 (59) = happyShift action_45
action_77 (65) = happyShift action_46
action_77 (66) = happyShift action_47
action_77 (67) = happyShift action_48
action_77 (7) = happyGoto action_86
action_77 (9) = happyGoto action_28
action_77 (17) = happyGoto action_29
action_77 (18) = happyGoto action_30
action_77 (19) = happyGoto action_31
action_77 (20) = happyGoto action_32
action_77 (21) = happyGoto action_33
action_77 (25) = happyGoto action_35
action_77 (30) = happyGoto action_37
action_77 _ = happyFail (happyExpListPerState 77)

action_78 _ = happyReduce_63

action_79 (47) = happyShift action_84
action_79 (61) = happyShift action_85
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (32) = happyShift action_20
action_80 (65) = happyShift action_83
action_80 _ = happyFail (happyExpListPerState 80)

action_81 _ = happyReduce_31

action_82 _ = happyReduce_25

action_83 _ = happyReduce_29

action_84 (33) = happyShift action_11
action_84 (34) = happyShift action_12
action_84 (35) = happyShift action_13
action_84 (36) = happyShift action_14
action_84 (37) = happyShift action_15
action_84 (21) = happyGoto action_116
action_84 _ = happyFail (happyExpListPerState 84)

action_85 _ = happyReduce_24

action_86 (52) = happyShift action_71
action_86 (53) = happyShift action_72
action_86 (54) = happyShift action_73
action_86 (55) = happyShift action_74
action_86 (56) = happyShift action_75
action_86 (58) = happyFail []
action_86 _ = happyReduce_46

action_87 (52) = happyShift action_71
action_87 (53) = happyShift action_72
action_87 (54) = happyShift action_73
action_87 (55) = happyShift action_74
action_87 (56) = happyShift action_75
action_87 (58) = happyShift action_77
action_87 _ = happyReduce_50

action_88 _ = happyReduce_44

action_89 _ = happyReduce_43

action_90 _ = happyReduce_42

action_91 (54) = happyShift action_73
action_91 (55) = happyShift action_74
action_91 (56) = happyShift action_75
action_91 _ = happyReduce_41

action_92 (54) = happyShift action_73
action_92 (55) = happyShift action_74
action_92 (56) = happyShift action_75
action_92 _ = happyReduce_40

action_93 (49) = happyShift action_68
action_93 (50) = happyShift action_69
action_93 (52) = happyShift action_71
action_93 (53) = happyShift action_72
action_93 (54) = happyShift action_73
action_93 (55) = happyShift action_74
action_93 (56) = happyShift action_75
action_93 (57) = happyShift action_76
action_93 (58) = happyShift action_77
action_93 _ = happyReduce_49

action_94 (49) = happyShift action_68
action_94 (52) = happyShift action_71
action_94 (53) = happyShift action_72
action_94 (54) = happyShift action_73
action_94 (55) = happyShift action_74
action_94 (56) = happyShift action_75
action_94 (57) = happyShift action_76
action_94 (58) = happyShift action_77
action_94 _ = happyReduce_48

action_95 (52) = happyShift action_71
action_95 (53) = happyShift action_72
action_95 (54) = happyShift action_73
action_95 (55) = happyShift action_74
action_95 (56) = happyShift action_75
action_95 (58) = happyShift action_77
action_95 _ = happyReduce_47

action_96 _ = happyReduce_37

action_97 (31) = happyShift action_38
action_97 (33) = happyShift action_11
action_97 (34) = happyShift action_12
action_97 (35) = happyShift action_13
action_97 (36) = happyShift action_14
action_97 (37) = happyShift action_15
action_97 (38) = happyShift action_39
action_97 (42) = happyShift action_42
action_97 (53) = happyShift action_44
action_97 (59) = happyShift action_45
action_97 (65) = happyShift action_46
action_97 (66) = happyShift action_47
action_97 (67) = happyShift action_48
action_97 (7) = happyGoto action_115
action_97 (9) = happyGoto action_28
action_97 (17) = happyGoto action_29
action_97 (18) = happyGoto action_30
action_97 (19) = happyGoto action_31
action_97 (20) = happyGoto action_32
action_97 (21) = happyGoto action_33
action_97 (25) = happyGoto action_35
action_97 (30) = happyGoto action_37
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (46) = happyShift action_114
action_98 (49) = happyShift action_68
action_98 (50) = happyShift action_69
action_98 (51) = happyShift action_70
action_98 (52) = happyShift action_71
action_98 (53) = happyShift action_72
action_98 (54) = happyShift action_73
action_98 (55) = happyShift action_74
action_98 (56) = happyShift action_75
action_98 (57) = happyShift action_76
action_98 (58) = happyShift action_77
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (41) = happyShift action_113
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (49) = happyShift action_68
action_100 (50) = happyShift action_69
action_100 (51) = happyShift action_70
action_100 (52) = happyShift action_71
action_100 (53) = happyShift action_72
action_100 (54) = happyShift action_73
action_100 (55) = happyShift action_74
action_100 (56) = happyShift action_75
action_100 (57) = happyShift action_76
action_100 (58) = happyShift action_77
action_100 (61) = happyShift action_112
action_100 _ = happyFail (happyExpListPerState 100)

action_101 _ = happyReduce_19

action_102 _ = happyReduce_14

action_103 (49) = happyShift action_68
action_103 (50) = happyShift action_69
action_103 (51) = happyShift action_70
action_103 (52) = happyShift action_71
action_103 (53) = happyShift action_72
action_103 (54) = happyShift action_73
action_103 (55) = happyShift action_74
action_103 (56) = happyShift action_75
action_103 (57) = happyShift action_76
action_103 (58) = happyShift action_77
action_103 (62) = happyShift action_111
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (49) = happyShift action_68
action_104 (50) = happyShift action_69
action_104 (51) = happyShift action_70
action_104 (52) = happyShift action_71
action_104 (53) = happyShift action_72
action_104 (54) = happyShift action_73
action_104 (55) = happyShift action_74
action_104 (56) = happyShift action_75
action_104 (57) = happyShift action_76
action_104 (58) = happyShift action_77
action_104 _ = happyReduce_26

action_105 (47) = happyShift action_110
action_105 _ = happyReduce_62

action_106 (61) = happyShift action_109
action_106 _ = happyFail (happyExpListPerState 106)

action_107 _ = happyReduce_28

action_108 _ = happyReduce_11

action_109 _ = happyReduce_22

action_110 (31) = happyShift action_38
action_110 (33) = happyShift action_11
action_110 (34) = happyShift action_12
action_110 (35) = happyShift action_13
action_110 (36) = happyShift action_14
action_110 (37) = happyShift action_15
action_110 (38) = happyShift action_39
action_110 (42) = happyShift action_42
action_110 (53) = happyShift action_44
action_110 (59) = happyShift action_45
action_110 (65) = happyShift action_46
action_110 (66) = happyShift action_47
action_110 (67) = happyShift action_48
action_110 (7) = happyGoto action_121
action_110 (9) = happyGoto action_28
action_110 (17) = happyGoto action_29
action_110 (18) = happyGoto action_30
action_110 (19) = happyGoto action_31
action_110 (20) = happyGoto action_32
action_110 (21) = happyGoto action_33
action_110 (25) = happyGoto action_35
action_110 (30) = happyGoto action_37
action_110 _ = happyFail (happyExpListPerState 110)

action_111 (60) = happyShift action_120
action_111 _ = happyFail (happyExpListPerState 111)

action_112 _ = happyReduce_20

action_113 (63) = happyShift action_18
action_113 (16) = happyGoto action_119
action_113 _ = happyFail (happyExpListPerState 113)

action_114 (31) = happyShift action_38
action_114 (33) = happyShift action_11
action_114 (34) = happyShift action_12
action_114 (35) = happyShift action_13
action_114 (36) = happyShift action_14
action_114 (37) = happyShift action_15
action_114 (38) = happyShift action_39
action_114 (42) = happyShift action_42
action_114 (53) = happyShift action_44
action_114 (59) = happyShift action_45
action_114 (65) = happyShift action_46
action_114 (66) = happyShift action_47
action_114 (67) = happyShift action_48
action_114 (7) = happyGoto action_118
action_114 (9) = happyGoto action_28
action_114 (17) = happyGoto action_29
action_114 (18) = happyGoto action_30
action_114 (19) = happyGoto action_31
action_114 (20) = happyGoto action_32
action_114 (21) = happyGoto action_33
action_114 (25) = happyGoto action_35
action_114 (30) = happyGoto action_37
action_114 _ = happyFail (happyExpListPerState 114)

action_115 _ = happyReduce_12

action_116 (32) = happyShift action_20
action_116 (65) = happyShift action_117
action_116 _ = happyFail (happyExpListPerState 116)

action_117 _ = happyReduce_30

action_118 (46) = happyShift action_123
action_118 (49) = happyShift action_68
action_118 (50) = happyShift action_69
action_118 (51) = happyShift action_70
action_118 (52) = happyShift action_71
action_118 (53) = happyShift action_72
action_118 (54) = happyShift action_73
action_118 (55) = happyShift action_74
action_118 (56) = happyShift action_75
action_118 (57) = happyShift action_76
action_118 (58) = happyShift action_77
action_118 _ = happyFail (happyExpListPerState 118)

action_119 _ = happyReduce_17

action_120 (31) = happyShift action_38
action_120 (33) = happyShift action_11
action_120 (34) = happyShift action_12
action_120 (35) = happyShift action_13
action_120 (36) = happyShift action_14
action_120 (37) = happyShift action_15
action_120 (38) = happyShift action_39
action_120 (42) = happyShift action_42
action_120 (53) = happyShift action_44
action_120 (59) = happyShift action_45
action_120 (65) = happyShift action_46
action_120 (66) = happyShift action_47
action_120 (67) = happyShift action_48
action_120 (7) = happyGoto action_122
action_120 (9) = happyGoto action_28
action_120 (17) = happyGoto action_29
action_120 (18) = happyGoto action_30
action_120 (19) = happyGoto action_31
action_120 (20) = happyGoto action_32
action_120 (21) = happyGoto action_33
action_120 (25) = happyGoto action_35
action_120 (30) = happyGoto action_37
action_120 _ = happyFail (happyExpListPerState 120)

action_121 (49) = happyShift action_68
action_121 (50) = happyShift action_69
action_121 (51) = happyShift action_70
action_121 (52) = happyShift action_71
action_121 (53) = happyShift action_72
action_121 (54) = happyShift action_73
action_121 (55) = happyShift action_74
action_121 (56) = happyShift action_75
action_121 (57) = happyShift action_76
action_121 (58) = happyShift action_77
action_121 _ = happyReduce_27

action_122 (49) = happyShift action_68
action_122 (50) = happyShift action_69
action_122 (51) = happyShift action_70
action_122 (52) = happyShift action_71
action_122 (53) = happyShift action_72
action_122 (54) = happyShift action_73
action_122 (55) = happyShift action_74
action_122 (56) = happyShift action_75
action_122 (57) = happyShift action_76
action_122 (58) = happyShift action_77
action_122 (62) = happyShift action_127
action_122 _ = happyFail (happyExpListPerState 122)

action_123 (52) = happyShift action_125
action_123 (53) = happyShift action_126
action_123 (22) = happyGoto action_124
action_123 _ = happyFail (happyExpListPerState 123)

action_124 (61) = happyShift action_131
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (66) = happyShift action_130
action_125 _ = happyFail (happyExpListPerState 125)

action_126 (66) = happyShift action_129
action_126 _ = happyFail (happyExpListPerState 126)

action_127 (48) = happyShift action_128
action_127 _ = happyFail (happyExpListPerState 127)

action_128 (31) = happyShift action_38
action_128 (33) = happyShift action_11
action_128 (34) = happyShift action_12
action_128 (35) = happyShift action_13
action_128 (36) = happyShift action_14
action_128 (37) = happyShift action_15
action_128 (38) = happyShift action_39
action_128 (42) = happyShift action_42
action_128 (53) = happyShift action_44
action_128 (59) = happyShift action_45
action_128 (65) = happyShift action_46
action_128 (66) = happyShift action_47
action_128 (67) = happyShift action_48
action_128 (7) = happyGoto action_133
action_128 (9) = happyGoto action_28
action_128 (17) = happyGoto action_29
action_128 (18) = happyGoto action_30
action_128 (19) = happyGoto action_31
action_128 (20) = happyGoto action_32
action_128 (21) = happyGoto action_33
action_128 (25) = happyGoto action_35
action_128 (30) = happyGoto action_37
action_128 _ = happyFail (happyExpListPerState 128)

action_129 _ = happyReduce_58

action_130 _ = happyReduce_57

action_131 (63) = happyShift action_18
action_131 (16) = happyGoto action_132
action_131 _ = happyFail (happyExpListPerState 131)

action_132 _ = happyReduce_18

action_133 _ = happyReduce_15

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Program happy_var_1 []
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  4 happyReduction_2
happyReduction_2 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Program happy_var_1 happy_var_2
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_3  5 happyReduction_3
happyReduction_3 (HappyAbsSyn16  happy_var_3)
	_
	_
	 =  HappyAbsSyn5
		 (MainMethod happy_var_3
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  6 happyReduction_4
happyReduction_4 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  7 happyReduction_5
happyReduction_5 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn7
		 (IntStream happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  7 happyReduction_6
happyReduction_6 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn7
		 (Arith happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  7 happyReduction_7
happyReduction_7 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn7
		 (Boolean happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  7 happyReduction_8
happyReduction_8 (HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn7
		 (StringExpr happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  7 happyReduction_9
happyReduction_9 (HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn7
		 (Variable happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_2  7 happyReduction_10
happyReduction_10 (HappyTerminal (TokenVar happy_var_2))
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn7
		 (VarDec happy_var_1 happy_var_2
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  7 happyReduction_11
happyReduction_11 (HappyAbsSyn7  happy_var_3)
	_
	(HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn7
		 (VarAssign happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happyReduce 4 7 happyReduction_12
happyReduction_12 ((HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_2)) `HappyStk`
	(HappyAbsSyn21  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (VarDecAssign happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_13 = happySpecReduce_1  7 happyReduction_13
happyReduction_13 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn7
		 (FunctionApplicationT happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  7 happyReduction_14
happyReduction_14 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (Bracket happy_var_2
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happyReduce 9 7 happyReduction_15
happyReduction_15 ((HappyAbsSyn7  happy_var_9) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (IntStreamAssign happy_var_1 happy_var_3 happy_var_6 happy_var_9
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_2  8 happyReduction_16
happyReduction_16 _
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn8
		 (ExprStatement happy_var_1
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happyReduce 5 8 happyReduction_17
happyReduction_17 ((HappyAbsSyn16  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	(HappyAbsSyn7  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (IfElse happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 9 8 happyReduction_18
happyReduction_18 ((HappyAbsSyn16  happy_var_9) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (ForLoop happy_var_3 happy_var_5 happy_var_7 happy_var_9
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_3  8 happyReduction_19
happyReduction_19 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (Return happy_var_2
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happyReduce 4 9 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (PrintFunc happy_var_3
	) `HappyStk` happyRest

happyReduce_21 = happySpecReduce_2  9 happyReduction_21
happyReduction_21 _
	(HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn9
		 (FunctionApplication happy_var_1 []
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happyReduce 4 9 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (FunctionApplication happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_1  10 happyReduction_23
happyReduction_23 _
	 =  HappyAbsSyn10
		 ([]
	)

happyReduce_24 = happySpecReduce_3  10 happyReduction_24
happyReduction_24 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (happy_var_2
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happyReduce 4 11 happyReduction_25
happyReduction_25 ((HappyAbsSyn16  happy_var_4) `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	(HappyTerminal (TokenVar happy_var_2)) `HappyStk`
	(HappyAbsSyn21  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (FunctionDeclaration happy_var_2 happy_var_1 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_26 = happySpecReduce_1  12 happyReduction_26
happyReduction_26 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn12
		 ([happy_var_1]
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  12 happyReduction_27
happyReduction_27 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_3 : happy_var_1
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  13 happyReduction_28
happyReduction_28 (HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_2  14 happyReduction_29
happyReduction_29 (HappyTerminal (TokenVar happy_var_2))
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn10
		 ([(happy_var_1,happy_var_2)]
	)
happyReduction_29 _ _  = notHappyAtAll 

happyReduce_30 = happyReduce 4 14 happyReduction_30
happyReduction_30 ((HappyTerminal (TokenVar happy_var_4)) `HappyStk`
	(HappyAbsSyn21  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 ((happy_var_3,happy_var_4) : happy_var_1
	) `HappyStk` happyRest

happyReduce_31 = happySpecReduce_1  15 happyReduction_31
happyReduction_31 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  16 happyReduction_32
happyReduction_32 _
	(HappyAbsSyn24  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (happy_var_2
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  17 happyReduction_33
happyReduction_33 (HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  18 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn18
		 ([[]]
	)

happyReduce_35 = happySpecReduce_2  18 happyReduction_35
happyReduction_35 _
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1 : [[]]
	)
happyReduction_35 _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_2  18 happyReduction_36
happyReduction_36 _
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1 ++ [[]]
	)
happyReduction_36 _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  18 happyReduction_37
happyReduction_37 _
	(HappyAbsSyn17  happy_var_2)
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1 ++ [happy_var_2]
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_2  19 happyReduction_38
happyReduction_38 (HappyTerminal (TokenInt happy_var_2))
	_
	 =  HappyAbsSyn19
		 (I $ -happy_var_2
	)
happyReduction_38 _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  19 happyReduction_39
happyReduction_39 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn19
		 (I happy_var_1
	)
happyReduction_39 _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  19 happyReduction_40
happyReduction_40 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn19
		 (Add happy_var_1 happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  19 happyReduction_41
happyReduction_41 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn19
		 (Sub happy_var_1 happy_var_3
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  19 happyReduction_42
happyReduction_42 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn19
		 (Mul happy_var_1 happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  19 happyReduction_43
happyReduction_43 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn19
		 (Div happy_var_1 happy_var_3
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  19 happyReduction_44
happyReduction_44 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn19
		 (Mod happy_var_1 happy_var_3
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  20 happyReduction_45
happyReduction_45 (HappyTerminal (TokenBool happy_var_1))
	 =  HappyAbsSyn20
		 (B happy_var_1
	)
happyReduction_45 _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  20 happyReduction_46
happyReduction_46 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn20
		 (LessThan happy_var_1 happy_var_3
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  20 happyReduction_47
happyReduction_47 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn20
		 (Equality happy_var_1 happy_var_3
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  20 happyReduction_48
happyReduction_48 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn20
		 (And happy_var_1 happy_var_3
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_3  20 happyReduction_49
happyReduction_49 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn20
		 (Or happy_var_1 happy_var_3
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  20 happyReduction_50
happyReduction_50 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn20
		 (Not happy_var_1 happy_var_3
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_1  21 happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn21
		 (IntegerT
	)

happyReduce_52 = happySpecReduce_1  21 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn21
		 (BooleanT
	)

happyReduce_53 = happySpecReduce_1  21 happyReduction_53
happyReduction_53 _
	 =  HappyAbsSyn21
		 (BooleanType
	)

happyReduce_54 = happySpecReduce_1  21 happyReduction_54
happyReduction_54 _
	 =  HappyAbsSyn21
		 (StreamType
	)

happyReduce_55 = happySpecReduce_1  21 happyReduction_55
happyReduction_55 _
	 =  HappyAbsSyn21
		 (UnitType
	)

happyReduce_56 = happySpecReduce_3  21 happyReduction_56
happyReduction_56 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (FunctionType happy_var_1 happy_var_3
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_2  22 happyReduction_57
happyReduction_57 (HappyTerminal (TokenInt happy_var_2))
	_
	 =  HappyAbsSyn22
		 (Increment happy_var_2
	)
happyReduction_57 _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_2  22 happyReduction_58
happyReduction_58 (HappyTerminal (TokenInt happy_var_2))
	_
	 =  HappyAbsSyn22
		 (Decrement happy_var_2
	)
happyReduction_58 _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_1  23 happyReduction_59
happyReduction_59 (HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (reverse happy_var_1
	)
happyReduction_59 _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_1  24 happyReduction_60
happyReduction_60 (HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn24
		 (reverse happy_var_1
	)
happyReduction_60 _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_1  25 happyReduction_61
happyReduction_61 (HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn25
		 (reverse happy_var_1
	)
happyReduction_61 _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_1  26 happyReduction_62
happyReduction_62 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn26
		 (reverse happy_var_1
	)
happyReduction_62 _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_1  27 happyReduction_63
happyReduction_63 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn27
		 (reverse happy_var_1
	)
happyReduction_63 _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_1  28 happyReduction_64
happyReduction_64 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn28
		 ([happy_var_1]
	)
happyReduction_64 _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_2  28 happyReduction_65
happyReduction_65 (HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn28
		 (happy_var_2 : happy_var_1
	)
happyReduction_65 _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_1  29 happyReduction_66
happyReduction_66 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn29
		 ([happy_var_1]
	)
happyReduction_66 _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_2  29 happyReduction_67
happyReduction_67 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn29
		 (happy_var_2 : happy_var_1
	)
happyReduction_67 _ _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_1  30 happyReduction_68
happyReduction_68 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn30
		 ([happy_var_1]
	)
happyReduction_68 _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_2  30 happyReduction_69
happyReduction_69 (HappyTerminal (TokenInt happy_var_2))
	(HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn30
		 (happy_var_2 : happy_var_1
	)
happyReduction_69 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 68 68 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenEOL -> cont 31;
	TokenArrow -> cont 32;
	TokenIntType -> cont 33;
	TokenIntStreamType -> cont 34;
	TokenBooleanType -> cont 35;
	TokenBoolVal -> cont 36;
	TokenUnitType -> cont 37;
	TokenBool happy_dollar_dollar -> cont 38;
	TokenLoop -> cont 39;
	TokenIf -> cont 40;
	TokenElse -> cont 41;
	TokenPrint -> cont 42;
	TokenReturn -> cont 43;
	TokenMain -> cont 44;
	TokenSemiCol -> cont 45;
	TokenColon -> cont 46;
	TokenComma -> cont 47;
	TokenEq -> cont 48;
	TokenNotEq -> cont 49;
	TokenAnd -> cont 50;
	TokenOr -> cont 51;
	TokenAdd -> cont 52;
	TokenSub -> cont 53;
	TokenMul -> cont 54;
	TokenDiv -> cont 55;
	TokenMod -> cont 56;
	TokenNot -> cont 57;
	TokenLess -> cont 58;
	TokenLParen -> cont 59;
	TokenLBracket -> cont 60;
	TokenRParen -> cont 61;
	TokenRBracket -> cont 62;
	TokenLCurlyBracket -> cont 63;
	TokenRCurlyBracket -> cont 64;
	TokenVar happy_dollar_dollar -> cont 65;
	TokenInt happy_dollar_dollar -> cont 66;
	TokenString happy_dollar_dollar -> cont 67;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 68 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parseCalc tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError xs = error $ "Parse error on : " ++ (show xs)

parseString :: String -> Program
parseString = parseCalc . alexScanTokens

data Program = Program MainMethod [FunctionDeclaration] deriving (Eq,Show)

data MainMethod = MainMethod [Statement] deriving (Eq,Show)

data Expr 
     = IntStream [[Int]]
     | Arith ArithExpr
     | Boolean BoolExpr
     | StringExpr String
     | Variable String
     | VarDec Type String
     | VarAssign String Expr
     | VarDecAssign Type String Expr
     | FunctionApplicationT FunctionApplication
     | PrintExpr Expr 
     | Bracket Expr
     | IntStreamAssign String Expr Expr Expr -- variable_name, row_index, col_index, value
     deriving (Eq,Show)

data Statement
     = ExprStatement Expr
     | IfElse Expr [Statement] [Statement]
     | ForLoop Expr Expr IncOrDec [Statement]
     | Return Expr 
     deriving (Eq,Show)

data Block = Block [Statement] deriving (Eq,Show) -- List of one or more statements enclosed in curly braces

data Stream = Stream [[Int]] deriving (Eq,Show)

data IntStreamRow = IntStreamRow [Int] deriving (Eq,Show)

data FunctionDeclaration 
     = FunctionDeclaration String Type [(Type,String)] [Statement] --Name OutputType ParamsList Block 
     deriving (Eq,Show)

data ParamList = ParamList [(Type,String)] deriving (Eq,Show)
data FuncParamList = FuncParamList [(Type,String)] deriving (Eq,Show)

data FunctionApplication 
     = FunctionApplication String [Expr] -- Function name & ordered list of arguments 
     | PrintFunc Expr 
     deriving (Eq,Show)

data ArgsList = ArgsList [Expr] deriving (Eq,Show)     

data ArithExpr
     = I Int
     | Add Expr Expr
     | Sub Expr Expr
     | Mul Expr Expr
     | Div Expr Expr
     | Mod Expr Expr
     deriving (Eq,Show)

data BoolExpr
     = B Bool
     | LessThan Expr Expr
     | Equality Expr Expr
     | And Expr Expr
     | Or Expr Expr
     | Not Expr Expr 
     deriving (Eq,Show)
    
data Type 
     = IntegerT 
     | BooleanT 
     | StringT 
     | StreamT 
     | UnitT
     | FunctionType Type Type
     deriving (Eq,Show)

data IncOrDec = Increment Int | Decrement Int deriving (Eq,Show)
{-# LINE 1 "templates\GenericTemplate.hs" #-}
{-# LINE 1 "templates\\\\GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "D:/GitHub/haskell-platform/build/ghc-bindist/local/lib/include/ghcversion.h" #-}















{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "F:/Users/randy/AppData/Local/Temp/ghc1900_0/ghc_2.h" #-}


























































































































































































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "templates\\\\GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 









{-# LINE 43 "templates\\\\GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Int Happy_IntList







{-# LINE 65 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 75 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 84 "templates\\\\GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 137 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 147 "templates\\\\GenericTemplate.hs" #-}
indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 267 "templates\\\\GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 333 "templates\\\\GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
