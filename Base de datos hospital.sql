CREATE DATABASE IF NOT EXISTS salud_hospital2;
USE salud_hospital2;

CREATE TABLE IF NOT EXISTS ciudades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS hospitales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciudad_id INT,
    FOREIGN KEY (ciudad_id) REFERENCES ciudades(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS especialidades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS medicos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    especialidad_id INT,
    hospital_id INT,
    FOREIGN KEY (especialidad_id) REFERENCES especialidades(id) ON DELETE CASCADE,
    FOREIGN KEY (hospital_id) REFERENCES hospitales(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS pacientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE,
    ciudad_id INT,
    FOREIGN KEY (ciudad_id) REFERENCES ciudades(id) ON DELETE CASCADE
);

SHOW CREATE TABLE vacunaciones;

CREATE TABLE IF NOT EXISTS diagnosticos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT,
    medico_id INT,
    fecha_diagnostico DATE,
    descripcion TEXT,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(id) ON DELETE CASCADE,
    FOREIGN KEY (medico_id) REFERENCES medicos(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS vacunas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS vacunaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT,
    vacuna_id INT,
    fecha_vacunacion DATE,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(id) ON DELETE CASCADE,
    FOREIGN KEY (vacuna_id) REFERENCES vacunas(id) ON DELETE CASCADE
);

INSERT INTO ciudades (nombre) VALUES 
('Córdoba'), ('Rosario'), ('Capital Federal');

INSERT INTO hospitales (nombre, ciudad_id) VALUES 
('Hospital Córdoba', 1),
('Hospital Rosario', 2),
('Hospital de Buenos Aires', 3);

INSERT INTO especialidades (nombre) VALUES 
('Cardiología'), ('Pediatría'), ('Neurología'), ('Oncología'), ('Ginecología'),
('Dermatología'), ('Oftalmología'), ('Traumatología'), ('Psiquiatría'), ('Endocrinología');

INSERT INTO medicos (nombre, apellido, especialidad_id, hospital_id) VALUES 
('Martín', 'Gutiérrez', 1, 1),
('Laura', 'Fernández', 2, 1),
('Carlos', 'Rodríguez', 3, 2),
('Valeria', 'López', 4, 2),
('Federico', 'Martínez', 5, 3),
('Lucía', 'Sánchez', 6, 3),
('Emiliano', 'González', 7, 1),
('Sofía', 'Pérez', 8, 2),
('Javier', 'Acosta', 9, 3),
('Camila', 'Romero', 10, 1);

INSERT INTO pacientes (nombre, apellido, fecha_nacimiento, ciudad_id) VALUES 
('Juan', 'Gómez', '1980-05-15', 1),
('María', 'Rodríguez', '1992-09-22', 2),
('Pedro', 'Fernández', '1975-03-10', 1),
('Ana', 'López', '1988-11-30', 1),
('Luis', 'Martínez', '1995-07-18', 2),
('Luciana', 'Pereyra', '1990-04-12', 3),
('Matías', 'Sosa', '1985-08-23', 1),
('Valentina', 'Giménez', '1998-02-14', 2),
('Sebastián', 'Acosta', '1978-11-05', 3),
('Camila', 'Romero', '1993-07-30', 1),
('Nicolás', 'Díaz', '1982-09-17', 2),
('Florencia', 'Vargas', '1996-01-25', 1),
('Ignacio', 'Molina', '1987-06-08', 1),
('Agustina', 'Castro', '1991-03-19', 1),
('Facundo', 'Ríos', '1980-12-03', 3),
('Sofía', 'Suárez', '1994-10-21', 1),
('Emiliano', 'Paz', '1989-05-16', 2),
('Martina', 'Herrera', '1997-08-09', 1),
('Joaquín', 'Mendoza', '1983-02-28', 1),
('Antonella', 'Silva', '1992-11-11', 2),
('Tomás', 'Rojas', '1986-07-04', 3),
('Catalina', 'Ortiz', '1995-04-27', 1),
('Lautaro', 'Peralta', '1981-09-14', 2),
('Micaela', 'Godoy', '1999-01-07', 2),
('Franco', 'Vega', '1984-06-22', 1),
('Julieta', 'Campos', '1993-03-15', 2),
('Benjamín', 'Ramos', '1988-12-08', 3),
('Abril', 'Morales', '1996-10-31', 1),
('Gonzalo', 'Flores', '1979-05-24', 2),
('Candela', 'Aguirre', '1991-08-17', 1),
('Ezequiel', 'Medina', '1985-01-10', 1),
('Rocío', 'Vera', '1998-07-03', 2),
('Maximiliano', 'Arias', '1982-04-26', 3),
('Celeste', 'Cabrera', '1994-11-19', 1),
('Alejandro', 'Benítez', '1987-09-12', 3),
('Bianca', 'Domínguez', '1990-02-05', 3),
('Leandro', 'Navarro', '1983-10-28', 1),
('Martina', 'Quiroga', '1997-05-21', 2),
('Julián', 'Figueroa', '1980-12-14', 2),
('Milagros', 'Córdoba', '1992-07-07', 1),
('Nahuel', 'Villalba', '1986-03-30', 2),
('Brisa', 'Méndez', '1995-08-23', 3),
('Thiago', 'Escobar', '1981-01-16', 1),
('Agustín', 'Cáceres', '1989-06-09', 1),
('Renata', 'Ledesma', '1993-11-02', 2),
('Dante', 'Ojeda', '1984-04-25', 1),
('Delfina', 'Maldonado', '1998-09-18', 2),
('Santino', 'Ponce', '1982-02-11', 1),
('Zoe', 'Cardozo', '1996-07-04', 1),
('Bautista', 'Pacheco', '1988-12-27', 2),
('Morena', 'Ibáñez', '1991-05-20', 3),
('Valentín', 'Arce', '1985-10-13', 1),
('Lola', 'Olivera', '1999-03-06', 2),
('Jerónimo', 'Duarte', '1983-08-29', 3),
('Mía', 'Avalos', '1994-01-22', 1),
('Ciro', 'Mansilla', '1987-06-15', 1),
('Uma', 'Quintana', '1990-11-08', 3),
('Benicio', 'Lucero', '1984-04-01', 1),
('Alma', 'Valdez', '1997-09-24', 2),
('Simón', 'Tapia', '1981-02-17', 3),
('Isabella', 'Vidal', '1993-07-10', 1),
('Ramiro', 'Roldan', '1986-12-03', 1),
('Emilia', 'Kogan', '1995-05-26', 2),
('Luca', 'Chávez', '1989-10-19', 1),
('Maia', 'Coronel', '1992-03-12', 2),
('Bastian', 'Rivero', '1980-08-05', 1);

INSERT INTO vacunas (nombre) VALUES 
('gripe'),
('COVID-19'),
('tétanos'),
('hepatitis B'),
('sarampión'),
('poliomielitis'),
('varicela'),
('VPH'),
('meningitis'),
('fiebre amarilla');


INSERT INTO vacunaciones (paciente_id, vacuna_id, fecha_vacunacion) VALUES 
(1, 1, '2023-01-15'),
(1, 2, '2023-02-20'),
(2, 5, '2023-03-10'),
(3, 4, '2023-04-05'),
(6, 4, '2023-01-05'),
(7, 7, '2023-01-10'),
(8, 5, '2023-01-15'),
(9, 9, '2023-01-20'),
(10, 5, '2023-01-25'),
(11, 1, '2023-02-01'),
(12, 2, '2023-02-05'),
(13, 3, '2023-02-10'),
(14, 4, '2023-02-15'),
(15, 1, '2023-02-20'),
(16, 6, '2023-02-25'),
(17, 5, '2023-03-01'),
(18, 8, '2023-03-05'),
(19, 9, '2023-03-10'),
(20, 3, '2023-03-15'),
(21, 1, '2023-03-20'),
(22, 7, '2023-03-25'),
(23, 3, '2023-04-01'),
(24, 1, '2023-04-05'),
(25, 5, '2023-04-10'),
(26, 6, '2023-04-15'),
(27, 2, '2023-04-20'),
(28, 8, '2023-04-25'),
(29, 9, '2023-05-01'),
(30, 7, '2023-05-05'),
(31, 1, '2023-05-10'),
(32, 1, '2023-05-15'),
(33, 3, '2023-05-20'),
(34, 4, '2023-05-25'),
(35, 7, '2023-06-01'),
(36, 6, '2023-06-05'),
(37, 7, '2023-06-10'),
(38, 4, '2023-06-15'),
(39, 9, '2023-06-20'),
(40, 10, '2023-06-25'),
(41, 6, '2023-07-01'),
(42, 2, '2023-07-05'),
(43, 3, '2023-07-10'),
(44, 4, '2023-07-15'),
(45, 6, '2023-07-20'),
(46, 6, '2023-07-25'),
(47, 4, '2023-08-01'),
(48, 8, '2023-08-05'),
(49, 9, '2023-08-10'),
(50, 10, '2023-08-15'),
(51, 1, '2023-08-20'),
(52, 2, '2023-08-25'),
(53, 3, '2023-09-01'),
(54, 1, '2023-09-05'),
(55, 5, '2023-09-10'),
(56, 6, '2023-09-15'),
(57, 2, '2023-09-20'),
(58, 8, '2023-09-25'),
(59, 9, '2023-10-01'),
(60, 5, '2023-10-05'),
(61, 3, '2023-10-10'),
(62, 1, '2023-10-15'),
(63, 3, '2023-10-20'),
(64, 4, '2023-10-25'),
(65, 5, '2023-11-01'),
(66, 6, '2023-11-05');

INSERT INTO vacunaciones (paciente_id, vacuna_id, fecha_vacunacion) VALUES
(1, 3, '2025-01-10'),
(1, 7, '2025-02-15'),
(1, 8, '2025-01-10'),
(2, 2, '2025-02-15'),
(2, 5, '2025-01-10'),
(3, 4, '2025-02-15'),
(3, 7, '2025-01-10'),
(4, 8, '2025-02-15'),
(5, 10, '2025-01-10'),
(5, 2, '2025-02-15'),
(6, 10, '2025-01-10'),
(6, 8, '2025-02-15'),
(6, 5, '2025-01-10'),
(7, 4, '2025-02-15'),
(8, 7, '2025-01-10'),
(9, 2, '2025-02-15'),
(11, 4, '2025-01-10'),
(11, 5, '2025-02-15'),
(12, 2, '2025-02-15'),
(14, 6, '2025-01-10'),
(14, 5, '2025-02-15'),
(14, 2, '2025-02-15'),
(17, 8, '2025-01-10'),
(17, 5, '2025-02-15'),
(18, 6, '2025-01-10'),
(25, 3, '2025-02-15'),
(26, 6, '2025-02-15'),
(26, 8, '2025-01-10'),
(34, 9, '2025-02-15'),
(34, 2, '2025-02-15'),
(34, 4, '2025-01-10'),
(35, 6, '2025-02-15'),
(36, 7, '2025-02-15'),
(37, 6, '2025-01-10'),
(38, 8, '2025-02-15'),
(38, 3, '2025-01-10'),
(39, 5, '2025-02-15'),
(39, 7, '2025-02-15'),
(39, 4, '2025-01-10'),
(40, 6, '2025-02-15'),
(40, 8, '2025-01-10'),
(40, 5, '2025-02-15'),
(53, 5, '2025-01-10'),
(53, 2, '2025-02-15'),
(55, 6, '2025-02-15'),
(55, 7, '2025-01-10'),
(55, 8, '2025-02-15'),
(57, 2, '2025-02-15'),
(57, 8, '2025-01-10'),
(60, 6, '2025-02-15'),
(60, 3, '2025-02-15'),
(60, 4, '2025-01-10'),
(63, 6, '2025-02-15'),
(63, 8, '2025-02-15'),
(64, 3, '2025-01-10'),
(64, 6, '2025-02-15'),
(66, 5, '2025-02-15'),
(66, 7, '2025-01-10'),
(66, 2, '2025-02-15');

UPDATE vacunaciones SET fecha_vacunacion = '2023-01-15' WHERE paciente_id IN (1, 8, 10);
UPDATE vacunaciones SET fecha_vacunacion = '2023-01-20' WHERE paciente_id IN (9, 21, 11, 13);
UPDATE vacunaciones SET fecha_vacunacion = '2023-02-05' WHERE paciente_id IN (12, 15, 16);
UPDATE vacunaciones SET fecha_vacunacion = '2023-02-15' WHERE paciente_id IN (14, 20);
UPDATE vacunaciones SET fecha_vacunacion = '2023-03-10' WHERE paciente_id IN (2, 19);
UPDATE vacunaciones SET fecha_vacunacion = '2023-03-25' WHERE paciente_id IN (22, 24, 23, 25);
UPDATE vacunaciones SET fecha_vacunacion = '2023-04-05' WHERE paciente_id IN (3, 6, 26, 27);
UPDATE vacunaciones SET fecha_vacunacion = '2023-04-15' WHERE paciente_id IN (28, 29, 7);
UPDATE vacunaciones SET fecha_vacunacion = '2023-05-05' WHERE paciente_id IN (30, 32, 33, 34);
UPDATE vacunaciones SET fecha_vacunacion = '2023-05-10' WHERE paciente_id IN (31, 36, 37);
UPDATE vacunaciones SET fecha_vacunacion = '2023-06-15' WHERE paciente_id IN (38, 39);
UPDATE vacunaciones SET fecha_vacunacion = '2023-06-20' WHERE paciente_id IN (40, 41, 42);
UPDATE vacunaciones SET fecha_vacunacion = '2023-07-10' WHERE paciente_id IN (43, 44, 45, 46);
UPDATE vacunaciones SET fecha_vacunacion = '2023-08-05' WHERE paciente_id IN (47, 48);
UPDATE vacunaciones SET fecha_vacunacion = '2023-08-10' WHERE paciente_id IN (49, 50, 51, 52, 53);
UPDATE vacunaciones SET fecha_vacunacion = '2023-09-05' WHERE paciente_id IN (54, 58);
UPDATE vacunaciones SET fecha_vacunacion = '2023-09-15' WHERE paciente_id IN (56, 57, 35, 55);
UPDATE vacunaciones SET fecha_vacunacion = '2023-10-01' WHERE paciente_id IN (59, 60, 61, 62);
UPDATE vacunaciones SET fecha_vacunacion = '2023-10-15' WHERE paciente_id IN (63, 64);
UPDATE vacunaciones SET fecha_vacunacion = '2023-11-01' WHERE paciente_id IN (65, 66, 1, 2, 3);

UPDATE vacunaciones
SET fecha_vacunacion = DATE_ADD('2025-01-01', INTERVAL FLOOR(RAND() * 59) DAY);


INSERT INTO diagnosticos (paciente_id, medico_id, fecha_diagnostico, descripcion) VALUES 
(1, 1, '2023-06-01', 'Hipertensión arterial'),
(2, 3, '2023-06-05', 'Bronquitis aguda'),
(3, 3, '2023-06-10', 'Migraña crónica'),
(4, 4, '2023-06-15', 'Anemia ferropénica'),
(5, 1, '2023-06-20', 'Síndrome de ovario poliquístico'),
(6, 6, '2023-06-25', 'Lumbalgia'),
(7, 7, '2023-06-30', 'Artritis reumatoide'),
(8, 5, '2023-07-05', 'Asma bronquial'),
(9, 9, '2023-07-10', 'Diabetes tipo 2'),
(10, 2, '2023-07-15', 'Hipotiroidismo'),
(11, 1, '2023-07-20', 'Gastritis crónica'),
(12, 2, '2023-07-25', 'Endometriosis'),
(13, 2, '2023-07-30', 'Fibromialgia'),
(14, 4, '2023-08-04', 'Insuficiencia renal crónica'),
(15, 5, '2023-08-09', 'Depresión moderada'),
(16, 3, '2023-08-14', 'Esquizofrenia'),
(17, 7, '2023-08-19', 'Obesidad'),
(18, 8, '2023-08-24', 'Hipertensión arterial'),
(19, 1, '2023-08-29', 'Colitis ulcerosa'),
(20, 10, '2023-09-03', 'Alergia estacional'),
(21, 5, '2023-09-08', 'Enfermedad pulmonar obstructiva crónica (EPOC)'),
(22, 2, '2023-09-13', 'Síndrome metabólico'),
(23, 3, '2023-09-18', 'Cáncer de mama'),
(24, 5, '2023-09-23', 'Hipoglucemia'),
(25, 5, '2023-09-28', 'Osteoporosis'),
(26, 9, '2023-10-03', 'Hipertensión arterial'),
(27, 3, '2023-10-08', 'Distrofia muscular'),
(28, 8, '2023-10-13', 'Fibrosis quística'),
(29, 9, '2023-10-18', 'Artritis psoriásica'),
(30, 10, '2023-10-23', 'Enfermedad inflamatoria intestinal'),
(31, 8, '2023-10-28', 'Obesidad mórbida'),
(32, 2, '2023-11-02', 'Infección respiratoria'),
(33, 3, '2023-11-07', 'Endometriosis'),
(34, 4, '2023-11-12', 'Síndrome de Cushing'),
(35, 3, '2023-11-17', 'Esclerosis múltiple'),
(36, 6, '2023-11-22', 'Acné quístico'),
(37, 7, '2023-11-27', 'Cefalea tensional'),
(38, 2, '2023-12-02', 'Síndrome del túnel carpiano'),
(39, 2, '2023-12-07', 'Apendicitis'),
(40, 10, '2023-12-12', 'Trastornos alimentarios'),
(41, 1, '2023-12-17', 'Hepatitis C'),
(42, 2, '2023-12-22', 'Deficiencia de hierro'),
(43, 3, '2023-12-27', 'Psoriasis'),
(44, 1, '2024-01-01', 'Varicela'),
(45, 5, '2024-01-06', 'Lupus eritematoso sistémico'),
(46, 6, '2024-01-11', 'Alergia alimentaria'),
(47, 5, '2024-01-16', 'Insuficiencia cardiaca'),
(48, 1, '2024-01-21', 'Bronquitis crónica'),
(49, 9, '2024-01-26', 'Cáncer de próstata'),
(50, 10, '2024-01-31', 'Trastornos del sueño'),
(51, 1, '2024-02-05', 'Rinitis alérgica'),
(52, 2, '2024-02-10', 'Cistitis'),
(53, 3, '2024-02-15', 'Síndrome de fatiga crónica'),
(54, 6, '2024-02-20', 'Cáncer de piel'),
(55, 5, '2024-02-25', 'Hipertensión pulmonar'),
(56, 6, '2024-03-01', 'Meningitis'),
(57, 7, '2024-03-06', 'Escoliosis'),
(58, 8, '2024-03-11', 'Disfunción eréctil'),
(59, 9, '2024-03-16', 'Pólipos nasales'),
(60, 5, '2024-03-21', 'Trastornos de ansiedad'),
(61, 1, '2024-03-26', 'Accidente cerebrovascular (ACV)'),
(62, 2, '2024-03-31', 'Embolia pulmonar'),
(63, 3, '2024-04-05', 'Síndrome de Guillain-Barré'),
(64, 4, '2024-04-10', 'Trombosis venosa profunda'),
(65, 5, '2024-04-15', 'Cirrosis hepática'),
(66, 2, '2024-04-20', 'Hernia discal');


SELECT COUNT(pacientes.id) as cantidad_pacientes, vacunas.nombre
FROM pacientes
JOIN vacunaciones ON pacientes.id = vacunaciones.paciente_id
JOIN vacunas ON vacunaciones.vacuna_id = vacunas.id
GROUP BY vacunaciones.vacuna_id, vacunas.nombre;

Mediantes JOINS, uniendo las tablas de pacientes, vacunaciones y vacunas, conseguí cuantos pacientes tienen cada diagnóstico.

SELECT COUNT(diagnosticos.id) as cantidad_diagnosticos
FROM diagnosticos;

SELECT COUNT(pacientes.id) cantidad_pacientes
FROM pacientes;

SELECT COUNT(vacunaciones.id) cantidad_vacunaciones
FROM vacunaciones;

SELECT COUNT(pacientes.id) AS cantidad_pacientes, ciudades.nombre, hospitales.nombre
FROM pacientes
JOIN ciudades ON pacientes.ciudad_id = ciudades.id
JOIN hospitales ON ciudades.id = hospitales.ciudad_id
GROUP BY ciudades.nombre, hospitales.nombre;

Para obtener la cantidad de pacientes en cada uno de los tres hospitales, uní mediante JOINS a las tablas de pacientes, ciudades y hospitales.

SELECT COUNT(vacunaciones.id) AS cantidad_vacunaciones, fecha_vacunacion
FROM vacunaciones
GROUP BY fecha_vacunacion;

SELECT COUNT(diagnosticos.id) AS cantidad_diagnosticos, especialidades.nombre AS especialidad_nombre
FROM diagnosticos
JOIN medicos ON medicos.id = diagnosticos.medico_id
JOIN especialidades ON especialidades.id = medicos.especialidad_id
GROUP BY especialidades.id, especialidades.nombre, medicos.nombre;

Mediantes JOINS uní las tablas de diagnósticos, médicos y especialidades para así obtener que cantidad de diagnósticos tuvo cada especialidad.

SELECT COUNT(vacunaciones.id) as cantidad_vacunaciones, hospitales.nombre as nombre_hospital
FROM vacunaciones
JOIN pacientes ON pacientes.id = vacunaciones.paciente_id
JOIN ciudades ON ciudades.id = pacientes.ciudad_id
JOIN hospitales ON hospitales.ciudad_id = ciudades.id
GROUP BY hospitales.nombre;

Para obtener la cantidad de vacunas aplicadas por cada hospital, uní mediantes JOINS las tablas de pacientes, ciudades y hospitales.
