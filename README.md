# Tube_Amplifier_Simulations
This repository will host utilities, written in a variety of languages, to aid in the development of vacuum tube amplifier circuits. 

- Speakers
  - Speaker_Impedance_TubeAmp
    - Script to determine desired speaker impedance based on information about the output tube and transformer
    - Available in .m (MATLAB) and .asm (MIPS_Assembly). MATLAB version is significantly more comprehensive.
   
- Filters
  - RC_LowPass_OrderOne
    - Script to determine the output voltage of a simple RC low-pass filter at a specific frequency.
    - Also gives information about frequency cutoff of the input circuit.
    
# Important notes:
  - MIPS .asm files were written and compiled in the MARS compiler. They use syscall functions that may be unique to the MARS environment and may not work in other compiler.
