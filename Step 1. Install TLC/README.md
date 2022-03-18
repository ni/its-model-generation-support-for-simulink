# Inverter Test System Model Generation Support

Use the Inverter Test System Model Generation toolbox to create ITS-compatible models within the MathWorks Simulink® environment.

This toolbox will only generate models for NI Linux Real-Time platforms. Once generated, you will be able to deploy and execute your model on an [Inverter Test System](https://www.ni.com/its).

## Installation Guide for Inverter Test System Model Generation Support

Before you begin, install the supported versions of MathWorks MATLAB®, Simulink®, MATLAB® Coder™ and Simulink® Coder™.

### Install VeriStand Model Generation Support

1. Open the MATLAB Add-On Explorer.
1. Use the search bar to find **Inverter Test System Model Generation Support**
1. Install the add-on.
1. Restart MATLAB.

**Note:** You should uninstall the Veristand Model Framework package before using the Inverter Test System Model Generation Support add-on.

### Install the MATLAB MinGW Compiler for 64-bit Windows targets

1. Open the MATLAB Add-On Explorer.
1. Search for [MATLAB Support for MinGW-w64 C/C++ Compiler](https://www.mathworks.com/matlabcentral/fileexchange/52848-matlab-support-for-mingw-w64-c-c-compiler).
1. Install the compiler.
1. Restart MATLAB.

### Install the NI GCC Cross-Compiler for NI Linux Real-Time targets

1. Download and install [C/C++ Development Tools for NI Linux Real-Time 2017, Eclipse Edition](https://www.ni.com/en-us/support/downloads/software-products/download.c-c---development-tools.html#333407).
1. Restart MATLAB.
