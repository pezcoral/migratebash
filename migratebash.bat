@echo off

echo //////////////////////////////////////////////////////////////////////////////////'
echo //////////////////////////////////////////////////////////////////////////////////'
echo /////////////////////MIGRACION DE ARCHIVOS A AZURE //////////////////////////'
echo //////////////////////////////////////////////////////////////////////////////////'
echo //////////////////////////////////////////////////////////////////////////////////'
echo. 
echo.

echo Por favor digite el codigo de corporacion. Ciudad y entidad. Ej: '1100123'
set/p urldirectorio= Codigo: 
echo.
echo.
echo Vamos a empezar a migrar los archivos de la corporacion: %urldirectorio%
echo.
echo.
echo Si es correcto escriba Y.
set/p empezarmigracion= (Y)?: 
if not %empezarmigracion%==Y exit
echo.
echo.
color 4f
echo Empezamos migracion?
echo %~dp0%urldirectorio%
mkdir %~dp0%urldirectorio%_AZURE
echo.
pause>nul

FOR /R %~dp0%urldirectorio% %%G IN (*.*) DO (
	setlocal ENABLEDELAYEDEXPANSION
	SET ALLFILE=%%G
	SET NEWFOLDER=!ALLFILE:~17,23!
	echo !NEWFOLDER!

	echo %~dp0%urldirectorio%_AZURE\!NEWFOLDER!
	mkdir %~dp0%urldirectorio%_AZURE\!NEWFOLDER!
	
	SET ONLYFILE=!ALLFILE:~16,1000!
	echo !ONLYFILE!
		
	SET NEWFF=%~dp0%urldirectorio%_AZURE\!NEWFOLDER!\!ONLYFILE!
	echo !NEWFF!
	
	move !ALLFILE! !NEWFF!

)

echo VALIDA LA CARPETA CREADA
pause
exit
