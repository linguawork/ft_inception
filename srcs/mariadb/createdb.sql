#по сути мы прописываем команды для заполнения запросов при создании сервиса sequel в Dockerfile 
# весь файл подается башевским редиректом влево в поток 
CREATE DATABASE DVSGroupDB;
CREATE USER 'dvs'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON DVSGroupDB.* TO 'dvs'@'%';
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY '12345';