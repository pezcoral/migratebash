# migratebash
A bash to migrate files from a folder taking part of the file name to create a folder

Teniendo una estructura de archiuvos en carpetas con codigos, 
toma los nombres de los archivos de esa carpeta,
recorre los archivos de la carpeta sacando parte del nombre del archivo
y creando una carpeta con ese nombre.

Ejemplo: 

-----------
  migratebash.bat
  1100123\
          F11001233300420120045501Nombrearchivo1.pdf
          F11001233300420120045501Nombrearchivo2.pdf
          F11001233300420120045501Nombrearchivo3.pdf
          F11001233300420120045501Nombrearchivo4.pdf
          F11001233300420120045501Nombrearchivo5.pdf

 -----------    
 Despues de la ejecución
 
  migratebash.bat
  1100123\
  1100123_AZURE\
                11001233300420120045501\
                                        F11001233300420120045501Nombrearchivo1.pdf
                                        F11001233300420120045501Nombrearchivo2.pdf
                                        F11001233300420120045501Nombrearchivo3.pdf
                                        F11001233300420120045501Nombrearchivo4.pdf
                                        F11001233300420120045501Nombrearchivo5.pdf

 
