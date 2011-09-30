# NTRG ECC-LIB WINCE -- Makefile
# Patroklos G. Argyroudis <argp@cs.tcd.ie>
#
# Makefile for compilation of ECC-LIB for WinCE.
#
# $Id: Makefile,v 1.2 2004/01/11 10:27:10 argp Exp $

CC = clarm
LD = link
EVC = "C:\Program Files\Microsoft eMbedded Tools\EVC"
WCEROOT = "C:\Windows CE Tools"
PLATFORM = "MS Pocket PC"
TARGETCPU = arm
OSVERSION = WCE300
CEVERSION = 300
CESUBSYS = WINDOWSCE
MACHINE = /machine:$(TARGETCPU)
CEPATH = $(EVC)\$(OSVERSION)\BIN
PATH = $(CEPATH);$(PATH)
INCLUDE = -I$(WCEROOT)/$(OSVERSION)/$(PLATFORM)/include -I"." -I".." \
	    -I"C:\wcegmp\include" -I"include"
CFLAGS = -nologo -D_NTRG_WINCE_ -D__STDC__ -DHAS_STRING_H -D_ARM_ -DARM \
	    -D_arm_ -DPOCKET_SIZE -DPALM_SIZE -D_WINCE \
	    -D_WIN32_WCE=$(CEVERSION) -DUNDER_CE=$(CEVERSION) \
	    -DBUILD_CELIB=1 -DFLOATING_POINT -DSTDC_HEADERS
LFLAGS = -libpath:$(WCEROOT)/$(OSVERSION)/$(PLATFORM)/lib/arm \
	    -libpath:"C:\wcegmp\lib"
LIBS = gmp.lib ecc.lib
ENTRY = -entry:mainACRTStartup
LIBCMD = lib $(MACHINE) /nologo

SRCS = lib\cm.c \
       lib\cm_prime_order.c \
       lib\complex_arithmetic.c \
       lib\create_e_and_pi.c \
       lib\ec_operations.c \
       lib\float_point_arithmetic.c \
       lib\hilbert.c \
       lib\int_arithmetic.c \
       lib\poly_arithmetic.c \
       lib\protocols.c \
       lib\rmd160.c \
       lib\weber.c

OBJS = $(SRCS:.c=.obj)
 
ECC_LIB = ecc.lib

.c.obj:
	$(CC) -c $(CFLAGS) $(INCLUDE) -Fo$@ $<

all:	$(ECC_LIB) ecdsa

$(ECC_LIB): $(OBJS)
	    $(LIBCMD) /OUT:$(ECC_LIB) $(OBJS)

ecdsa.obj:  ecdsa\ecdsa.c
	    $(CC) -c $(CFLAGS) $(INCLUDE) ecdsa\ecdsa.c

ecdsa:	ecdsa.obj
	$(LD) -subsystem:$(CESUBSYS) $(MACHINE) $(ENTRY) $(LFLAGS) \
	    -out:ecdsa.exe ecdsa.obj $(LIBS)

clean:
	del lib\*.obj
	del $(ECC_LIB)
	del ecdsa.obj
	del ecdsa.exe
	del signature
 
# EOF
