
lsb_release -a

https://dev.mysql.com/doc/sakila/en/sakila-installation.html


 mysql -h 0 -u root < /workspace/YugabyteDB-Voyager/sakila-db/sakila-schema.sql
 mysql -h 0 -u root < /workspace/YugabyteDB-Voyager/sakila-db/sakila-data.sql

SOURCE /workspace/YugabyteDB-Voyager/sakila-db/sakila-schema.sql;
SOURCE /workspace/YugabyteDB-Voyager/sakila-db/sakila-data.sql;

show databases;

connection for 
use sakila;

show tables;

select * from actor;


select @@version;

SHOW PROCEDURE STATUS WHERE db = 'sakila'; 
SHOW FUNCTION STATUS WHERE db = 'sakila'; 
SHOW FULL TABLES WHERE Table_Type LIKE 'VIEW';
SHOW TRIGGERS;



--- 


wget https://s3.us-west-2.amazonaws.com/downloads.yugabyte.com/repos/reporpms/yb-apt-repo_1.0.0_all.deb
sudo apt-get install ./yb-apt-repo_1.0.0_all.deb
sudo apt-get clean
sudo apt-get update
sudo apt-get install -y yb-voyager


yb-voyager version

mysql > 
SHOW VARIABLES WHERE variable_name = "hostname";
SHOW VARIABLES WHERE variable_name = "bind_address";


CREATE USER 'ybvoyager'@'127.0.0.1' IDENTIFIED WITH  mysql_native_password BY 'Yugabyte#1';
CREATE USER 'ybvoyager'@'localhost' IDENTIFIED WITH  mysql_native_password BY 'Yugabyte#1';
GRANT PROCESS ON *.* TO 'ybvoyager'@'127.0.0.1';
GRANT PROCESS ON *.* TO 'ybvoyager'@'localhost';
GRANT SELECT ON source_db_name.* TO 'ybvoyager'@'127.0.0.1';
GRANT SELECT ON source_db_name.* TO 'ybvoyager'@'localhost';
GRANT SHOW VIEW ON source_db_name.* TO 'ybvoyager'@'127.0.0.1';
GRANT SHOW VIEW ON source_db_name.* TO 'ybvoyager'@'localhost';
GRANT TRIGGER ON source_db_name.* TO 'ybvoyager'@'127.0.0.1';
GRANT TRIGGER ON source_db_name.* TO 'ybvoyager'@'localhost';



GRANT FLUSH_TABLES ON *.* TO 'ybvoyager'@'127.0.0.1';
GRANT FLUSH_TABLES ON *.* TO 'ybvoyager'@'localhost';
GRANT REPLICATION CLIENT ON *.* TO 'ybvoyager'@'127.0.0.1';
GRANT REPLICATION CLIENT ON *.* TO 'ybvoyager'@'localhost';
--For MySQL >= 8.0.20
GRANT SHOW_ROUTINE  ON *.* TO 'ybvoyager'@'127.0.0.1';
GRANT SHOW_ROUTINE  ON *.* TO 'ybvoyager'@'localhost';



yb-voyager export schema --export-dir $HOME/export-dir \
        --source-db-type "MYSQL" \
        --source-db-host "127.0.0.1" \
        --source-db-port "3306" \
        --source-db-name "sakila" \
        --source-db-user "ybvoyager" \
        --source-db-password "Yugabyte#1" \ 

