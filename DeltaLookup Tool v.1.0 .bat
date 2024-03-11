
:iplook
@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
set g=[92m
set black=[30m
set white=[47m
set r=[91m
set red=[04m
set l=[1m
set w=[0m
set b=[94m
set m=[95m
set p=[35m
set c=[35m
set d=[96m
set q=[37m
set u=[0m
set z=[91m
set n=[96m
set y=[40;33m
set g2=[102m
set r2=[101m
set t=[40m
set bo=[01m
set y1=[33m
set y2=[93m
title DeltaLookup Tool v.1.0 by @zyxcompare
color 07
setlocal ENABLEDELAYEDEXPANSION
set webclient=webclient
if exist "%temp%\%webclient%.vbs" del "%temp%\%webclient%.vbs" /f /q /s >nul
if exist "%temp%\response.txt" del "%temp%\response.txt" /f /q /s >nul
:menu
mode con cols=90 lines=60
cls
:iplookup
cls
echo.
ECHO                                              %y1%,-.
ECHO                                           %y2%_.^|  ^'
ECHO                                         %y1%.^'  ^| ^/
ECHO                                       %y2%,^'    ^|^'
ECHO                                      %y1%^/      ^/
ECHO                        %y2%_..----^"^"---.^'      ^/
ECHO  %y1%_.....---------...,-^"^"                  ,^'
ECHO  %y2%`-._  \                                ^/
ECHO      %y1%`-.+_            __           ,--. .
ECHO           %y2%`-.._     .:  ).        (`--^"^| \
ECHO                %y1%7    ^| `^" ^|         `...^'  \
ECHO                %y2%^|     `--^'     ^'+^"        ,^". ,^"^"-
ECHO                %y1%^|   _...        .____     ^| ^|^/    ^'
ECHO           %y2%_.   ^|  .    `.  ^'--^"   ^/      `.^/     j
ECHO          %y1%\^' `-.^|  ^'     ^|   `.   ^/        ^/     ^/
ECHO          %y2%^'     `-. `---^"      `-^"        ^/     ^/
ECHO           %y1%\       `.                  _,^'     ^/
ECHO            %y2%\        `                        .
ECHO             %y1%\                                j
ECHO              %y2%\                              ^/
ECHO               %y1%`.                           .
ECHO                 %y2%+                          \
ECHO                 %y1%^|                           L
ECHO                 %y2%^|                           ^|
ECHO                 %y1%^|  _ ^/,                     ^|
ECHO                 %y2%^| ^| L)^'..                   ^|
ECHO                 %y1%^| .    ^| `                  ^|
ECHO                 %y2%^'  \^'   L                   ^'
ECHO                  %y1%\  \   ^|                  j    ____       ____                
ECHO                   %y2%`. `__^'                 ^/    / __ \___  / / /_____ _              
ECHO                 %y1%_,.--.---........__      ^/    / / / / _ \/ / __/ __ `/
ECHO                %y2%---.,^'---`         ^|   -j^"    / /_/ /  __/ / /_/ /_/ / 
ECHO                 %y1%.-^'  ^'....__      L    ^|    /_____/\___/_/\__/\__,_/ 
ECHO               %y2%^"^"--..    _,-^'       \ l^|^|   better ip lookup system.
ECHO                   %y1%,-^'  .....------. `^|^|^'  
ECHO                %y2%_,^'                ^/
ECHO              %y1%,^'                  ^/
ECHO             %y2%^'---------+-        ^/
ECHO                      %y1%^/         ^/
ECHO                    %y2%.^'         ^/
ECHO                  %y1%.^'          ^/
ECHO                %y2%,^'           ^/
ECHO              %y1%_^'....----^"^"^"NAC
echo                  discord.gg/1v1lol
echo.
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
echo.
set ip=127.0.0.1
set /p ip=[+] IP: 
echo sUrl = "http://ipinfo.io/%ip%/json" > %temp%\%webclient%.vbs
:localip
cls
echo set oHTTP = CreateObject("MSXML2.ServerXMLHTTP.6.0") >> %temp%\%webclient%.vbs
echo oHTTP.open "GET", sUrl,false >> %temp%\%webclient%.vbs
echo oHTTP.setRequestHeader "Content-Type", "application/x-www-form-urlencoded" >> %temp%\%webclient%.vbs
echo oHTTP.setRequestHeader "Content-Length", Len(sRequest) >> %temp%\%webclient%.vbs
echo oHTTP.send sRequest >> %temp%\%webclient%.vbs
echo HTTPGET = oHTTP.responseText >> %temp%\%webclient%.vbs
echo strDirectory = "%temp%\response.txt" >> %temp%\%webclient%.vbs
echo set objFSO = CreateObject("Scripting.FileSystemObject") >> %temp%\%webclient%.vbs
echo set objFile = objFSO.CreateTextFile(strDirectory) >> %temp%\%webclient%.vbs
echo objFile.Write(HTTPGET) >> %temp%\%webclient%.vbs
echo objFile.Close >> %temp%\%webclient%.vbs
echo Wscript.Quit >> %temp%\%webclient%.vbs
start %temp%\%webclient%.vbs
set /a requests=0
echo.
rem echo Waiting for API response. . .
echo  Looking up IP Address. . .
:checkresponseexists
set /a requests=%requests% + 1
if %requests% gtr 7 goto failed
IF EXIST "%temp%\response.txt" (
goto response_exist
) ELSE (
ping 127.0.0.1 -n 2 -w 1000 >nul
goto checkresponseexists
)
:failed
taskkill /f /im wscript.exe >nul
del "%temp%\%webclient%.vbs" /f /q /s >nul
echo.
echo Did not receive a response from the API.
echo.
pause
goto menu
:response_exist
cls
echo.
echo Information for "%IP%"
for /f "delims= 	" %%i in ('findstr /i "," %temp%\response.txt') do (
	set data=%%i
	set data=!data:,=!
	set data=!data:""=Not Listed!
	set data=!data:"=!
	set data=!data:hostname:=Hostname: !
        set data=!data:country:=Country: !
	set data=!data:region:=State or Provinence: !
	set data=!data:city:=City or Town: !		                        	                        
	set data=!data:org:=Internet Service Provider: !		        		                	                	                        
	set data=!data:postal:=Postal Code: !	                        
	set data=!data:timezone:=Timezone: !	                        
	echo !data!                                                               
)
echo.
del "%temp%\%webclient%.vbs" /f /q /s >nul
del "%temp%\response.txt" /f /q /s >nul
pause
goto menu
if '%ip%'=='' goto menu
goto iplookup
