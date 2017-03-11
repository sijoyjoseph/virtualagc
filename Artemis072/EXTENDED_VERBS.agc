### FILE="Main.annotation"
## Copyright:	Public domain.
## Filename:	EXTENDED_VERBS.agc
## Purpose:	Part of the source code for Artemis (i.e., Colossus 3),
##		build 072.  This is for the Command Module's (CM)
##		Apollo Guidance Computer (AGC), for
##		Apollo 15-17.
## Assembler:	yaYUL
## Contact:	Jim Lawton <jim DOT lawton AT gmail DOT com>
## Website:	www.ibiblio.org/apollo/index.html
## Page Scans:	www.ibiblio.org/apollo/ScansForConversion/Artemis072/
## Mod history:	2009-08-04 JL	Adapted from corresponding Comanche 055 file.
## 		2010-01-31 JL	Fixed build errors.
##		2010-02-13 JL	Fixed errors on p260, p261.
##		2010-02-16 JL	Added some SBANK= directives on pages 258, 262, 271, 274 to fix rope image errors.
##		2010-02-20 RSB	Un-##'d this header.
##		2010-12-29 JL	Fixed indentation.
##		2011-05-07 JL	Flagged SBANK= workarounds for future removal.
##		2011-05-17 JL	Removed all SBANK= workarounds.
##		2017-01-22 RSB	Proofed comment text by diff'ing vs Comanche 55
##				and corrected errors found.

## Page 249

		SETLOC	EXTVERBS
		BANK

		EBANK=	OGC

		COUNT*	$$/EXTVB

# FAN-OUT

GOEXTVB		INDEX	MPAC		# VERB-40 IS IN MPAC
		TC	LST2FAN		# FAN AS BEFORE.

LST2FAN		TC	VBZERO		# VB40 ZERO (USED WITH NOUN 20 ONLY).
		TC	VBCOARK		# VB41 COARSE ALIGN (USED WITH NOUN 20 OR
					#				91 ONLY)
		TC	IMUFINEK	# VB42 FINE ALIGN IMU
		TC	IMUATTCK	# VB43 LOAD IMU ATTITUDE ERROR METERS.
		TC	SETSURF		# VB44 SET SURFACE FLAG
		TC	RESTSRF		# VB45 RESET SURFACE FLAG
		TC	STABLISH	# VB46 ESTABLISH G+C CONTROL.
		TC	LMTOCMSV	# VB47 MOVE LM STATE VECTOR INTO CM
		TC	DAPDISP		# VB48 LOAD A/P DATA.
		TCF	CREWMANU	# VB 49 START AUTOMATIC ATTITUDE MANEUVER
		TC	GOLOADLV	# VB50 PLEASE PERFORM
		TC	GOLOADLV	# VB51 PLEASE MARK
		TC	V52		# VB52 SET OFFSET NO. FOR P22
		TC	GOLOADLV	# VB53 PLEASE PERFORM COAS MARK
		TC	GOTOR23		# V54 START R23 (R21-BACKUP)
		TC	ALINTIME	# VB55 ALIGN TIME
		TC	TRACKTRM	# VB56 TERMINATE TRACKING (P20 +P25)
		TC	V57CALL		# V57  FULTKFLG SETTING OPTION
		TC	ENATMA		# VB58 ENABLE AUTOMATIC ATTITUDE MANEUVER
		TC	GOLOADLV	# VB59 PLEASE CALIBRATE
		TC	V60		# VB60 SET CPHIX (N17) EQUAL TO CDU
		TC	V61		# VB61 SELECT MODE I
		TC	V62		# VB62 SELECT MODE II, ERROR WRT N22
		TC	V63		# VB63 SELECT MODE III, ERROR WRT N17
		TC	VB64		# VB64 CALCULATE,DISPLAY S-BAND ANT ANGLES
		TC	CKOPTVB		# V 65 E OPTICAL VERIFICATION FOR PRELAUNC
		TC	ATTACHED	# VB 66 ATTACHED. MOVE THIS TO OTHER STATE
		TC	V67		# VB67 WMATRIX MONITOR
		TC	ALM/END		# VB68 SPARE
VERB69		TC	VERB69		# VB 69 CAUSE RESTART
		TC	V70UPDAT	# VB70 UPDATE LIFTOFF TIME.
		TC	V71UPDAT	# VB71 UNIVERSAL UPDATE - BLOCK ADDRESS.
		TC	V72UPDAT	# VB72 UNIVERSAL UPDATE - SINGLE ADDRESS.
		TC	V73UPDAT	# VB73 UPDATE AGC TIME (OCTAL).
		TC	DNEDUMP		# VB74 INITIALIZE DOWN-TELEMETRY PROGRAM
					#	FOR ERASABLE DUMP.
		TC	LFTFLGON	# VB75 SET LIFTOFF FLAG.
		TC	ALM/END		# VB76 SPARE
## Page 250
		TC	ALM/END		# VB77 SPARE
		TC	CHAZFOGC	# CHANGE GYROCOMPASS LAUNCH AZIMUTH V78
		TC	ALM/END		# VB79 SPARE
		TC	LEMVEC		# VB80 UPDATE LEM STATE VECTOR
		TC	CSMVEC		# VB81 UPDATE CSM STATE VECTOR
		TC	V82PERF		# VB82 REQUEST ORBIT PARAM DISPLAY (R30)
		TC	V83PERF		# VB83 RANGE, RANGE RATE, +X AXIS  (R31)
		TC	ALM/END		# V84 SPARE
		TC	V85PERF		# VB85 RANGE, RANGE RATE, SLOS	   (R34)
		TC	V86PERF		# VB86 BACKUP MARK REJECT
		TC	SETVHFLG	# VB87 SET VHF RANGE FLAG
		TC	RESETVHF	# VB88 RESET VHF RANGE FLAG
		TC	V89PERF		# V89-ALIGN X OR PRF CSM AXIS TO LOS (R63)
		TC	V90PERF		# VB90-OUT OF PLANE PARAMETERS 	   %R36"
		TC	GOSHOSUM	# VB91 TEMP FOR HYBRID AND STG.
		TC	ALM/END		# VB92 SPARE
		TC	WMATRXNG	# VB93 CLEAR RENDWFLG
		TC	VERB94		# VB94 DO R64
		TC	ALM/END		# VB95 SPARE
		TCF	VERB96		# VB96 SET QUITFLAG TO STOP INTEGRATION
		TC	GOLOADLV	# V97 PLEASE PERFORM ENGINE-FAIL (R41)
		TC	ALM/END		# VB98 SPARE
		TC	GOLOADLV	# VB99 PLEASE ENABLE ENGINE

# END OF EXTENDED VERB FAN

TESTXACT	CCS	EXTVBACT
		TC	ALM/END		# YES. TURN ON OPERATOR ERROR LIGHT
		CA	FLAGWRD4	# ARE PRIOS USING DSKY
		MASK	14,12,7
		CCS	A
		TC	ALM/END

		CAF	OCT24		# SET BITS 3 AND 5
SETXTACT	TS	EXTVBACT	# NO. SET FLAG TO SHOW EXT VERB DISPLAY
					# SYSTEM BUSY

		CA	Q
		TS	MPAC +1

		CS	TWO		# BLANK EVERYTHING EXCEPT MM AND VERB
		TC	NVSUB
		TC	+1
		CCS	NEWJOB		# ALLOW POSSIBLE WAITING DISPLAY (FROM
		TC	CHANG1		#    RELDSP) TO COME UP.

		TC	MPAC +1

TERMEXTV 	EQUALS 	ENDEXT

## Page 251

ENDEXTVB	EQUALS	ENDEXT

ALM/END		TC	FALTON		# TURN ON OPERATOR ERROR LIGHT
GOPIN		TC	POSTJUMP
		CADR	PINBRNCH

## Page 252

# VBZERO	VERB 40		DESCRIPTION
VBZERO		CA	MODECADR	# KEYBOARD REQUEST FOR ISS CDU ZERO
		EXTEND
		BZF	+2
		TC	ALM/END
		TC	BANKCALL
		CADR	IMUZERO

		TC	BANKCALL	# STALL
		CADR	IMUSTALL
		TC	+1

		TC	GOPIN

## Page 253

# VBCOARK	VERB 41		DESCRIPTION
#	COURSE ALIGN IMU OR OPTICS
#
#	1. REQUIRE NOUN 20 OR NOUN 91 OR TURN ON OPERATOR ERROR
#	2. REQUIRE EXT VERB DISPLAY SYS AVAILABLE OR TURN ON OPERATOR ERROR LIGHT AND GO TO PINBRNCH.
#	CASE 1	NOUN 20	(ICDU ANGLES)
#	3. SET EXT VERB DISPLAY ACTIVE FLAG.
#	4. DISPLAY FLASHING V25,N22 (LOAD NEW ICDU ANGLES).
#	   RESPONSES
#		A. TERMINATE
#			1. RELEASE EXT VERB DISPLAY SYSTEM
#		B. PROCEED
#			1. DISPLAY FLASHING V25,N23 (LOAD DELTA ICDU ANGLES).
#				RESPONSES
#				A. TERMINATE
#					1. RELEASE EXT VERB DISPLAY SYSTEM.
#				B. PROCEED
#					1. EXECUTE ICORK2.
#				C. ENTER
#					1. INCREMENT CDU ANGLES
#					2. EXECUTE ICORK2.
#		C. ENTER
#			1. EXECUTE ICORK2.
# 	ICORK2
#		1. RE-DISPLAY VERB 41.
#		2. EXECUTE IMUCOARS (IMU COARSE ALIGN).
#		3. EXECUTE IMUSTALL (ALLOW TIME FOR DATA TRANSFER).
#		4. RELEASE EXT VERB DISPLAY SYSTEM.
#	CASE 2	NOUN 91	(OCDU ANGLES)
#	5. (REQUIRE OPTICS SWITCH TO BE AT COMPUTER OR TURN ON OPERATOR ERROR AND ALARM 115) AND (REQUIRE
#	   OPTICS AVAILABLE AND DISPLAY FLASHING V24,N92....LOAD NEW OPTICS ANGLES....OR TURN ON ALARM 117
#	   AND RELEASE EXT VERB DISPLAY SYSTEM).
#	6. RESPONSES TO V29,N92.
#		A. TERMINATE
#			RELEASE EXT VERB DISPLAY SYSTEM
#		B. PROCEED OR ENTER
#			RE-DISPLAY V41,	SET SWITCH TO INDICATE COURSE ALIGN OPTICS WORKING.
#			RELEASE EXT VERB DISPLAY SYSTEM.

VBCOARK		CS	OCT24
		AD	NOUNREG
		EXTEND
		BZF	IMUCOARK		# NOUN 20

		AD	OPIMDIFF		# -71
		EXTEND
		BZF	OPTCOARK		# NOUN 91

		TC	ALM/END			# WRONG NOUN

IMUCOARK	TC	TESTXACT		# COARSE ALIGN FROM KEYBOARD
## Page 254
		CAF	VNLODCDU		# CALL FOR THETAD LOAD
		TC	BANKCALL
		CADR	GOXDSPF
		TC	TERMEXTV
		TCF	+1

ICORK2		CAF	IMUCOARV		# RE-DISPLAY COARSE ALIGN VERB.
		TC	BANKCALL
		CADR	EXDSPRET

		TC	CKMODCAD
		TC	BANKCALL		# CALL MODE SWITCHING PROG
		CADR	IMUCOARS

		TC	BANKCALL		# STALL
		CADR	IMUSTALL
		TC	ENDEXTVB
		TC	ENDEXTVB

VNLODCDU	VN	2522
IMUCOARV	VN	4100
OPIMDIFF	DEC	-71

## Page 255

# TEMPORARY ROUTINE TO RUN THE OPTICS CDUS FROM THE KEYBOARD

OPTCOARK	TC	CHKPOOH			# ENSURE IN POO
		TC	TESTXACT
		CAF	EBANK5
		TS	EBANK

		CCS	SWSAMPLE		# SEE IF SWITCH AT COMPUTER
		TC	+5			# SWITCH AT COMPUTER
		TC	+1			# NOT ON COMPUTER
		TC	FALTON			# TURN ON OPERATOR ERR
		TC	ALARM			# AND ALARM
		OCT	00115

		CCS	OPTIND			# SEE IF OPTICS AVAILABLE
		TC	OPTC1			# IN USE
		TC	OPTC1			# IN USE
		TC	OPTC1			# IN USE

		TC	ALARM			# OPTICS RESERVED (OPTIND=-0)
		OCT	00117
		TC	ENDEXT

OPTC1		CAF	VNLDOCDU		# VERB-NOUN TO LOAD OPTICS CDUS
		TC	BANKCALL
		CADR	GOXDSPF
		TC	TERMEXTV
		TC	+1			# PROCEED

		CA	SAC
		TS	DESOPTS
		CA	PAC
		TS	DESOPTT
		CAF	OPTCOARV		# RE-DISPLAY OUR OWN VERB
		TC	BANKCALL
		CADR	EXDSPRET

		CAF	ONE
		TS	OPTIND			# SET COARS WORKING

		TC	ENDEXTVB

VNLDOCDU	VN	2492
OPTCOARV	EQUALS	IMUCOARV		# DIFFERENT NOUNS.

## Page 256

# IMUFINEK	VERB 42		DESCRIPTION
#	FINE ALIGN IMU
#
#	1. REQUIRE EXT VERB DISPLAY AVAILABLE AND SET BUSY FLAG OR TURN ON OPER ERROR AND GO TO PINBRNCH.
#	2. DISPLAY FLASHING V25,N93....LOAD DELTA GYRO ANGLES....
#		RESPONSES
#		A. TERMINATE
#			1. RELEASE EXT VERB DISPLAY SYSTEM.
#		B. PROCEED OR ENTER
#			1. RE-DISPLAY VERB 42
#			2. EXECUTE IMUFINE (IMU FIVE ALIGN MODE SWITCHING).
#			3. EXECUTE IMUSTALL (ALLOW FOR DATA TRANSFER)
#				A. FAILED
#					1. RELEASE EXT VERB DISPLAY SYSTEM.
#				B. GOOD
#					1. EXECUTE IMUPULSE (TORQUE IRIGS).
#					2. EXECUTE IMUSTALL AND RELEASE EXT VERB DISPLAY SYSTEM.

IMUFINEK	TC	TESTXACT		# FINE ALIGN WITH GYRO TORQUING
		CAF	VNLODGYR		# CALL FOR LOAD OF GYRO COMMANDS
		TC	BANKCALL
		CADR	GOXDSPF
		TC	TERMEXTV
		TC	+1			# PROCEED WITHOUT A LOAD

		CAF	IMUFINEV		# RE-DISPLAY OUR OWN VERB
		TC	BANKCALL
		CADR	EXDSPRET

		TC	CKMODCAD
		TC	BANKCALL		# CALL MODE SWITCH PROG
		CADR	IMUFINE

		TC	BANKCALL		# HIBERNATION
		CADR	IMUSTALL
		TC	ENDEXTVB

FINEK2		CAF	LGYROBIN		# PINBALL LEFT COMMANDS IN OGC REGISTERS
		TC	BANKCALL
		CADR	IMUPULSE

		TC	BANKCALL		# WAIT FOR PULSES TO GET OUT.
		CADR	IMUSTALL
		TC	ENDEXTVB
		TC	ENDEXTVB

LGYROBIN	ECADR	OGC
VNLODGYR	VN	2593
IMUFINEV	VN	4200			# FINE ALIGN VERB

CKMODCAD	CA	MODECADR
## Page 257
		EXTEND
		BZF	TCQ
		TC	FALTON
		TC	ENDEXTVB

# GOLOADLV	VERB 50		DESCRIPTION
#		AND OTHER PLEASE
#		DO SOMETHING VERBS
#
# 	PLEASE PERFORM, MARK, CALIBRATE, ETC.
#
#	1. PRESSING ENTER ON DSKY INDICATES REQUESTED ACTION HAS BEEN PERFORMED, AND THE PROGRAM DOES THE
#	   SAME RECALL AS A COMPLETED LOAD.
#	2. THE EXECUTION OF A VERB 33 (PROCEED WITHOUT DATA) INDICATES THE REQUESTED ACTION IS NOT DESIRED.

GOLOADLV	TC	FLASHOFF
		CAF	PINSUPBT
		EXTEND
		WRITE	SUPERBNK	# TURN ON FE7
		TC	POSTJUMP
		SBANK=	PINSUPER
		CADR	LOADLV1

# V60	VERB 60

V60		EXTEND			# SET ASTRONAUT TOTAL ATTITUDE (N17) EQUAL
		DCA	CDUX		# TO PRESENT ATTITUDE
		DXCH	CPHIX
		CA	CDUZ
		TS	CPHIX	+2
		TC	GOPIN

# V61	VERB 61

V61		TC	DOWNX		# CLEAR NEEDLFLG, PHASE
		ADRES	NEEDLFLG	# PLANE A/P FOLLOWING ERROR DISPLAYED
SETNEEDL	TC	UPX		# SET NEEDLFLG, TOTAL ATT ERR DISPLAYED

# V62	VERB 62

V62		TC	UPFLAG
		ADRES	N22ORN17	# COMPUTE TOTAL ATTITUDE ERROR WRT N22
		TC	SETNEEDL

# V63	VERB 63

V63		TC	DOWNFLAG
		ADRES	N22ORN17	# COMPUTE TOTAL ASTRONAUT ATTITUDE ERROR
		TC	SETNEEDL

## Page 258

# ALINTIME	VERB 55		DESCRIPTION
#	1. SET EXT VERB DISPLAY BUSY FLAG.
#	2. DISPLAY FLASHING V25,N24 (LOAD DELTA TIME FOR AGC CLOCK.
#	3. REQUIRE EXECUTION OF VERB 23.
#	4. ADD DELTA TIME, RECEIVED FROM INPUT REGISTER, TO THE COMPUTER TIME.
#	5. RELEASE EXT VERB DISPLAY SYSTEM

		COUNT*	$$/R33
ALINTIME	TC	TESTXACT

		CAF	VNLODDT
		TC	BANKCALL
		CADR	GOMARKF
		TC	ENDEXT		# TERMINATE
		TC	ENDEXT		# PROCEED
		CS	DEC23		# DATA IN OR RESEQUENCE (UNLIKELY)
		AD	MPAC		# RECALL LEFT VERB IN MPAC
		EXTEND
		BZF	UPDATIME	# GO AHEAD WITH UPDATE ONLY IF RECALL
		TC	ENDEXT		#	WITH V23 (DATA IN).
UPDATIME	INHINT			# DELTA TIME IS IN DSPTEM1, +1.
		CAF	ZERO
		TS	L		# ZERO T1 & 2 WHILE ALIGNING.
		DXCH	TIME2
		DXCH	MPAC
		DXCH	DSPTEM2 +1	# INCREMENT
		DAS	MPAC

		TC	DPAGREE		# FORCE SIGN AGREEMENT
		DXCH	MPAC		# NEW CLOCK.
		DAS	TIME2
		RELINT
UPDTMEND	TC	ENDEXT
VNLODDT		VN	2524		# V25N24 FOR LOAD DELTA TIME

# REDO AND TSELECT ARE NOW IN SYSTEM TEST.

		COUNT*	$$/EXTVB
# CKOPTVB	VERB 65		DESCRIPTION
#	OPTICAL VERIFICATION FOR PRELAUNCH.
#	1. SCHEDULE GCOMPVER, OPTICAL VERIFICATION SUBPROGRAM, WITH PRIORITY 17.

CKOPTVB		TC	CHECKMM
		MM	02		# I WONDER IF PRELAUNCH IS RUNNING
		TC	ALM/END		# NOT RUNNING OPERATOR ERROR
		CAF	PRIO16		# PRELAUNCH OPTICAL VERIFICATION
		TC	FINDVAC
		EBANK=	QPLACE
		2CADR	COMPVER		# STANDARD LEADIN TO GCOMPVER.

## Page 259
		TC	GOPIN

# V 78 ....	TO CHANGE GYROCOMPASS AZIMUTH

CHAZFOGC	TC	CHECKMM		# IS IT PRELAUNCH
		MM	02
		TC	ALM/END		# NO - OPERATOR ERROR

		CAF	PRIO16		# PRELAUNCH AZIMUTH CHANGE
		TC	FINDVAC
		EBANK=	XSM
		2CADR	AZMTHCG1

		TC	PHASCHNG
		OCT	00174
4P17SPT1	=	4.17SPOT
		TC	GOPIN

## Page 260

# IMUATTCK	VERB 43		DESCRIPTION
#	LOAD IMU ATTITUDE ERROR METERS
#	1. REQUIRE PROGRAM 00 ACTIVE, COARSE ALIGN ENABLE BIT OFF AND ZERO ICDU BIT OFF.
#	2. IF GUID REF RELEASE OR LIFTOFF HAS OCCURRED REQUIRE EXT VERB DISPLAY AVAILABLE AND SET BUSY
#	   FLAG, OTHERWISE ALLOW CURRENT EXT VERB DISPLAY TO BE OVER-RIDDEN.
#	3. REMOVE COARSE ALIGN ENABLE AND IMU ERROR COUNTER ENABLE
#	4. DISPLAY FLASHING V25,N22 (LOAD NEW ICDU ANGLES).
#	5. UPON PROCEED OR ENTER RESPONSE, INITIALIZE CURRENT DAC AND COMMAND VALUES, ENABLE ERROR COUNTERS
#	   TRANSFER LOADED VALUES TO REGISTERS, AND SEND COMMANDS.
#	6. IF BUSY FLAG SET, RESET IT TO RELEASE EXT VERB DISPLAY.

IMUATTCK	TC	CHKPOOH

		CAF	BITS4&5		# CHECK IF IMU ZERO AND IMU COARSE ARE ON
		EXTEND
		RAND	CHAN12
		CCS	A
		TCF	ALM/END		# NOT ALLOWED IF IMU COARSE OR IMU ZERO ON

		TC	CKLFTBTS	# IS IT BEFORE OR AFTER LIFTOFF
		TC	TESTXACT	# AFTER
		CS	OCT50		# REMOVE COARSE AND ECTR ENABLE.
		EXTEND
		WAND	CHAN12

		CAF	VNLODCDU
		TC	BANKCALL
		CADR	GOXDSPF
		TCF	TRMATTCK
		TC	+1
		TC	E6SETTER	# FOR NEEDLES.

		EBANK=	AK

		TC	BANKCALL	# INITIALIZE CURRENT DAC AND
		CADR	NEEDLE11	# COMMAND VALUES

		TC	BANKCALL	# ENABLE ERROR COUNTERS.
		CADR	NEEDLER2

		CAF	TWO		# 4 MS MIN.
		TC	TWIDDLE
		ADRES	ATTCK1
TRMATTCK	TC	CKLFTBTS	# IS IT BEFORE OR AFRER LIFTOFF
		TCF	ENDEXT		# AFTER
		TC	GOPIN

ATTCK1		EXTEND			# TRANSFER LOADED VALUES TO DESIRED REGS.
		DCA	THETAD
## Page 261
		DXCH	AK
		CAE	THETAD	+2
		TS	AK	+2

		TC	IBNKCALL	# SENDS COMMANDS LIMITED TO +,- 384 PULSES
		CADR	NEEDLES		# AND LEAVES ERROR COUNTERS ENABLED.

		TC	TASKOVER

CKLFTBTS	CAF	GRRBKBIT	# HAS LIFTOFF OCCURRED
		MASK	FLAGWRD5
		CCS	A
XACT0Q		TC	Q		# YES
		CAF	BIT5
		EXTEND
		RAND	CHAN30
		TCF	INCRQCK
VB64		TC	TESTXACT
		CAF	PRIO4
		TC	FINDVAC
		EBANK=	RHOSB
		2CADR	SBANDANT	# CALC.,DISPLAY S-BAND ANTENNA ANGLES.

		TC	ENDOFJOB

# ENATMA	VERB 58		DESCRIPTION
#	ENABLE AUTOMATIC ATTITUDE MANEUVER
#
# VERB58 RESETS STIKFLAG TO ENABLE R61 TO PERFORM AUTOMATIC TRACKING MANEUVERS, AFTER INTERUPTIONS BY RHC ACT-
# IVITY.

ENATMA		TC	UPFLAG		# SET FLAG TO ENABLE R60 MANEUVER
		ADRES	V50N18FL
		TC	DOWNX		# RESET STIKFLAG.
		ADRES	STIKFLAG

# STABLISH	VERB 46		DESCRIPTION
#	ESTABLISH G & N AUTOPILOT CONTROL
#	1. SETS UP EITHER RCS, ENTRY, OR SATURN
#	2. IF TVC IS ON, SETS UP CSM/LM SWITCH-OVER
#		FROM HIGH BW TO LOW BW


STABLISH	TC	E6SETTER

		CS	FLAGWRD6	# TEST FOR TVC
		MASK	DPCONFIG
		EXTEND
		BZMF	DAPFIG
## Page 262
		CAE	DAPDATR1	# TET FOR CSM/LM
		MASK	BIT14
		EXTEND
		BZMF	ALM/END		# CSM, SO ALARM AND EXIT

		TC	BANKCALL	# CSM/LM, SO PERFORM HB TO LB SWITCH-OVER
		CADR	SWICHOVR

		TC	GOPIN

DAPFIG		CS	BIT9		# TURN OFF SIVB TAKEOVER
		EXTEND
		WAND	CHAN12
		CAE	DAPDATR1	# DETERMINE VEHICLE CONFIGURATION
		EXTEND
		MP	BIT3		# RIGHT SHIFT 4 OCTAL DIGITS
		MASK	THREE		# (IN CASE BIT 15 IS USED)
		INHINT
		INDEX	A
		TCF	+1		# BRANCH BASED ON CONFIG
		TCF	NODAPUP		# CM.. ACTIVATE NODAP
		TCF	RCSDAPUP	# CSM..ACTIVATE RCSDAP
		TCF	RCSDAPUP	# CSM/LM ACTIVATE RCSDAP
SATSTKON	EXTEND
		DCA	2REDOSAT
		DXCH	T5LOC
		CAF	POSMAX
		TS	TIME5
		CS	FLAGWRD6	# TURN ON BITS 15,14 OF FLAGWRD6
		MASK	DPCONFIG
		ADS	FLAGWRD6	# SATSTICK CONTROL OF T5
		TC	IBNKCALL	# ZERO JET CHANNELS IN 14MS AND THEN
		CADR	ZEROJET		# LEAVE THE T6 CLOCK DISABLED
		TC	GOPIN		# EXIT THUS BECAUSE WE CAME VIA V46

		EBANK=	SPOLYARG
2REDOSAT	2CADR	REDOSAT

RCSDAPUP	TC	IBNKCALL
		CADR	RCSDAPON
		TCF	GOPIN

NODAPUP		TC	IBNKCALL	# ZERO JET CHANNELS IN 14 MS. AND THEN
		CADR ZEROJET		# LEAVE THE T6 CLOCK DISABLED.
		CAF	BIT1
		TS	HOLDFLAG	# KILL KALCMANU JOB

EXDAPOFF	EXTEND
		DCA	IDLECADR	# SET T5 TO IDLE
## Page 263
		DXCH	T5LOC
		CS	DPCONFIG
		MASK	FLAGWRD6
		TS	FLAGWRD6

		TC	GOPIN

## Page 264

# CREWMANU	VERB 49		DESCRIPTION
#	START AUTOMATIC ATTITUDE MANEUVER
#	1. REQUIRE PROGRAM 00 ACTIVE.
#	2. SET EXT VERB DISPLAY BUSY FLAG.
#	3. SCHEDULE R62DISP WITH PRIORITY 10.
#	4. RELEASE EXT VERB DISPLAY.
#
#	R62DISP
#	1. DISPLAY FLASHING V06,N22 (DECIMAL DISPLAY NEW ICDU ANGLES). UPON IMMEDIATE RETURN, SET-UP GROUP
#	   4 FOR RESTART OF DISPLAY SEQUENCE.
#		RESPONSES
#		A. TERMINATE
#			1. GO TO GOTOPOOH.
#		B. PROCEED
#			1. SET 3AXISFLG TO INDICATE MANEUVER IS SPECIFIED BY 3 AXIS.
#			2. EXECUTE R60CSM (ATTITUDE MANEUVER).
#			3. ZERO GROUP 4 (END R62).
#		C. ENTER
#			1. REPEAT FLASHING V06,N22.

CREWMANU	TC	CHKPOOH		# DEMAND POO

		TC	TESTXACT

		CAF	PRIO10
		TC	FINDVAC
		EBANK=	R61CNTR
		2CADR	R62DISP

		TC	ENDOFJOB
## Page 265
# DAPDISP	VERB 48		DESCRIPTION
#	LOAD AUTOPILOT DATA (ROUTINE R03)
#	0.	CHECKFAIL AND RETURN IF TVC.
#	1.	REQUIRE EXT VERB DISPLAY AVAILABLE AND SET BUSY FLAG.
#	2.	LOWER PRIORITY TO 10.
#	3.	DISPLAY FLASHING V04,N46 (DISPLAY AUTOPILOT CONFIGURATION)
#	4.	UPON PROCEED RESPONSE, EXECUTE S41.2.
#	5.	DISPLAY FLASHING V06,N47 (DISPLAY CSM WGT., LEM WGT.)
#	6.	UPON PROCEED RESPONSE EXECUTE S40.14.
#	7.	DISPLAY FLASHING V06,N48 (DISPLAY PITCH TRIM, YAW TRIM)
#	8.	UPON PROCEED RESPONSE, RELEASE EXTENDED VERB DESPLAY SYSTEM

		COUNT*	$$/EXTVB
DAPDISP		CS	FLAGWRD6
		MASK	DPCONFIG
		EXTEND
		BZMF	+2		# TVC = 10, CS YIELDS 01, BZMF TO CONTINUE
		TC	ALM/END		# RETURN IF TVC

		TC	TESTXACT
		CAF	PRIO10
		TC	NOVAC
		EBANK=	DAPDATR1
		2CADR	DONOUN46

		TC	ENDOFJOB

		SETLOC	EXTVBS
		BANK
		COUNT*	$$/R03
DONOUN46	CAF	V04N46		#    R1         R2
		TC	BANKCALL	#  DAPDATR1   DAPDATR2
		CADR	GOXDSPF		# GOXDSP ROUTINES USED FOR EXTENDED VERBS.

		TC	ENDEXT		# EXT. VBS GO TO ENDEXT, NOT ENDOFJOB.
		TC	+2
		TC	DONOUN46

		CA	DAPDATR1
		MASK	BIT4
		CCS	A
		TCF	MAXIN
		TC	DOWNFLAG
		ADRES	MAXDBFLG
MAXOUT		TC	BANKCALL
		CADR	S41.2

DONOUN47	CAF	V06N47		#    R1         R2        R3
		TC	BANKCALL	# CSM WGT.   LEM WGT.    BLANK
		CADR	GOXDSPF
## Page 266
		TC	ENDEXT
		TC	+2
		TC	DONOUN47
		CAE	DAPDATR1	# DO MASS PROPERTIES CALCULATION ONLY IF
		MASK	PRIO30		# CONFIG = 1(CSM), 2(CSM/LM), 6(CSM/LMA)
		EXTEND
		BZF	DONOUN48	# SKIP IF 0, 4
		COM
		MASK	PRIO30
		EXTEND
		BZF	DONOUN48	# SKIP IF 3, 7
		INHINT
		TC	IBNKCALL
		CADR	MASSPROP	# UPDATE IXX, IAVG, IAVG/TLX

		RELINT
		TC	BANKCALL
		CADR	S40.14		# COMPUTE RCS DAP STUFF

DONOUN48	CAF	V0648		#    R1         R2         R3
		TC	BANKCALL	#   PTRIM      YTRIM      BLANK
		CADR	GOXDSPF

		TC	ENDEXT
		TC	ENDEXT
		TC	DONOUN48

MAXIN		TC	UPFLAG
		ADRES	MAXDBFLG
		TC	MAXOUT

V0648		VN	0648
V06N47		VN	0647
V04N46		VN	0446
		BANK	43
		SETLOC	EXTVERBS
		BANK

		COUNT*	$$/EXTVB

# V82PERF	VERB82		DESCRIPTION
#	REQUEST ORBIT PARAMETERS DISPLAY (R30)
#	1. IF AVERAGE G IS OFF:
#		FLASH DISPLAY V04N06. R2 INDICATES WHICH SHIP'S STATE VECTOR IS
#		 TO BE UPDATED. INITIAL CHOICE IS THIS SHIP (R2=1). ASTRONAUT
#		 CAN CHANGE TO OTHER SHIP BY V22EXE, WHERE X NOT EQ 1.
#		SELECTED STATE VECTOR UPDATED BY THISPREC (OTHPREC).
#		CALLS SR30.1 (WHICH CALLS TFFCONMU + TFFRP/RA) TO CALCULATE
#		 RPER (PERIGEE RADIUS), RAPO (APOGEE RADIUS), HPER (PERIGEE
#		 HEIGHT ABOVE LAUNCH PAD OR LUNAR LANDING SITE), HAPO (APOGEE
#		 HEIGHT AS ABOVE), TPER (TIME TO PERIGEE), TFF (TIME TO
#		 INTERSECT 300 KFT ABOVE PAD OR 35KFT ABOVE LANDING SITE).
## Page 267
#		FLASH MONITOR V16N44 (HAPO, HPER, TFF). TFF IS -59M59S IF IT WAS
#		 NOT COMPUTABLE, OTHERWISE IT INCREMENTS ONCE PER SECOND.
#		 ASTRONAUT HAS OPTION TO MONITOR TPER BY KEYING IN N 32 E.
#		 DISPLAY IS IN HMS, IS NEGATIVE (AS WAS TFF), AND INCREMENTS
#		 ONCE PER SECOND ONLY IF TFF DISPLAY WAS -59M59S.
#
#	2.IF AVERAGE G IS ON:
#		CALLS SR30.1 APPROX EVERY TWO SECS.  STATE VECTOR IS ALWAYS
#		 FOR THIS VEHICLE. V82 DOES NOT DISTURB STATE VECTOR.  RESULTS
#		 OF SR30.1 ARE RAPO, RPER, HAPO, HPER, TPER, TFF.
#		FLASH MONITOR V16N44 (HAPO, HPER, TFF).
#		 IF MODE IS P11, THEN CALL DELRSPL SO ASTRONAUT CAN MONITOR
#		 RESULTS BY N50E.  SPLASH COMPUTATION DONE ONCE PER TWO SECS.
#
# ADDENDUM: HAPO AND HPER SHOULD BE CHANGED TO READ HAPOX AND HPERX IN THE
#	    ABOVE REMARKS.

V82PERF		TC	TESTXACT
		CAF	PRIO7
		TC	PRIOCHNG
		TC	POSTJUMP
		CADR	V82CALL		# ***** V82CALL MUST NOT BE A FINDVAC JOB.

# VB83PERF	VERB 83		DESCRIPTION
#	REQUEST RENDEZVOUS PARAMETER DISPLAY (R31)
#	1. SET EXT VERB DISPLAY BUSY FLAG.
#	2. SCHEDULE V83CALL WITH PRIORITY 10.
#		A. DISPLAY
#			R1  RANGE
#			R2  RANGE RATE
#			R3  THETA

V83PERF		TC	TESTXACT
		TC	UPFLAG
		ADRES	R31FLAG
 +3		CAF	PRIO5
		TC	NOVAC
		EBANK=	SUBEXIT
		2CADR	R31CALL

		TC	ENDOFJOB

V85PERF		TC	TESTXACT
		TC	DOWNFLAG	# RESET R31 FLAG TO INDICATE R34
		ADRES	R31FLAG
		TC	V83PERF	+3
## Page 268

# GOTOR23	VERB 54		DESCRIPTION
# 	SET UP MARKING FOR R22 (REND TRACK DATA PROC)
# 	1. SET EXT VERB DISPLAY BUSY FLAG
# 	2. IF REND (P20 RUNNING) + TRACK (TRACKING ALLOWED) FLAGS ARE SET,
#	    SCHEDULE R23 WITH PRIORITY 16, OTHERWISE TURN ON ALARM 406
# 	3. RELEASE EXT VERB DISPLAY SYSTEM

GOTOR23		TC	TESTXACT
		CA	FLAGWRD0	# V54 UNACCEPTABLE UNLESS BOTH
		MASK	RNDVZBIT	#	RENDEZVOUS AND TRACK FLAGS ON
		EXTEND
		BZF	R22ALARM

		CA	FLAGWRD1
		MASK	TRACKBIT
		EXTEND
		BZF	R22ALARM

		CAF	PRIO16		# LOWER THAN R22
		TC	NOVAC
		EBANK=	MRKBUF1
		2CADR	R23CSM

		TC	ENDOFJOB
R22ALARM	TC	ALARM		# VERB 57 WAS SELECTED AND NEITHER REND
		OCT	00406		#	NOR TRACK FLAG WERE ON.
		TC	ENDEXT

## Page 269
# VERB 86	DESCRIPTION
#	V86 IS TO R23 AS MARK REJECT IS TO R21
#	V86 IS THE MARK REJECT FOR R23(THE BACKUP MARKING ROUTINE)

		EBANK=	MRKBUF1
V86PERF		TC	E7SETTER	# BACKUP MARK REJ.
		CA	MRKBUF1
		EXTEND
		BZF	+3
		EXTEND
		BZMF	BKRJCT

		CA	NEGONE
		TS	MRKBUF1
		TC	GOPIN
BKRJCT		CAF	R22CABIT
		MASK	FLAGWRD9
		EXTEND
		BZF	GOPIN

		TC	UPFLAG
		ADRES	REJCTFLG
		TCF	GOPIN

## Page 270
# TRACKTRM	VERB 56		DESCRIPTION
#	TERMINATE TRACKING (P20)
#	1. KNOCK DOWN RENDEZVOUS, TRACK, AND UPDATE FLAGS.
#	2. REQUIRE P20 NOT RUNNING ALONE OR GO TO GOTOPOOH (REQUEST PROGRAM 00).
#	3. REQUIRE R22 RUNNING OR GO TO PINBRNCH.
#	4. IF INTEGRATION RUNNING, STALL UNTIL IT IS COMPLETED, THEN ZERO GROUPS 2 AND 3 TO KILL R21 + R22.
#	3. KNOCK DOWN RENDEZVOUS, R22, R21, TRACK, UPDATE, AND TARG1 FLAGS.
#	4. GO TO ENEMA (SOFTWARE RESTART).
#	REFERENCE
#		P20	RENDEZVOUS	NAVIGATION.
#		R21	RENDEZVOUS	TRACKING SIGHTING MARK.
#		R22	RENDEZVOUS	TRACKING DATA PROCESSING.

TRACKTRM	TC	INTPRET
		CLEAR	BON
			R67FLAG
			UTFLAG
			TRACKCHK
		BOFF	CLEAR
			RNDVZFLG
			EXPIN1
			AUTOSEQ
		CLEAR	CLEAR
			R21MARK
			UPDATFLG
TRACKCHK	BOFCLR	CLEAR
			TRACKFLG
			EXPIN
			IMUSE
		CLEAR	CLEAR
			RNDVZFLG
			UTFLAG
		RTB	CALL
			INITSUBB	# DO STOPRATE AND RESTOREDB
			INTSTALL	# DONT INTERRUPT INTEGRATION
		EXIT
		
		TC	2PHSCHNG
		OCT	2		# KILL GROUP 2 TO HALT P20 ACTIVITY
		OCT	1		# ALSO KILL GROUP 1

CLEANOUT 	INHINT
		TC	POSTJUMP
		CADR	ENEMA		# CAUSE RESTART

EXPIN		CLEAR	CLEAR
			RNDVZFLG
			UTFLAG
EXPIN1		EXIT
## Page 271
		TC	GOPIN

# LEMVEC	VERB 80		DESCRIPTION
#	UPDATE LEM STATE VECTOR
#		RESET VEHUPFLG TO 0

LEMVEC		TC	DOWNX
		ADRES	VEHUPFLG	# VEHUPFLG DOWN INDICATES LEM

CSMVEC		TC	UPX		# VEHUPFLG UP INDICATES CM.

# CSMVEC	VERB 81		DESCRIPTION
#	UPDATE CSM STATE VECTOR
#		SET VEHUPFLG TO 1

# DNEDUMP	VERB 74		DESCRIPTION
#	INITIALIZE DOWN-TELEMETRY PROGRAM FOR ERASABLE MEMORY DUMP.
#	2. REPLACE CURRENT DOWNLIST WITH ERASABLE MEMORY.
#	3. RELEASE EXT VERB DISPLAY.

DNEDUMP		CAF	LDNDUMPI
		TS	DNTMGOTO
		TC	GOPIN

V74		EQUALS	DNEDUMP
LDNDUMPI	REMADR	DNDUMPI

# LFTFLGON	VERB 75		DESCRIPTION
#	SET LIFT-OFF FLAG
#	1. SETUP GGRBKFLG, GUIDANCE REFERENCE RELEASE BACK-UP FLAG.
#	2. RETURN VIA PINBRNCH

		ADRES	GRRBKFLG	# MUST PRECEDE LFTFLGON
LFTFLGON	TC	UPX

CHKPOOH		CA	MODREG
		EXTEND
		BZF	TCQ
		TCF	ALM/END

		EBANK=	PACTOFF
IDLECADR	2CADR	T5IDLOC

## Page 272
# VERB 89	DESCRIPTION	RENDEZVOUS FINAL ATTITUDE ROUTINE (R63)
#
# CALLED BY VERB 89 ENTER DURING P00. PRIO 10 USED. CALCULATES AND
# DISPLAYS FINAL GIMBAL ANGLES TO POINT CSM +X AXIS OR PREFERRED AXIS
# (UNIT(Z)COS55 DEG + UNIT(X)SIN55 DEG) AT LM.
#
# 1. KEY IN V 89 E ONLY IF IN PROG 00. IF NOT IN P00, OPERATOR ERROR AND
# EXIT R63, OTHERWISE CONTINUE.
#
# 2. IF IN P00, DO IMU STATUS CHECK (R02BOTH). IF IMU ON AND ITS
# ORIENTATION KNOWN TO CGC, CONTINUE.
#
# 3. FLASH DISPLAY V 04 N 06. R2 INDICATES WHICH SPACECRAFT AXIS IS TO
# BE POINTED AT LM.  INITIAL CHOICE IS PREFERRED AXIS. (R2=1).
# ASTRONAUT CAN CHANGE TO (+X) AXIS (R2 NOT= 1) BY V 22 E 2 E. CONTINUE
# AFTER KEYING IN PROCEED.
#
# 4. SET PREFERRED ATTITUDE FLAG ACCORDING TO OPTION DESIRED. SET FLAG
# FOR PREFERRED AXIS. RESET FLAG FOR X AXIS.
#
# 5. CURRENT TIME IS STORED AND R63COMP IS CALLED
#
#	R63COMP JOB:
#
#		UPDATES CSM AND LM STATE VECTORS USING CONIC EQUATIONS
#
#		CALCULATES BOTH PREFERRED AND X AXIS TRACKING ATT FROM CSM TO LM.
#
#		DESIRED GIMBAL ANGLES AS INDICATED BY PREFERRED ATTITUDE FLAG
#		ARE STORED FOR LATER R60CSM CALL.
#
# 6.  FLASH DISPLAY V 06 N18 AND AWAIT RESPONSE.
#
# 7.  RECYCLE- RETURN TO STEP 5.
#     TERMINATE- EXIT R63 ROUTINE
#     PROCEED- RESET 3AXISFLG AND CALL R60CSM FOR ATTITUDE MANEUVER.

V89PERF		TC	CHKPOOH		# DEMAND P00
		TC	TESTXACT
		CAF	PRIO10
		TC	FINDVAC
		EBANK=	R61CNTR
		2CADR	V89CALL

		TCF	ENDOFJOB

WMATRXNG	TC	DOWNFLAG	# RESET RENDWFLG
		ADRES	RENDWFLG
		TC	DOWNX
## Page 273
		ADRES	ORBWFLAG

GOSHOSUM	EQUALS	SHOWSUM

SHOWSUM		TC	CHKPOOH
		TC	TESTXACT	# *
		CAF	S+1		# *
		TS	SKEEP6		# * SHOWSUM OPTION
		CAF	S+ZERO		# *
		TS	SMODE		# * TURN OFF SELF-CHECK
		CA	SELFADRS	# *
		TS	SELFRET		# *
		TC	STSHOSUM	# * ENTER ROPECHK

SDISPLAY	LXCH	SKEEP2		# * BNK NO FOR DSP
		LXCH	SKEEP3		# * BUGGER WORD FOR DSP
NOKILL		CA	ADRS1		# *
		TS	MPAC +2		# *
		CA	VNCON		# * 0501
		TC	BANKCALL	# *
		CADR	GOXDSPF		# *
		TC	+3		# *
		TC	NXTBNK		# *
		TC	NOKILL		# *
		CA	SELFADRS
		TS	SKEEP1

		TC	ENDEXT		# *

VNCON		VN	501		# *

ENDSUMS		CA	SKEEP6		# *
		EXTEND			# *
		BZF	SELFCHK		# * ROPECHK, START SELFCHK AGAIN.
		TC	STSHOSUM	# * START SHOWSUM AGAIN.


# VB 87  SET VHF RANGE FLAG - ALLOWS R22 TO ACCEPT RANGE DATA.

# VB 88  RESET VHF RANGE FLAG - STOPS ACCEPTANCE OF RANGE DATA.

RESETVHF	TC	TRFAILOF	# TRACKER FAIL LIGHT
		TC	DOWNX
		ADRES	VHFRFLAG
SETVHFLG	TC	UPX		# V87 SET VHF RANGE FLAG

# VERB 66.	VEHICLES ARE ATTACHED. - MOVE THIS VEHICLE STATE VECTOR TO
#		OTHER VEHICLE STATE VECTOR.

## Page 274
# USE SUBROUTINE GENTRAN.

		EBANK=	RRECTHIS
ATTACHED	CAF	PRIO10
		TC	FINDVAC
		EBANK=	RRECTHIS
		2CADR	ATTACHIT

		TC	ENDOFJOB

		SETLOC	EXTVRBS1
		BANK
		COUNT*	$$/EXTVB
ATTACHIT	TC	INTPRET
		CALL
			INTSTALL
		SET	BON
			MOONOTH
			MOONTHIS
			CMMOVE
		CLEAR
			MOONOTH
CMMOVE		EXIT
		CAF	OCT51
		TC	GENTRAN
		ADRES	RRECTHIS	# OUR STATE VECTOR INTO OTHER VIA GENTRAN
		ADRES	RRECTOTH

TACHEXIT	TC	INTPRET
		CALL			# UPDATE RN, VN, R-OTHER, V-OTHER
			PTOACSM
		LXA,2	CALL
			PBODY
			SVDWN1
		CALL
			SVDWN2
		CALL	
			INTWAKE0
TCPIN		RTB
			PINBRNCH

OCT51		OCT	51

		SETLOC	EXTVERBS
		BANK
		COUNT*	$$/EXTVB

# VERB 47  MOVE LM STATE VECTOR INTO CM STATE VECTOR.

LMTOCMSV	CAF	PRIO10
		TC	FINDVAC
## Page 275
		EBANK=	RRECTHIS
		2CADR	LMTOCM

		TC	ENDOFJOB

		SETLOC	EXTVRBS1
		BANK

		COUNT*	$$/EXTVB
LMTOCM		TC	INTPRET
		CALL
			INTSTALL
		SET	BON
			MOONTHIS
			MOONOTH
			LMMOVE
		CLEAR
			MOONTHIS
LMMOVE		EXIT
		CAF	OCT51
		TC	GENTRAN
		ADRES	RRECTOTH	# LM STATE VECTOR INTO CM VIA GENTRAN
		ADRES	RRECTHIS

		TCF	TACHEXIT

# VERB 94  DO R64 VIA ENEMA TO PICK UP IN P23.

		SETLOC	EXTVERBS
		BANK
		COUNT*	$$/EXTVB
VERB94		CAF	V94FLBIT
		MASK	FLAGWRD9	# IS V94FLAG SET
		EXTEND
		BZF	ALM/END		# NO - OPERATOR ERROR

		TC	DOWNFLAG
		ADRES	V94FLAG

		TC	CHECKMM		# IS IT P23
		MM	23
		TC	ALM/END		# NO - OPERATOR ERROR
		TC	PHASCHNG
		OCT	112		# SET GROUP 2 TO DO R64

2P11SPT1	=	2.11SPOT
		TC	CLEANOUT	# CAUSE RESTART

# V90PERF	VERB 90		DESCRIPTION
#	REQUEST RENDEZVOUS OUT-OF-PLANE DISPLAY (R36)
## Page 276
#	1. SET EXT VERB DISPLAY BUSY FLAG.
#	2. SCHEDULE R36 CALL WITH PRIORITY 10
#		A. DISPLAY
#			TIME OF EVENT - HOURS , MINUTES , SECONDS
#			Y 	OUT-OF-PLANE POSITION - NAUTICAL MILES
#			YDOT	OUT-OF-PLANE VELOCITY - FEET/SECOND
#			PSI	ANGLE BTW LINE OF SIGHT AND FORWARD
#				DIRECTION VECTOR IN HORIZONTAL PLANE - DEGREES

V90PERF		TC	TESTXACT
		CAF	PRIO7		# R36.V90
		TC	FINDVAC
		SBANK=	PINSUPER
		EBANK=	TIG
		2CADR	R36

		TCF	ENDOFJOB

# VERB 96  SET QUITFLAG TO STOP INTEGRATION.

VERB96		TC	UPFLAG		# QUITFLAG WILL CAUSE INTEGRATION TO EXIT
		ADRES	QUITFLAG	# 	AT NEXT TIMESTEP

		TC	UPFLAG
		ADRES	V96ONFLG
		CAF	ZERO
		TC	POSTJUMP
		CADR	V37		# GO TO POO

		EBANK=	LANDMARK
V52		TC	CHECKMM		# IS P22 OPERATING
		MM	22
		TC	ALM/END		# NO
		TC	E7SETTER
		CS	PRIO7		# YES  SET BITS 12,11,10 OF LANDMARK =
		MASK	LANDMARK	# NO. OF MARKS TO GET OFFSET MARK NO.
		TS	LANDMARK

		CA	8NN		# NO. OF MARKS
		EXTEND
		MP	BIT10
		CA	L
		ADS	LANDMARK
		TC	GOPIN

# VERB 67  ASTRONAUT DISPLAY OF W MATRIX

V67		TC	TESTXACT
		CAF	PRIO5
		TC	FINDVAC
## Page 277
		EBANK=	W
		2CADR	V67CALL

		TC	ENDOFJOB

# VB 45.     RESET SURFACE FLAG.

RESTSRF		TC	DOWNX
		ADRES	SURFFLAG
SETSURF		TC	UPX		# VB 44. SET SURFACE FLAG

## Page 278

# DOWNX, UPX	FLAG SETTING AND RESETTING FOR EXTENDED VERBS.
#
#	RETURN IS TO GOPIN.
#
#	CALLING SEQUENCES:
#
#		FOR DOWNX
#
#			TC	DOWNX
#			ADRES	(FLAG NAME)
#
#		FOR UPX
#
#			ADRES	(FLAG NAME)
#			TC	UPX

		COUNT*	$$/FLAG
DOWNX		CA	Q
		TC	DEBIT
		MASK	L
		TCF	COMXFLG

UPX		CA	Q
		AD	NEG2
		TC	DEBIT
		COM
		EXTEND
		ROR	LCHAN

COMXFLG		INDEX	ITEMP1
		TS	FLAGWRD0
		TCF	GOPIN

## Page 279

# VERB 57 SET FULL TRACK OPTION

		COUNT*	$$/EXTVB
V57CALL		TC	TESTXACT

PARTRACK	CAF	BIT3		# OPTION 4 SPECIFY CONDITION OF FULTKFLG
		TS	OPTIONX

PRTRCK		CAF	FULTKBIT
		MASK	FLGWRD10
		EXTEND
		BZF	+2		# FULTKFLG NOT SET

		CAF	BIT1		# FULTKFLG SET
		TS	OPTIONX +1
		CAF	V04N12
		TC	BANKCALL
		CADR	GOXDSPF
		TC	ENDEXT
		TC	ENDEXT
		CA	OPTIONX +1
		EXTEND
		BZF	+4
		TC	UPFLAG
		ADRES	FULTKFLG
		TCF	PRTRCK

		TC	DOWNFLAG
		ADRES	FULTKFLG
		TCF	PRTRCK

V04N12		VN	0412
