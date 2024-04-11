DELIMITER //

CREATE PROCEDURE exportar_resultados_csv()
BEGIN
    -- Ejecuta la consulta y exporta los resultados a un archivo CSV
    SELECT *
    INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\datos.csv'
    FIELDS ENCLOSED BY '"'
    TERMINATED BY '|'
    ESCAPED BY '"'
    LINES TERMINATED BY '\n'
    FROM resultados;
END //

DELIMITER ;