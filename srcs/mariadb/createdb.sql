#по сути мы прописываем команды для заполнения запросов при создании сервиса sequel в Dockerfile 
# весь файл подается башевским редиректом влево в поток 
CREATE DATABASE FalconGroupDB;
CREATE USER 'areggie'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON FaclonGroupDB.* TO 'areggie'@'%';
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY '12345';