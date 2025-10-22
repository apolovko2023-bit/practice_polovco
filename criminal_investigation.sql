-- =========================================
-- База даних: criminal_investigation
-- Створення таблиць та заповнення
-- =========================================

CREATE DATABASE IF NOT EXISTS criminal_investigation;
USE criminal_investigation;

-- =========================================
-- 1. Location
-- =========================================
DROP TABLE IF EXISTS location;
CREATE TABLE location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    address VARCHAR(255) UNIQUE,
    region VARCHAR(100) DEFAULT 'Unknown'
);

INSERT INTO location (description, city, address, region) VALUES
('Bank robbery scene', 'Kyiv', 'Shevchenko St. 12', 'Kyivska'),
('Murder site', 'Lviv', 'Halytska St. 5', 'Lvivska'),
('Abandoned house', 'Odesa', 'Deribasivska 33', 'Odeska'),
('Forest area', 'Kharkiv', 'Lisova 1', 'Kharkivska'),
('Apartment complex', 'Dnipro', 'Kozatska 4', 'Dnipropetrovska'),
('Car crash site', 'Kyiv', 'Bohdan Khmelnytsky 10', 'Kyivska'),
('Warehouse', 'Lutsk', 'Promyslova 17', 'Volynska'),
('Old bridge', 'Poltava', 'Riverside 22', 'Poltavska'),
('Park area', 'Ternopil', 'Zelena 9', 'Ternopilska'),
('Train station', 'Uzhhorod', 'Vokzalna 1', 'Zakarpatska');

-- =========================================
-- 2. Detective
-- =========================================
DROP TABLE IF EXISTS detective;
CREATE TABLE detective (
    detective_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    detective_rank VARCHAR(50) CHECK (detective_rank IN ('Junior', 'Senior', 'Chief')),
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20) UNIQUE
);

INSERT INTO detective (first_name, last_name, detective_rank, email, phone_number) VALUES
('Ivan', 'Petrenko', 'Chief', 'ivan.petrenko@police.ua', '+380931234567'),
('Olena', 'Shevchenko', 'Senior', 'olena.shevchenko@police.ua', '+380671234567'),
('Maksym', 'Koval', 'Junior', 'maks.koval@police.ua', '+380501234567'),
('Oksana', 'Tkachenko', 'Senior', 'oksana.tkachenko@police.ua', '+380991112233'),
('Serhii', 'Hrytsenko', 'Junior', 'serhii.h@police.ua', '+380931234000'),
('Andrii', 'Bondar', 'Chief', 'andrii.bondar@police.ua', '+380981230000'),
('Kateryna', 'Vovk', 'Senior', 'kateryna.vovk@police.ua', '+380971111111'),
('Yurii', 'Melnyk', 'Junior', 'yurii.m@police.ua', '+380631111222'),
('Halyna', 'Romanenko', 'Senior', 'halyna.r@police.ua', '+380951234567'),
('Taras', 'Lysenko', 'Chief', 'taras.lysenko@police.ua', '+380961111111');

-- =========================================
-- 3. Criminal Case
-- =========================================
DROP TABLE IF EXISTS criminal_case;
CREATE TABLE criminal_case (
    case_id INT AUTO_INCREMENT PRIMARY KEY,
    case_title VARCHAR(255) NOT NULL,
    lead_detective INT NOT NULL,
    status VARCHAR(50) CHECK (status IN ('Open', 'Closed', 'In Progress')),
    date_open DATE NOT NULL,
    date_closed DATE,
    location_id INT NOT NULL,
    FOREIGN KEY (lead_detective) REFERENCES detective(detective_id),
    FOREIGN KEY (location_id) REFERENCES location(location_id)
);

INSERT INTO criminal_case (case_title, lead_detective, status, date_open, date_closed, location_id) VALUES
('Bank Robbery', 1, 'Closed', '2023-01-15', '2023-02-01', 1),
('Murder in Lviv', 2, 'In Progress', '2024-03-10', NULL, 2),
('Smuggling Operation', 3, 'Open', '2024-05-21', NULL, 3),
('Forest Homicide', 4, 'Open', '2023-09-11', NULL, 4),
('Kidnapping Case', 5, 'Closed', '2022-10-20', '2022-11-05', 5),
('Car Accident Investigation', 6, 'Open', '2024-07-01', NULL, 6),
('Warehouse Theft', 7, 'Closed', '2023-12-01', '2023-12-15', 7),
('Bridge Explosion', 8, 'In Progress', '2024-02-25', NULL, 8),
('Park Assault', 9, 'Open', '2024-06-19', NULL, 9),
('Station Pickpocketing', 10, 'Closed', '2023-04-07', '2023-04-15', 10);

-- =========================================
-- 4. Evidence
-- =========================================
DROP TABLE IF EXISTS evidence;
CREATE TABLE evidence (
    evidence_id INT AUTO_INCREMENT PRIMARY KEY,
    case_id INT NOT NULL,
    description VARCHAR(255) NOT NULL,
    location_found VARCHAR(255),
    type VARCHAR(100),
    FOREIGN KEY (case_id) REFERENCES criminal_case(case_id)
);

INSERT INTO evidence (case_id, description, location_found, type) VALUES
(1, 'Fingerprint on safe', 'Bank vault', 'Fingerprint'),
(2, 'Knife with blood', 'Lviv apartment', 'Weapon'),
(3, 'Hidden box of goods', 'Odesa port', 'Container'),
(4, 'Footprint', 'Forest trail', 'Trace'),
(5, 'Phone record', 'Office', 'Digital'),
(6, 'Car tire mark', 'Roadside', 'Trace'),
(7, 'Broken lock', 'Warehouse door', 'Toolmark'),
(8, 'Explosive residue', 'Bridge edge', 'Chemical'),
(9, 'Torn jacket', 'Park bench', 'Cloth'),
(10, 'Wallet found', 'Station platform', 'Personal item');

-- =========================================
-- 5. Witness
-- =========================================
DROP TABLE IF EXISTS witness;
CREATE TABLE witness (
    witness_id INT AUTO_INCREMENT PRIMARY KEY,
    case_id INT NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    address VARCHAR(255),
    phone_number VARCHAR(20),
    birth_date DATE,
    statement_date DATE,
    FOREIGN KEY (case_id) REFERENCES criminal_case(case_id)
);

INSERT INTO witness (case_id, first_name, last_name, address, phone_number, birth_date, statement_date) VALUES
(1,'Olena','Kravets','Shevchenko St. 15','380931112233','1990-02-15','2023-01-16'),
(2,'Ivan','Bondar','Halytska St. 7','380671112233','1985-06-21','2024-03-11'),
(3,'Maksym','Tkachenko','Deribasivska 35','380501112233','1992-08-10','2024-05-22'),
(4,'Oksana','Melnyk','Lisova 3','380991112233','1995-11-30','2023-09-12'),
(5,'Serhii','Koval','Kozatska 10','380931100000','1988-12-01','2022-10-21'),
(6,'Andrii','Vovk','Bohdan Khmelnytsky 12','380981122233','1991-03-05','2024-07-02'),
(7,'Kateryna','Romanenko','Promyslova 19','380971111222','1994-05-15','2023-12-02'),
(8,'Yurii','Lysenko','Riverside 24','380631111333','1987-09-23','2024-02-26'),
(9,'Halyna','Petrenko','Zelena 11','380951112244','1993-01-19','2024-06-20'),
(10,'Taras','Shevchenko','Vokzalna 3','380961123344','1989-07-07','2023-04-08');

-- =========================================
-- 6. Suspect
-- =========================================
DROP TABLE IF EXISTS suspect;
CREATE TABLE suspect (
    suspect_id INT AUTO_INCREMENT PRIMARY KEY,
    case_id INT NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    address VARCHAR(255),
    phone_number VARCHAR(20),
    birth_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (case_id) REFERENCES criminal_case(case_id)
);

INSERT INTO suspect (case_id, first_name, last_name, address, phone_number, birth_date, status) VALUES
(1,'Petro','Ivanov','Shevchenko St. 20','380931111555','1988-05-01','Arrested'),
(2,'Andrii','Kovalenko','Halytska St. 12','380671113344','1990-12-10','Wanted'),
(3,'Maksym','Bondar','Deribasivska 40','380501113355','1992-07-22','Under Investigation'),
(4,'Oleh','Tkachenko','Lisova 5','380991114455','1985-03-11','Arrested'),
(5,'Ivan','Petrenko','Kozatska 12','380931115566','1989-09-30','Released'),
(6,'Serhii','Melnyk','Bohdan Khmelnytsky 14','380981116677','1991-11-15','Wanted'),
(7,'Taras','Vovk','Promyslova 21','380971117788','1987-01-20','Under Investigation'),
(8,'Yurii','Romanenko','Riverside 28','380631118899','1993-08-09','Arrested'),
(9,'Oksana','Kravets','Zelena 14','380951119900','1994-04-25','Released'),
(10,'Kateryna','Shevchenko','Vokzalna 5','380961120011','1990-06-06','Wanted');

-- =========================================
-- 7. Victim
-- =========================================
DROP TABLE IF EXISTS victim;
CREATE TABLE victim (
    victim_id INT AUTO_INCREMENT PRIMARY KEY,
    case_id INT NOT NULL,
    full_name VARCHAR(150),
    age INT,
    status VARCHAR(50),
    FOREIGN KEY (case_id) REFERENCES criminal_case(case_id)
);

INSERT INTO victim (case_id, full_name, age, status) VALUES
(1,'Oleh Ivanov',30,'Deceased'),
(2,'Olena Kovalenko',28,'Deceased'),
(3,'Maksym Petrenko',35,'Injured'),
(4,'Oksana Tkachenko',25,'Deceased'),
(5,'Serhii Bondar',32,'Deceased'),
(6,'Kateryna Melnyk',29,'Injured'),
(7,'Taras Vovk',40,'Deceased'),
(8,'Yurii Romanenko',33,'Injured'),
(9,'Halyna Kravets',27,'Deceased'),
(10,'Ivan Shevchenko',36,'Injured');

-- =========================================
-- 8. Pathologist Report
-- =========================================
DROP TABLE IF EXISTS pathologist_report;
CREATE TABLE pathologist_report (
    autopsy_id INT AUTO_INCREMENT PRIMARY KEY,
    case_of_death VARCHAR(255),
    pathologist_name VARCHAR(150),
    detective_id INT,
    victim_id INT,
    FOREIGN KEY (detective_id) REFERENCES detective(detective_id),
    FOREIGN KEY (victim_id) REFERENCES victim(victim_id)
);

INSERT INTO pathologist_report (case_of_death, pathologist_name, detective_id, victim_id) VALUES
('Gunshot', 'Dr. Kovalenko', 1, 1),
('Stabbing', 'Dr. Shevchenko', 2, 2),
('Car accident', 'Dr. Petrenko', 3, 3),
('Drowning', 'Dr. Melnyk', 4, 4),
('Poisoning', 'Dr. Tkachenko', 5, 5),
('Burns', 'Dr. Vovk', 6, 6),
('Blunt force', 'Dr. Romanenko', 7, 7),
('Fall', 'Dr. Lysenko', 8, 8),
('Strangulation', 'Dr. Kravets', 9, 9),
('Heart attack', 'Dr. Shevchenko', 10, 10);
