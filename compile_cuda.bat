@echo off
REM Windows CUDA compilation script for combine.cu
REM This script compiles the CUDA kernel into a DLL for Windows

echo Compiling CUDA kernels for Windows...

REM Check if nvcc is available
where nvcc >nul 2>nul
if %errorlevel% neq 0 (
    echo Error: nvcc not found. Please ensure CUDA Toolkit is installed and nvcc is in your PATH.
    exit /b 1
)

REM Create output directory if it doesn't exist
if not exist minitorch\cuda_kernels mkdir minitorch\cuda_kernels

REM Compile CUDA code into DLL with optimizations
nvcc -o minitorch\cuda_kernels\combine.dll --shared src\combine.cu -O3 -use_fast_math -arch=sm_75

if %errorlevel% equ 0 (
    echo Successfully compiled CUDA kernels to minitorch\cuda_kernels\combine.dll
) else (
    echo Error: Failed to compile CUDA kernels
    exit /b 1
)