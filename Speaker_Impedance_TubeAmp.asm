# Determine appropriate speaker impedance
# for given valve and output transformer combo
# by method of impedance ratio
#
# Written by Maxwell Zines
# Written 24/12/2020
# Revision No. 1.0.0
#
#	This code is used to determine the appropriate impedance value
# (e.g. 2 ohm, 4 ohm, 8 ohm, 16 ohm... ) for a speaker given information
# about the input and output voltage of the output transformer and 
# the effective load resistance of the tube. 

.data
vInPrompt: .asciiz "\nVoltage across primary stage: "
vOutPrompt: .asciiz "Voltage across secondary stage: "
tubeImpPrompt: .asciiz "Tube load resistance at intended operating voltage: "
Dashes: .asciiz "---------------------------------------------------------------\n"
DataHeader: .asciiz "CALCULATED DATA: \n"
WR: .asciiz "Winding ratio: "
recommendSpk: .asciiz "\nRecommended speaker impedance: "
NLChar: .asciiz "\n"

.text
#################################
UserInputs:
	la $a0, vInPrompt 
	li $v0, 4 
	syscall
	li $v0, 6
	syscall
	mov.s $f1, $f0
	la $a0, vOutPrompt 
	li $v0, 4 
	syscall
	la $v0, 6
	syscall
	mov.s $f2, $f0
	la $a0, tubeImpPrompt 
	li $v0, 4 
	syscall
	la $v0, 6
	syscall
	mov.s $f3, $f0
#################################
PrintHeader:
	la $a0, Dashes
	li $v0, 4
	syscall
	la $a0, DataHeader
	syscall
#################################
CalculateWindingRatio:
	div.s $f4, $f2, $f1
	mov.s $f12, $f4
	li $v0, 4
	la $a0, WR
	syscall
	li $v0, 2
	syscall
CalculateImpedanceRatio:
	mul.s $f4, $f4, $f4
	div.s $f5, $f3, $f4
	mov.s $f12, $f5
	li $v0, 4
	la $a0, recommendSpk
	syscall
	li $v0, 2
	syscall
#################################
Finalise:
	li $v0, 4
	la $a0, NLChar
	syscall
	la $a0, Dashes
	syscall
	li $v0, 10
	syscall
#################################

# List of registers used in this program:
# $f0: sysin
# $f1: Primary voltage
# $f2: Secondary voltage
# $f3: effective load resistance
# $f4: winding ratio, square of winding ratio
# $f5: Impedance 
# $f12: sysout