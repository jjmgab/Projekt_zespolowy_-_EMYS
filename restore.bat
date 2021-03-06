@echo off
setlocal enableDelayedExpansion

title script
set len=0
set copied=0

set files[0]=_CONFIG_.u
set files[1]=DialogueData.u
set files[2]=EmysBehaviours.u
set files[3]=EmysDialogs.u
set files[4]=Simple_EMYS_with_Kinect.u

set dirs[0]=..\..
set dirs[1]=..
set dirs[2]=..
set dirs[3]=..
set dirs[4]=..

:SymLoop
if defined files[%len%] ( 
   call echo %%files[%len%]%% 
   set /a "len+=1"
   GOTO :SymLoop 
)
echo Liczba pojedynczych plikow do skopiowania: %len%
pause

:: Usuwa pojedyncze pliki dirs\files
for /L %%i in (0,1,%len%-1) do (
	if defined files[%%i] ( 
		if exist !dirs[%%i]!\!files[%%i]! (
			del /q !dirs[%%i]!\!files[%%i]!
		) else (
			echo Plik !files[%%i]! nie istnieje
		)
	)
)
:: Usuwa pliki gramatyk
del /q ..\..\grammars\*

:: Kopiuje pojedyncze pliki dirs\files do bufora
for /L %%i in (0,1,%len%-1) do (
	if defined files[%%i] ( 
		if exist .\!files[%%i]! (
			if not exist "!dirs[%%i]!\!files[%%i]!" (
				echo Kopiuj !files[%%i]! do !dirs[%%i]!
				copy .\!files[%%i]! !dirs[%%i]!\
				set /a "copied+=1"
			) else (
				echo Plik !files[%%i]! istnieje w folderze !dirs[%%i]!
			)
		)	
	)
)
:: Kopiuje pliki gramatyk
copy .\grammars\* ..\..\grammars\

if %copied%==%len% (
	echo Sukces kopiowania
)

echo Sukces
pause
endlocal

::if /?
