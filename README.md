# ecc-lib-wince - a WinCE port of ECC-LIB

## Introduction

This is a collection of the files that I modified in order to get ECC-LIB
(version 2.0) to compile for Windows CE.  Since ECC-LIB requires the GNU
Multiple Precision Arithmetic Library (GMP) you also need my WinCE port
of GMP, which can be found at the same place you downloaded this.  Also,
I have only tested it on a Compaq iPAQ H3630 (ARM) running the Windows CE
(3.00) Pocket PC 2002 operating system.  If you manage to compile it and
test it on other Windows CE platforms, let me know.

## Compilation and installation

To compile it just copy the files provided here to the distribution
directory of ECC-LIB 2.0 and overwrite the existing files there, then
simply enter the directory and type nmake.  If something goes wrong you
may have to tweak the Makefile a bit, go ahead it's easy.  There is no
installation required, just put all the files from the include directory
to your include path and ecc.lib to your library path.  When you are using
it in Embedded MSVC++ to compile new programs don't forget to define
_NTRG_WINCE_, include the relevant header files and link against ecc.lib
and gmp.lib.

In the directory bin/ you can find a pre-compiled (ARM) version.

You can find ECC-LIB at:

http://www.ceid.upatras.gr/faculty/zaro/software/ecc-lib/

## Acknowledgements

Elisavet Konstantinou, Yannis Stamatiou and Christos Zaroliagis, for a
great library and for making their work available.
