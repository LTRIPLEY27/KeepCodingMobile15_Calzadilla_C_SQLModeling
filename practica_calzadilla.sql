
--			******		COMANDOS DDL  (CREACIÓN MODELO )	******

---  QUERY  :	CREACIÓN DEL WORKSPACE
CREATE SCHEMA practica_sql_calzadilla AUTHORIZATION kzssihac;


---  QUERY  :	CREACIÓN TABLA 'GRUPO'
CREATE TABLE practica_sql_calzadilla.grupo(
	id_grupo VARCHAR (10) NOT NULL,   	-- PK
	nombre VARCHAR (256) NOT NULL,
	descripcion VARCHAR (512) NULL
);

---  QUERY  :	DEFINICIÓN DE PRIMARY KEY, TABLA 'GRUPO'
ALTER TABLE practica_sql_calzadilla.grupo
	ADD CONSTRAINT id_grupo_PK PRIMARY KEY (id_grupo);
	
---  QUERY  :	CREACIÓN TABLA 'MARCA'
CREATE TABLE practica_sql_calzadilla.marca(
	id_marca VARCHAR (10) NOT NULL,   	-- PK
	nombre VARCHAR (256) NOT NULL,
	grupo VARCHAR (10) NOT NULL, 		-- FK
	descripcion VARCHAR (512) NULL
);

---  QUERY  :	DEFINICIÓN DE PRIMARY KEY, TABLA 'MARCA'. FOREIGN KEY, TABLA 'GRUPO'
ALTER TABLE practica_sql_calzadilla.marca
	ADD CONSTRAINT id_marca_PK PRIMARY KEY (id_marca),
	ADD CONSTRAINT grupo_FK FOREIGN KEY (grupo) REFERENCES practica_sql_calzadilla.grupo (id_grupo);


---  QUERY  :	CREACIÓN TABLA 'MODELO'
CREATE TABLE practica_sql_calzadilla.modelo(
	id_modelo VARCHAR (10) NOT NULL,   	-- PK
	nombre VARCHAR (256) NOT NULL,
	serie VARCHAR (30) NOT NULL,
	marca VARCHAR (10) NOT NULL, 	-- FK
	descripcion VARCHAR (512) NULL
);

---  QUERY  :	DEFINICIÓN DE PRIMARY KEY, TABLA 'MARCA'. FOREIGN KEY, TABLA 'GRUPO'
ALTER TABLE practica_sql_calzadilla.modelo
	ADD CONSTRAINT id_modelo_PK PRIMARY KEY (id_modelo),
	ADD CONSTRAINT marca_FK FOREIGN KEY (marca) REFERENCES practica_sql_calzadilla.marca (id_marca);



---  QUERY  :	CREACIÓN TABLA 'POLIZA'
CREATE TABLE practica_sql_calzadilla.poliza(
	id_poliza VARCHAR (10) NOT NULL,   	-- PK
	nombre VARCHAR (256) NOT NULL,
	numero INTEGER NOT NULL,
	cobertura NUMERIC (5,2) NOT NULL,   	-- NÚMERIC PARA HACER USO DE MAYOR PRECISIÓN Y EVITAR RANGOS GIGANTES DE CIFRAS
	descripcion VARCHAR (512) NULL
);

---  QUERY  :	DEFINICIÓN DE PRIMARY KEY, TABLA 'POLIZA'
ALTER TABLE practica_sql_calzadilla.poliza
	ADD CONSTRAINT id_poliza_PK PRIMARY KEY (id_poliza);	
	

---  QUERY  :	CREACIÓN TABLA 'ASEGURADORA'
CREATE TABLE practica_sql_calzadilla.aseguradora(
	id_aseguradora VARCHAR (10) NOT NULL,   	-- PK
	nombre VARCHAR (256) NOT NULL,
	descripcion VARCHAR (512) NULL
);

---  QUERY  :	DEFINICIÓN DE PRIMARY KEY, TABLA 'ASEGURADORA'
ALTER TABLE practica_sql_calzadilla.aseguradora
	ADD CONSTRAINT id_aseguradora_PK PRIMARY KEY (id_aseguradora);
	

---  QUERY  :	CREACIÓN TABLA 'COLOR'
CREATE TABLE practica_sql_calzadilla.color(
	id_color VARCHAR (10) NOT NULL,   	-- PK
	nombre VARCHAR (256) NOT NULL,
	descripcion VARCHAR (512) NULL
);

---  QUERY  :	DEFINICIÓN DE PRIMARY KEY, TABLA 'COLOR'
ALTER TABLE practica_sql_calzadilla.color
	ADD CONSTRAINT id_color_PK PRIMARY KEY (id_color);
	


--	*******			ENTIDAD COCHE		******

---  QUERY  :	CREACIÓN TABLA 'COCHE'
CREATE TABLE practica_sql_calzadilla.coche(
	id_coche VARCHAR (10) NOT NULL,   	-- PK
	matricula VARCHAR (15) NOT NULL,
	kilometros_totales NUMERIC (8,2) NOT NULL DEFAULT 00.0,
	aseguradora VARCHAR (10) NOT NULL, 	-- FK
	poliza VARCHAR (10) NOT NULL,		-- FK
	dt_compra DATE NOT NULL DEFAULT '4000-01-01',
	modelo VARCHAR (10) NOT NULL,		-- FK
	color VARCHAR (10) NOT NULL,		-- FK
	dt_baja DATE NOT NULL DEFAULT '4000-01-01'
);

---  QUERY  :	DEFINICIÓN DE PRIMARY KEY, TABLA 'COCHE'
ALTER TABLE practica_sql_calzadilla.coche
	ADD CONSTRAINT id_coche_PK PRIMARY KEY (id_coche),
	ADD CONSTRAINT aseguradora_FK FOREIGN KEY (aseguradora) REFERENCES practica_sql_calzadilla.aseguradora(id_aseguradora),
	ADD CONSTRAINT poliza_FK FOREIGN KEY (poliza) REFERENCES practica_sql_calzadilla.poliza(id_poliza),
	ADD CONSTRAINT modelo_FK FOREIGN KEY (modelo) REFERENCES practica_sql_calzadilla.modelo(id_modelo),
	ADD CONSTRAINT color_FK FOREIGN KEY (color) REFERENCES practica_sql_calzadilla.color(id_color);
	--ADD CONSTRAINT dt_baja_FK FOREIGN KEY (dt_baja) REFERENCES practica_sql_calzadilla.fecha_baja(id_fecha_baja);
	

---  QUERY  :	CREACIÓN TABLA 'IMPORTE'
CREATE TABLE practica_sql_calzadilla.moneda(
	id_moneda VARCHAR (10) NOT NULL,   	-- PK
	nombre VARCHAR (30) NOT NULL,
	descripcion VARCHAR (512) NULL
);

---  QUERY  :	DEFINICIÓN DE PRIMARY KEY, TABLA 'IMPORTE'
ALTER TABLE practica_sql_calzadilla.moneda
	ADD CONSTRAINT id_moneda_PK PRIMARY KEY (id_moneda);

---  QUERY  :	CREACIÓN TABLA 'REVISIÓN'
CREATE TABLE practica_sql_calzadilla.revision(
	id_revision VARCHAR (10) NOT NULL,   	-- PK
	descripcion VARCHAR (512) NULL,
	importe NUMERIC (8,2) NOT NULL,
	moneda VARCHAR (10) NOT NULL			-- FK
);

---  QUERY  :	DEFINICIÓN DE PRIMARY KEY, TABLA 'REVISIÓN', FOREIGN KEY TABLA 'MONEDA'
ALTER TABLE practica_sql_calzadilla.revision
	ADD CONSTRAINT id_revision_PK PRIMARY KEY (id_revision),
	ADD CONSTRAINT moneda_FK FOREIGN KEY (moneda) REFERENCES practica_sql_calzadilla.moneda(id_moneda);
	

---  QUERY  :	CREACIÓN TABLA 'HISTORICO_REVISIONES'
CREATE TABLE practica_sql_calzadilla.historico_revisiones(
	coche VARCHAR (10) NOT NULL, 					-- PK / FK
	dt_revision DATE NOT NULL DEFAULT '4000-01-01',	-- PK
	revision VARCHAR (10) NOT NULL,					-- Fk
	kilometros NUMERIC (8,2) NOT NULL
);

---  QUERY  :	DEFINICIÓN DE PRIMARY KEY, TABLA 'HISTORICO_REVISIONES'
ALTER TABLE practica_sql_calzadilla.historico_revisiones
	ADD CONSTRAINT id_historico_revision_PK PRIMARY KEY (coche, dt_revision),
	ADD CONSTRAINT coche_FK FOREIGN KEY (coche) REFERENCES practica_sql_calzadilla.coche(id_coche),
	ADD CONSTRAINT revision_FK FOREIGN KEY (revision) REFERENCES practica_sql_calzadilla.revision(id_revision);
	




--			******		COMANDOS DDL  (CREACIÓN MODELO )	******


---  QUERY  :	INSERCIÓN DATOS  TABLA 'GRUPO'
INSERT INTO practica_sql_calzadilla.grupo 
	VALUES ('G001', 'VOLKSWAGEN', 'ALEMANIA'),
		   ('G002', 'TOYOTA', 'JAPÓN'),
		   ('G003', 'PEUGEOT', 'FRANCIA');
		   
	
---  QUERY  :	INSERCIÓN DATOS  TABLA 'MARCA'
INSERT INTO practica_sql_calzadilla.marca  
	VALUES ('MK01', 'VOLKSWAGEN', 'G001', 'Clásico'),
		   ('MK02', 'TOYOTA', 'G002', 'todo terreno'),
		   ('MK03', 'CITROEN','G003', 'deluxe'),
		   ('MK04', 'SKODA', 'G001', 'Economico'),
		   ('MK05', 'LEXUS', 'G002', 'Economico'),
		   ('MK06', 'NISSAN', 'G003', 'Economico');
		  
		
---  QUERY  :	INSERCIÓN DATOS  TABLA 'MODELO'	  
INSERT INTO practica_sql_calzadilla.modelo 
	VALUES ('M01', 'ESCARABAJO', 'estandar', 'MK01', ''),
		   ('M02', 'SAMURAY', 'todo terreno', 'MK02', ''),
		   ('M03', 'C3','familiar','MK03', ''),
		   ('M04', 'Kodiaq', 'DEPORTIVO', 'MK04', ''),
		   ('M05', 'LEXUS RX', 'DELUXE', 'MK05', ''),
		   ('M06', 'Citroen C4', 'DEPORTIVO', 'MK03', ''),
		   ('M07', 'Sentra', 'familiar', 'MK06', ''),
		   ('M08', 'PRIUS', 'Económico', 'MK02', ''),
		   ('M09', 'PICASSO', 'estandar', 'MK03', ''),
		   ('M010', 'IS 300', 'DELUXE', 'MK05', '');
		   
---  QUERY  :	INSERCIÓN DATOS  TABLA 'PÓLIZA'
INSERT INTO practica_sql_calzadilla.poliza 
	VALUES ('P01', 'TOTAL', 101, 100.000, ''),
		   ('P02', 'TERCEROS', 102,50.000, ''),
		   ('P03', 'TERCEROS AMPLIADA', 103, 70.000, ''),
		   ('P04', 'TODO RIESGO FRANQUICIA', 104, 110.000, '');
	

---  QUERY  :	INSERCIÓN DATOS  TABLA 'ASEGURADORA'
INSERT INTO practica_sql_calzadilla.aseguradora 
	VALUES ('A01', 'MAPFRE', ''),
		   ('A02', 'ALLIANZ', ''),
		   ('A03', 'MUTUA MADRILEÑA', ''),
		   ('A04', 'AXA', ''),
		   ('A05', 'GRUPO CATALANA', '');
		   
---  QUERY  :	INSERCIÓN DATOS  TABLA 'COLOR'	
INSERT INTO practica_sql_calzadilla.color	
	VALUES ('C001', 'AZUL', ''),
	       ('C002', 'NEGRO', ''),
	       ('C003', 'ROJO', ''),
	       ('C004', 'AMARILLO', ''),
	       ('C005', 'VERDE', ''),
	       ('C006', 'PLATA', ''),
	       ('C007', 'TORONJA', '');
	       
	

---  QUERY  :	INSERCIÓN DATOS  TABLA 'COCHE'
INSERT INTO practica_sql_calzadilla.coche  (id_coche, matricula, kilometros_totales, aseguradora, poliza, dt_compra, modelo, color)
	VALUES ('C01', 'A123', 113891, 'A01', 'P01', '2020-11-10', 'M01', 'C003'),
		   ('C02', 'B123', 90000, 'A02', 'P02', '2010-06-01', 'M02', 'C001'),
		   ('C03', 'C123', 30111, 'A03', 'P03', '2015-03-06', 'M03', 'C002'),
		   ('C04', 'D123', 11891, 'A04', 'P04', '2022-01-18', 'M04', 'C004'),
		   ('C06', 'F123', 96100, 'A03', 'P03', '2018-03-15', 'M06', 'C006'),
		   ('C07', 'G123', 147800, 'A05', 'P01', '2016-02-28', 'M07', 'C007'),
		   ('C08', 'H123', 77800, 'A01', 'P04', '2022-08-23', 'M08', 'C007'),
		   ('C09', 'I123', 221940, 'A02', 'P03', '2019-12-01', 'M09', 'C003'),
		   ('C10', 'J123', 30800, 'A03', 'P04', '2022-02-28', 'M010', 'C002');

		  
---  QUERY  :	INSERCIÓN DATOS  TABLA 'COCHE' CON EL ATRIBUTO 'BAJA'
INSERT INTO practica_sql_calzadilla.coche 
	VALUES ('C05', 'E123', 300.500, 'A05', 'P02', '2007-09-23', 'M05', 'C005', '2021-11-11');
	

---  QUERY  :	INSERCIÓN DATOS  TABLA 'MONEDA'
INSERT INTO practica_sql_calzadilla.moneda 
	VALUES ('MON01', 'EURO', 'EUROPA'),
		   ('MON02', 'DOLAR', 'NORTE AMÉRICA'),
		   ('MON03', 'PESO', 'SUR AMÉRICA'),
		   ('MON04', 'RUPIAS', 'INDIA'),
		   ('MON05', 'RUBLOS', 'RUSIA');
		   

		  
---  QUERY  :	INSERCIÓN DATOS  TABLA 'REVISIÓN'
INSERT INTO practica_sql_calzadilla.revision  
	VALUES ('R01', 'Cambio aceite', 70, 'MON01'),
		   ('R02', 'filtros', 341,'MON02'),
		   ('R03', 'cableado',  21897, 'MON04'),
		   ('R04', 'bujías',1078, 'MON04'),
		   ('R05', 'choque', 37887.85, 'MON01');
		   
		  
---  QUERY  :	INSERCIÓN DATOS  TABLA 'HISTÓRICO_REVISIONES'
INSERT INTO practica_sql_calzadilla.historico_revisiones  
	VALUES ('C01', '2022-10-11', 'R01', 50000),
		   ('C01', '2021-01-09', 'R04', 25000),
		   ('C10', '2022-11-23', 'R02', 21000),
		   ('C07', '2018-11-11', 'R05', 70000),
		   ('C03', '2020-06-24', 'R03', 10000);