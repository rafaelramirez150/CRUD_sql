select * from resultados
into outfile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\datos.csv'
fields enclosed by '"'
terminated by '|'
escaped by '"'
lines terminated by'\n'
 
 -- show variables like 'secure_file_priv';