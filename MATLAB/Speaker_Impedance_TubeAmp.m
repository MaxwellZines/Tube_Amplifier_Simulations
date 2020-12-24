% Determine Appropriate Speaker Impedance
% For Given Valve and Output Transformer Combo
% by Method of Impedance Ratio
%
% Written by Maxwell Zines
% Undergraduate Student of Mathematics 
% University of Tulsa
% Written 24/12/2020
% Revision No. 1.0.0
%
%    This code is used to determine the appropriate impedance value
% (e.g. 2 ohm, 4 ohm, 8 ohm, 16 ohm) for a speaker given information 
% about the input and output voltage of the output transformer and 
% the plate impedance of the power tube. 
% ----------------------------------------------------------------------

%Data/init:
clear;
Ohm = char(hex2dec('03A9'));
vIn_prompt = '\nVoltage across primary stage: ';
vOut_prompt = 'Voltage across secondary stage: '; 
tubeImp_prompt = 'Tube load resistance at intended operating voltage: ';
dashes = '---------------------------------------------------------------';

% USER INPUTS:
vPrimary = input(vIn_prompt);
vSecondary = input(vOut_prompt);
plateImp = input(tubeImp_prompt);

%Print a header to format the data nicely:
fprintf('%s\n', dashes);
fprintf('CALCULATED DATA:\n');

% Calculate Winding ratio:
WR = (vSecondary / vPrimary);
fprintf('Winding ratio: %f\n', WR);

% Calculate appropriate impedance:
IR = (WR^2);
fprintf('Impedance ratio: %f\n', IR);
Spk_imp = (plateImp / (WR^2));
fprintf('Desired speaker impedance: %f\n', Spk_imp);

% Recommend a speaker:
    if 1.95 < Spk_imp && Spk_imp < 2.05
        fprintf('Recommended: 2%s speaker\n', Ohm);
    elseif 3.95 < Spk_imp && Spk_imp < 4.05
        fprintf('Recommended: 4%s speaker\n', Ohm);
    elseif 7.95 < Spk_imp & Spk_imp < 8.05
        fprintf('Recommended: 8%s speaker\n', Ohm);
    elseif 15.95 < Spk_imp & Spk_imp < 16.05
        fprintf('Recommended: 16%s speaker\n', Ohm);
    else
        fprintf('No common close match found\n');
    end

fprintf('%s\n', dashes);
