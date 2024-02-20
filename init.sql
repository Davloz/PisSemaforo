-- Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS semaforo_pis;

-- Seleccionar la base de datos recién creada
USE semaforo_pis;

-- Verificar si el usuario 'desarrollo' ya existe
SELECT user FROM mysql.user WHERE user = 'desarrollo' AND host = '%';

-- Si el usuario 'desarrollo' no existe, entonces créalo
CREATE USER IF NOT EXISTS 'desarrollo'@'%' IDENTIFIED BY 'desarrollo';

-- Asignar todos los privilegios al usuario 'desarrollo'
GRANT ALL PRIVILEGES ON semaforo_pis.* TO 'desarrollo'@'%';

-- Indicar a MySQL que recargue los privilegios
FLUSH PRIVILEGES;
