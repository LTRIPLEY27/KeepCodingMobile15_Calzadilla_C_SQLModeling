# KeepCodingMobile15_Calzadilla_C_SQLModeling

@author   :    Isabel Calzadilla

Práctica  :    Módulo SQL




<div align = "center"><h1>Práctica de Modelado y SQL  <h1></div>



## Introducción

La práctica consistirá en dar solución al enunciado de la práctica (siguiente punto) mediante la creación del modelo Entidad Relación 
normalizado y un fichero con los comandos DDL para la creación del modelo diseñado así como los comandos DML para cargar las tablas.
Es obligatorio que el script sea 100% autónomo, de tal forma que solo haya que abrirlo y pulsar sobre el botón ejecutar Script y este 
todo hecho (tablas, PKs, relaciones, datos). Si se produce un error al ejecutar el script la práctica no será corregida y será automáticamente no apto. 
En el script debéis crear un espacio de trabajo y crear todos los objetos en ese espacio de trabajo (no usar public).


## Enunciado

En KeepCoding queremos gestionar la flota de vehículos de la empresa, controlando los modelos de los coches, las marcas y el grupo empresarial
de la marca (por ejemplo VW SEAT, Audi etc. pertenecen al grupo VAN.

De los coches también necesitamos saber el color del coche, su matrícula, el número total de kilómetros que tiene, la compañía aseguradora ( Mapfre, MMT, AXA etc), 
el número de póliza, fecha de compra etc.

Además queremos controlar de cada coche Las revisiones que se han pasado al coche sabiendo los Kms que tenía en el momento de la revisión, 
la fecha de la revisión y el importe de la revisión.


Habrá que generar una consulta SQL para sacar el siguiente listado de coches activos que
hay en

keepcoding:


- Nombre modelo, marca y grupo de coches (los nombre de todos) Fecha de compra
- Matricula
- Nombre del color del coche
- Total kilómetros
- Nombre empresa que está asegurado el coche Número de póliza
- Nota: Los importes se debe controlar la moneda (EURO, DÓLAR etc.).
