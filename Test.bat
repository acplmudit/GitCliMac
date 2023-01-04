@echo off
SetLocal
    set newver=93.0.1.944
    set newVernum=%newver:.=%


for /f "tokens=2 delims==" %f in ('wmic product where "Name like 'Netskope Client'" 
get Version /value ^| find "="') do set "instVer=%f"

IF NOT DEFINED instVer (
    msiexec /I "C:\NSClient.msi" host=addon-lntcit.eu.goskope.com token= z6lxgTp2kzwo0xyhgYqP mode=peruserconfig /l*v %PUBLIC%\nscinstall.log
) ELSE (
    set instVerNum=%instVer:.=%
    IF newVernum LSS instVerNum  (
        msiexec /I "C:\NSClient.msi" host=addon-lntcit.eu.goskope.com token= z6lxgTp2kzwo0xyhgYqP mode=peruserconfig /l*v %PUBLIC%\nscinstall.log
    )     
)
EndLocal
