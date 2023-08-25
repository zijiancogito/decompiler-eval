@echo off
FOR /F "usebackq delims=" %%c IN (`DIR /B /A-D /S D:\tmp\decompiling\data\DF2\bin\`) DO    (
    @echo %%~fc
    D:/Decompiler/IDA_Pro/idat64.exe -Ohexrays:-err: -c -A {binfile}"
    python decompiler_hexrays.py %%~fc
    TIMEOUT /T 60
)
pause >nul