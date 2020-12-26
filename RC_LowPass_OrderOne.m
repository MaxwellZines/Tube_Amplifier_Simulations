% Goal: Calculate output of an RC Low-Pass filter given R, C, V, and
% frequency values.
%
% Written by Maxwell Zines
% Written 26/12/2020
% Revision No. 1.0.0
%
%    This code, whe given values for resistance and capacitance in
% an RC Low-Pass filter, will give the output of the filter at the
% specified frequency. It will also calculate the cutoff frequency
% of the filter.
% ----------------------------------------------------------------------

%Data
clear all; clc; 

%User inputs
R = input('Enter a resistor value in ohms: ');
C = input('Enter a capacitor value (f): ');
Freq = input('Enter desired frequency (Hz): ');
VIn = input('Enter input voltage at given frequency (v): ');

%Calculate capacitive reactance (Xc)
AngularFreq = (2 * pi * Freq);
Xc = 1 / (AngularFreq * C);

%Calculate impedance (Z)
Z = (sqrt((R^2)+(Xc^2)));

%Calculate output voltage
VOut = VIn*((Xc)/(Z));

%Calculate Cutoff
Fc = 1/(2*pi*R*C);

disp('----------------');
fprintf('Output voltage: %f volts at %f Hz\n', VOut, Freq);
fprintf('Cutoff frequency: %f Hz\n', Fc);