@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto de13c26d91f443bf92b168582767182e -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot var_example_behav xil_defaultlib.var_example -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
