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

:: Tworzy folder-bufor
if not exist buffer\ (
	mkdir buffer
	echo Utworzono buffer
	if not exist buffer\grammars\ (
		mkdir buffer\grammars
		echo Utworzono buffer\grammars
	)
) else (
	if not exist buffer\grammars\ (
		mkdir buffer\grammars
		echo Utworzono buffer\grammars
	)
)

:: Kopiuje pojedyncze pliki dirs\files do bufora
for /L %%i in (0,1,%len%-1) do (
	if defined files[%%i] ( 
		if exist !dirs[%%i]!\!files[%%i]! (
			if not exist "buffer\!files[%%i]!" (
				echo Kopiuj !dirs[%%i]!\!files[%%i]!.
				copy !dirs[%%i]!\!files[%%i]! buffer\
				set /a "copied+=1"
			) else (
				echo Plik !files[%%i]! istnieje w obecnym folderze
			)
		)	
	)
)

copy ..\..\grammars\* buffer\grammars\

if %copied%==%len% (
	echo Sukces kopiowania
	
	echo Usuwam stare pliki
	del .\*.u
	del .\grammars\*.grxml
	
	echo Kopiuje nowe pliki
	move buffer\* .
	move buffer\grammars\* .\grammars
)

rmdir /s /q buffer
echo Sukces
pause
endlocal

::if /?
