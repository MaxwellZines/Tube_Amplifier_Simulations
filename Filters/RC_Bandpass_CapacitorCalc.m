% Goal: Determine appropriate capacitor values for an RC band-pass filter
% given the desired upper and lower cutoff frequencies and resistor 
% values.
%
% Written by Maxwell Zines
% Written 26/12/2020
% Revision No. 1.0.0
%
%    This code, when given desired cutoff frequencies and resistor values,
% calculates the capacitors needed in order to achieve the specifiec
% cutoff. The resonant frequency is also given. 
% ----------------------------------------------------------------------

%data
clear all; clc;
Tau = (2 * pi);
Dashes = '---------------';

%Prompt user for inputs:
fprintf('%s\n', Dashes);
disp('High pass filter information:')
HPCutoff = input('High-pass (lower) cutoff frequency (Hz): ');
RHPF = input('Enter high pass filter resistor value (ohms): ');
fprintf('%s\n', Dashes);
disp('Low pass filter information:')
LPCutoff = input('Low-pass (upper) cutoff frequency (Hz): ');
RLPF = input('Enter low pass filter resistor value (ohms): ');
fprintf('%s\n', Dashes);

%High pass filter calculation:
CapHPF = 1 / (Tau * HPCutoff * RHPF);

%Low pass filter calculation:
CapLPF = 1 / (Tau * LPCutoff * RLPF);

%Resonance calculation
Resonance = sqrt(LPCutoff*HPCutoff);

%Display output:
fprintf('Lower frequency (Low-pass cutoff): %i\n', HPCutoff);
fprintf('High-pass filter capacitor value: %e\n', CapHPF);
fprintf('Upper frequency (Low-pass cutoff): %i\n', LPCutoff);
fprintf('Low-pass filter capacitor value: %e\n', CapLPF);
fprintf('Resonance: %i\n', Resonance);
