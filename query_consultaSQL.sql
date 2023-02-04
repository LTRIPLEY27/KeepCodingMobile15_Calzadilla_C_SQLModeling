
/*

	Generar una consulta SQL para sacar el siguiente listado de coches activos que
	hay en keepcoding:
	
	- Nombre modelo, marca y grupo de coches (los nombre de todos) Fecha de compra
	- Matricula
	- Nombre del color del coche
	- Total kilómetros
	- Nombre empresa que está asegurado el coche Número de póliza

*/

-- QUERY  : 	CONSULTA TABLAS
SELECT b.nombre AS "Nombre Coche", c.nombre AS "Marca", d.nombre AS "Grupo" , a.dt_compra AS "Fecha compra", a.matricula AS "Matrícula", e.nombre  AS "Color", a.kilometros_totales AS "Total KM", f.nombre  AS "Aseguradora", g.numero  AS "Número Póliza"
	FROM practica_sql_calzadilla.coche a 
		JOIN practica_sql_calzadilla.modelo b ON a.modelo  = b.id_modelo
		JOIN practica_sql_calzadilla.marca  c ON c.id_marca = b.marca 
		JOIN practica_sql_calzadilla.grupo d ON c.grupo = d.id_grupo 
		JOIN practica_sql_calzadilla.color e ON a.color = e.id_color 
		JOIN practica_sql_calzadilla.aseguradora f ON a.aseguradora  = f.id_aseguradora 
		JOIN practica_sql_calzadilla.poliza g ON a.poliza = g.id_poliza 
		WHERE date_part('year', a.dt_baja) = 4000; 