/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Escriba una consulta que devuelva los cinco valores diferentes más pequeños 
de la tercera columna.

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/


DROP TABLE IF EXISTS datos;
DROP TABLE IF EXISTS min_datos;

CREATE TABLE datos (c1 STRING, c2 STRING, c3 INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';

LOAD DATA LOCAL INPATH 'data.tsv' OVERWRITE INTO TABLE datos;

CREATE TABLE min_datos AS SELECT DISTINCT c3 FROM datos ORDER BY c3 ASC LIMIT 5;

INSERT OVERWRITE LOCAL DIRECTORY './output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM min_datos;
