@echo off

echo //////////////////////////////////////////////////////////////////////////////////'
echo //////////////////////////////////////////////////////////////////////////////////'
echo /////////////////////MIGRACION DE ARCHIVOS A AZURE POR CARACTER//////////////////////////'
echo //////////////////////////////////////////////////////////////////////////////////'
echo //////////////////////////////////////////////////////////////////////////////////'
echo. 
echo.

echo Por favor digite el codigo de corporacion. Ciudad y entidad. Ej: '1100123'
set/p urldirectorio= Codigo: 
echo.
echo.
color 4f
echo IMPORTANTE!
echo VALIDE QUE ESTE EJECUTANDO EL ARCHIVO DENTRO DE LA CARPETA DE LA CORPORACION 
echo UBICAR AL MISMO NIVEL DE wdocp y wdocs. 
echo REVISAR ADEMAS QUE DENTRO DE WDOCS LOS ARCHIVOS TENGAN ESTE FORMATO 1_110012334... 24_1100112334...
echo 
echo.
echo.
set urlinicial=%~dp0wdocs\
echo %urlinicial%
mkdir %~dp0%urldirectorio%_AZURE
echo Empezamos migracion?
echo.
echo.
echo.
echo.
pause>nul

FOR /R %~dp0wdocs\ %%G IN (*.*) DO (

	setlocal ENABLEDELAYEDEXPANSION
	::Obtener segunda parte tokens=2 con delimitador _ y poner en variable a
	for /f "tokens=2 delims=_" %%a in ("%%G") do (
		set AFTER_UNDERSCORE=%%a
	)

	::Mostrar el valor despues del _
	echo !AFTER_UNDERSCORE!
	
	::Obtener solo 23 digitos
	SET NEWFOLDER=!AFTER_UNDERSCORE:~0,23!
	::Mostrar el numero de radicado del proceso
	echo !NEWFOLDER!
	
	echo %~dp0%urldirectorio%_AZURE\!NEWFOLDER!
	mkdir %~dp0%urldirectorio%_AZURE\!NEWFOLDER!
	
	::Obtener segunda parte de los archivos tokens=5 con delimitador \ y poner en variable a
	::E:\RAMA\0000000\wdocs\15_1100154521  
	::1 \  2 \   3   \  4  \  5
	setlocal ENABLEDELAYEDEXPANSION
	for /f "tokens=5 delims=\" %%b in ("%%G") do (
		set NAMEFILE=%%b
	)
	
	::Mostrar nombrearchivo
	echo !NAMEFILE!
	
	::Crear la nueva ruta del archivo
	SET NEWFF=%~dp0%urldirectorio%_AZURE\!NEWFOLDER!\!NAMEFILE!
	echo !NEWFF!
	
	::Mover el archivo a la carpeta creada
	move %%G !NEWFF!	
	
	pause	
)
color 2f
echo VALIDA LA CARPETA CREADA
pause
exit
