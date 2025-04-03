@echo off
setlocal

set "area_de_trabalho=%USERPROFILE%\Desktop"
set "downloads=%USERPROFILE%\Downloads"

echo Movendo arquivos e pastas da área de trabalho para a lixeira...
for /d %%i in ("%area_de_trabalho%\*") do (
    echo Movendo pasta: %%i
    powershell.exe -command "Add-Type -AssemblyName 'Microsoft.VisualBasic' ; [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteDirectory('%%i', 'OnlyErrorDialogs', 'SendToRecycleBin')"
)
for %%i in ("%area_de_trabalho%\*") do (
    echo Movendo arquivo: %%i
    powershell.exe -command "Add-Type -AssemblyName 'Microsoft.VisualBasic' ; [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile('%%i', 'OnlyErrorDialogs', 'SendToRecycleBin')"
)

echo Movendo arquivos e pastas da pasta de downloads para a lixeira...
for /d %%i in ("%downloads%\*") do (
    echo Movendo pasta: %%i
    powershell.exe -command "Add-Type -AssemblyName 'Microsoft.VisualBasic' ; [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteDirectory('%%i', 'OnlyErrorDialogs', 'SendToRecycleBin')"
)
for %%i in ("%downloads%\*") do (
    echo Movendo arquivo: %%i
    powershell.exe -command "Add-Type -AssemblyName 'Microsoft.VisualBasic' ; [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile('%%i', 'OnlyErrorDialogs', 'SendToRecycleBin')"
)

echo Operação concluída.

endlocal
