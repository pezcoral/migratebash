# migratebash
Un archivo bash .bat para migrar archivos desde una carpeta a otra

* .bat bash split string
* .bat bash move files
* .bat bash show folder files 
* .bat bash show order folder files

Teniendo una estructura de archiuvos en carpetas con codigos, 
toma los nombres de los archivos de esa carpeta,
recorre los archivos de la carpeta sacando parte del nombre del archivo
y creando una carpeta con ese nombre.


1. Cerar carpeta wdocs old
2. Sacar archivos que no tienen formato 11_11001 a wdocsold por ejemplo F1100123... o D1100123...
3. Ejecutar paso 1.


Ejemplo: 

-----------
        
        | 
        migratebash.bat

        | 

        wdocs - wdocsold\

        |
        |        F11001233300420120045501Nombrearchivo1.pdf
        |        F11001233300420120045501Nombrearchivo2.pdf
        |        F11001233300420120045501Nombrearchivo3.pdf
        |        F11001233300420120045501Nombrearchivo4.pdf
        |        F11001233300420120045501Nombrearchivo5.pdf
        |        15_11001233300420120045501Nombrearchivo5.pdf
        |        16_11001233300420120045501Nombrearchivo5.pdf
        |        17_11001233300420120045501Nombrearchivo5.pdf
        |        18_11001233300420120045501Nombrearchivo5.pdf
        

 -----------    
 Despues de la ejecución
 
    | 
    migratebash.bat

    |
    1100123_AZURE\
    |
                11001233300420120045501\
                |

                |        F11001233300420120045501Nombrearchivo1.pdf
                |        F11001233300420120045501Nombrearchivo2.pdf
                |        F11001233300420120045501Nombrearchivo3.pdf
                |        F11001233300420120045501Nombrearchivo4.pdf
                |        F11001233300420120045501Nombrearchivo5.pdf
                |        15_11001233300420120045501Nombrearchivo5.pdf
                |        16_11001233300420120045501Nombrearchivo5.pdf
                |        17_11001233300420120045501Nombrearchivo5.pdf
                |        18_11001233300420120045501Nombrearchivo5.pdf

 
