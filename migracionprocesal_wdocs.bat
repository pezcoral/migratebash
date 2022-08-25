@echo off

echo //////////////////////////////////////////////////////////////////////////////////'
echo //////////////////////////////////////////////////////////////////////////////////'
echo /////////////////////MIGRACION DE ARCHIVOS A AZURE SAMAI//////////////////////////'
echo //////////////////////////////////////////////////////////////////////////////////'
echo //////////////////////////////////////////////////////////////////////////////////'
echo ////////////////////////////////PRIMERA PARTE/////////////////////////////////////'
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
pause 
echo SACAR LOS ARCHIVOS QUE TIENEN FORMATO DISTINTO TIPO F11001145 o D110012155 A CARPETA WDOCSOLD
echo Ya movio los documentos F. Si es correcto escriba Y.
set/p empezarmigracion= (Y)?: 
if not %empezarmigracion%==Y exit
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
	
	::Enviar el texto del archivo movido al sqlupdate
	echo !NEWFOLDER!/!NAMEFILE!>> toSqlUpdate.txt
	
	::Mover el archivo a la carpeta creada
	move %%G !NEWFF!	
	
	cls
)
color 2f
echo VALIDA LA CARPETA CREADA
pause
exit
