Microsoft Windows [Version 10.0.26200.9974]
(c) Microsoft Corporation. All rights reserved.

C:\xampp\mysql\bin>mysql -u root
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 3
Server version: 10.11.16-MariaDB MariaDB Server

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> CREATE DATABASE apotek_252011004;
Query OK, 1 row affected (0.007 sec)

MariaDB [(none)]> use apotek_252011004;
Database changed
MariaDB [apotek_252011004]> select database();
+------------------+
| database()       |
+------------------+
| apotek_252011004 |
+------------------+
1 row in set (0.001 sec)

MariaDB [apotek_252011004]> CREATE TABLE supplier (kd_supplier CHAR(4) PRIMARY KEY,nama_supplier VARCHAR(50) NOT NULL,kota VARCHAR(30) DEFAULT 'Malang',telepon VARCHAR(15) UNIQUE);
Query OK, 0 rows affected (0.046 sec)

MariaDB [apotek_252011004]> CREATE TABLE obat (kd_obat CHAR(5) PRIMARY KEY,nama_obat VARCHAR(50) NOT NULL,jenis VARCHAR(20) NOT NULL,harga DECIMAL(10, 2) NOT NULL,stok INT DEFAULT 0,tgl_kadaluarsa DATE,kd_supplier CHAR(4),FOREIGN KEY (kd_supplier) REFERENCES supplier(kd_supplier));
Query OK, 0 rows affected (0.032 sec)

MariaDB [apotek_252011004]> CREATE TABLE keranjang_temp (id_keranjang INT AUTO_INCREMENT PRIMARY KEY,kd_obat CHAR(5),qty INT NOT NULL);
Query OK, 0 rows affected (0.024 sec)

MariaDB [apotek_252011004]> DESCRIBE supplier;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| kd_supplier   | char(4)     | NO   | PRI | NULL    |       |
| nama_supplier | varchar(50) | NO   |     | NULL    |       |
| kota          | varchar(30) | YES  |     | Malang  |       |
| telepon       | varchar(15) | YES  | UNI | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0.018 sec)

MariaDB [apotek_252011004]> DESCRIBE obat;
+----------------+---------------+------+-----+---------+-------+
| Field          | Type          | Null | Key | Default | Extra |
+----------------+---------------+------+-----+---------+-------+
| kd_obat        | char(5)       | NO   | PRI | NULL    |       |
| nama_obat      | varchar(50)   | NO   |     | NULL    |       |
| jenis          | varchar(20)   | NO   |     | NULL    |       |
| harga          | decimal(10,2) | NO   |     | NULL    |       |
| stok           | int(11)       | YES  |     | 0       |       |
| tgl_kadaluarsa | date          | YES  |     | NULL    |       |
| kd_supplier    | char(4)       | YES  | MUL | NULL    |       |
+----------------+---------------+------+-----+---------+-------+
7 rows in set (0.011 sec)

MariaDB [apotek_252011004]> DESCRIBE keranjang_temp;
+--------------+---------+------+-----+---------+----------------+
| Field        | Type    | Null | Key | Default | Extra          |
+--------------+---------+------+-----+---------+----------------+
| id_keranjang | int(11) | NO   | PRI | NULL    | auto_increment |
| kd_obat      | char(5) | YES  |     | NULL    |                |
| qty          | int(11) | NO   |     | NULL    |                |
+--------------+---------+------+-----+---------+----------------+
3 rows in set (0.012 sec)

MariaDB [apotek_252011004]> INSERT INTO supplier (kd_supplier, nama_supplier, kota, telepon) VALUES
    -> ('S001', 'CV Sumber Sehat', 'Malang', '0341551234'),
    -> ('S002', 'PT Medika Jaya', 'Surabaya', '031778899'),
    -> ('S003', 'CV Herbal Nusantara', 'Batu', '0341592211'),
    -> ('S004', 'PT Prima Farma', 'Malang', '0341480055');
Query OK, 4 rows affected (0.022 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [apotek_252011004]> SELECT * FROM supplier;
+-------------+---------------------+----------+------------+
| kd_supplier | nama_supplier       | kota     | telepon    |
+-------------+---------------------+----------+------------+
| S001        | CV Sumber Sehat     | Malang   | 0341551234 |
| S002        | PT Medika Jaya      | Surabaya | 031778899  |
| S003        | CV Herbal Nusantara | Batu     | 0341592211 |
| S004        | PT Prima Farma      | Malang   | 0341480055 |
+-------------+---------------------+----------+------------+
4 rows in set (0.000 sec)

MariaDB [apotek_252011004]> INSERT INTO obat (kd_obat, nama_obat, jenis, harga, stok, tgl_kadaluarsa, kd_supplier) VALUES ('OB001', 'Paracetamol 500mg', 'Tablet', 12000, 120, '2027-08-31', 'S001'),('OB002', 'Amoxicillin 500mg', 'Kapsul', 25000, 60, '2027-03-31', 'S002'),('OB003', 'Obat Batuk Herbal', 'Sirup', 18500, 35, '2026-12-31', 'S003'),('OB004', 'Vitamin C 1000mg', 'Tablet', 45000, 80, '2028-01-31', 'S001'),('OB005', 'Antasida Doen', 'Tablet', 8000, 0, '2026-11-30', 'S004'),('OB006', 'Ibuprofen 400mg', 'Tablet', 15000, 50, '2027-06-30', 'S002'),('OB007', 'Minyak Kayu Putih', 'Cair', 22000, 40, '2028-05-31', 'S003'),('OB008', 'Salep Kulit', 'Salep', 17500, 25, '2027-02-28', 'S004'),('OB009', 'Sirup Anak Demam', 'Sirup', 27000, 15, '2026-12-15', 'S001'),('OB010', 'Kapsul Temulawak', 'Kapsul', 30000, 0, '2027-10-31', 'S003');
Query OK, 10 rows affected (0.011 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [apotek_252011004]> SELECT * FROM obat;
+---------+-------------------+--------+----------+------+----------------+-------------+
| kd_obat | nama_obat         | jenis  | harga    | stok | tgl_kadaluarsa | kd_supplier |
+---------+-------------------+--------+----------+------+----------------+-------------+
| OB001   | Paracetamol 500mg | Tablet | 12000.00 |  120 | 2027-08-31     | S001        |
| OB002   | Amoxicillin 500mg | Kapsul | 25000.00 |   60 | 2027-03-31     | S002        |
| OB003   | Obat Batuk Herbal | Sirup  | 18500.00 |   35 | 2026-12-31     | S003        |
| OB004   | Vitamin C 1000mg  | Tablet | 45000.00 |   80 | 2028-01-31     | S001        |
| OB005   | Antasida Doen     | Tablet |  8000.00 |    0 | 2026-11-30     | S004        |
| OB006   | Ibuprofen 400mg   | Tablet | 15000.00 |   50 | 2027-06-30     | S002        |
| OB007   | Minyak Kayu Putih | Cair   | 22000.00 |   40 | 2028-05-31     | S003        |
| OB008   | Salep Kulit       | Salep  | 17500.00 |   25 | 2027-02-28     | S004        |
| OB009   | Sirup Anak Demam  | Sirup  | 27000.00 |   15 | 2026-12-15     | S001        |
| OB010   | Kapsul Temulawak  | Kapsul | 30000.00 |    0 | 2027-10-31     | S003        |
+---------+-------------------+--------+----------+------+----------------+-------------+
10 rows in set (0.001 sec)

MariaDB [apotek_252011004]> SELECT kd_obat, nama_obat, harga
    -> FROM obat
    -> WHERE jenis = 'Tablet'
    -> ORDER BY harga ASC;
+---------+-------------------+----------+
| kd_obat | nama_obat         | harga    |
+---------+-------------------+----------+
| OB005   | Antasida Doen     |  8000.00 |
| OB001   | Paracetamol 500mg | 12000.00 |
| OB006   | Ibuprofen 400mg   | 15000.00 |
| OB004   | Vitamin C 1000mg  | 45000.00 |
+---------+-------------------+----------+
4 rows in set (0.004 sec)

MariaDB [apotek_252011004]> SELECT * FROM obat WHERE harga BETWEEN 15000 AND 30000;
+---------+-------------------+--------+----------+------+----------------+-------------+
| kd_obat | nama_obat         | jenis  | harga    | stok | tgl_kadaluarsa | kd_supplier |
+---------+-------------------+--------+----------+------+----------------+-------------+
| OB002   | Amoxicillin 500mg | Kapsul | 25000.00 |   60 | 2027-03-31     | S002        |
| OB003   | Obat Batuk Herbal | Sirup  | 18500.00 |   35 | 2026-12-31     | S003        |
| OB006   | Ibuprofen 400mg   | Tablet | 15000.00 |   50 | 2027-06-30     | S002        |
| OB007   | Minyak Kayu Putih | Cair   | 22000.00 |   40 | 2028-05-31     | S003        |
| OB008   | Salep Kulit       | Salep  | 17500.00 |   25 | 2027-02-28     | S004        |
| OB009   | Sirup Anak Demam  | Sirup  | 27000.00 |   15 | 2026-12-15     | S001        |
| OB010   | Kapsul Temulawak  | Kapsul | 30000.00 |    0 | 2027-10-31     | S003        |
+---------+-------------------+--------+----------+------+----------------+-------------+
7 rows in set (0.001 sec)

MariaDB [apotek_252011004]> SELECT * FROM obat WHERE nama_obat LIKE 'S%';
+---------+------------------+-------+----------+------+----------------+-------------+
| kd_obat | nama_obat        | jenis | harga    | stok | tgl_kadaluarsa | kd_supplier |
+---------+------------------+-------+----------+------+----------------+-------------+
| OB008   | Salep Kulit      | Salep | 17500.00 |   25 | 2027-02-28     | S004        |
| OB009   | Sirup Anak Demam | Sirup | 27000.00 |   15 | 2026-12-15     | S001        |
+---------+------------------+-------+----------+------+----------------+-------------+
2 rows in set (0.008 sec)

MariaDB [apotek_252011004]> SELECT * FROM obat WHERE tgl_kadaluarsa < '2027-01-01';
+---------+-------------------+--------+----------+------+----------------+-------------+
| kd_obat | nama_obat         | jenis  | harga    | stok | tgl_kadaluarsa | kd_supplier |
+---------+-------------------+--------+----------+------+----------------+-------------+
| OB003   | Obat Batuk Herbal | Sirup  | 18500.00 |   35 | 2026-12-31     | S003        |
| OB005   | Antasida Doen     | Tablet |  8000.00 |    0 | 2026-11-30     | S004        |
| OB009   | Sirup Anak Demam  | Sirup  | 27000.00 |   15 | 2026-12-15     | S001        |
+---------+-------------------+--------+----------+------+----------------+-------------+
3 rows in set (0.001 sec)

MariaDB [apotek_252011004]> SELECT * FROM obat ORDER BY harga DESC LIMIT 3;
+---------+------------------+--------+----------+------+----------------+-------------+
| kd_obat | nama_obat        | jenis  | harga    | stok | tgl_kadaluarsa | kd_supplier |
+---------+------------------+--------+----------+------+----------------+-------------+
| OB004   | Vitamin C 1000mg | Tablet | 45000.00 |   80 | 2028-01-31     | S001        |
| OB010   | Kapsul Temulawak | Kapsul | 30000.00 |    0 | 2027-10-31     | S003        |
| OB009   | Sirup Anak Demam | Sirup  | 27000.00 |   15 | 2026-12-15     | S001        |
+---------+------------------+--------+----------+------+----------------+-------------+
3 rows in set (0.001 sec)

MariaDB [apotek_252011004]> ALTER TABLE supplier ADD COLUMN email VARCHAR(50) AFTER telepon;
Query OK, 0 rows affected (0.051 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [apotek_252011004]> ALTER TABLE obat MODIFY COLUMN nama_obat VARCHAR(100) NOT NULL;
Query OK, 10 rows affected (0.078 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [apotek_252011004]> ALTER TABLE obat CHANGE COLUMN tgl_kadaluarsa tgl_expired DATE;
Query OK, 0 rows affected (0.044 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [apotek_252011004]> ALTER TABLE obat ADD COLUMN lokasi_rak CHAR(3);
Query OK, 0 rows affected (0.041 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [apotek_252011004]> DESCRIBE supplier;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| kd_supplier   | char(4)     | NO   | PRI | NULL    |       |
| nama_supplier | varchar(50) | NO   |     | NULL    |       |
| kota          | varchar(30) | YES  |     | Malang  |       |
| telepon       | varchar(15) | YES  | UNI | NULL    |       |
| email         | varchar(50) | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
5 rows in set (0.007 sec)

MariaDB [apotek_252011004]> DESCRIBE obat;
+-------------+---------------+------+-----+---------+-------+
| Field       | Type          | Null | Key | Default | Extra |
+-------------+---------------+------+-----+---------+-------+
| kd_obat     | char(5)       | NO   | PRI | NULL    |       |
| nama_obat   | varchar(100)  | NO   |     | NULL    |       |
| jenis       | varchar(20)   | NO   |     | NULL    |       |
| harga       | decimal(10,2) | NO   |     | NULL    |       |
| stok        | int(11)       | YES  |     | 0       |       |
| tgl_expired | date          | YES  |     | NULL    |       |
| kd_supplier | char(4)       | YES  | MUL | NULL    |       |
| lokasi_rak  | char(3)       | YES  |     | NULL    |       |
+-------------+---------------+------+-----+---------+-------+
8 rows in set (0.012 sec)

MariaDB [apotek_252011004]> UPDATE obat SET harga = harga * 1.10WHERE jenis = 'Sirup';
Query OK, 2 rows affected (0.018 sec)
Rows matched: 2  Changed: 2  Warnings: 0

MariaDB [apotek_252011004]> SELECT kd_obat, nama_obat, jenis, harga FROM obat WHERE jenis = 'Sirup';
+---------+-------------------+-------+----------+
| kd_obat | nama_obat         | jenis | harga    |
+---------+-------------------+-------+----------+
| OB003   | Obat Batuk Herbal | Sirup | 20350.00 |
| OB009   | Sirup Anak Demam  | Sirup | 29700.00 |
+---------+-------------------+-------+----------+
2 rows in set (0.001 sec)

MariaDB [apotek_252011004]> UPDATE obat SET stok = 100, harga = 8500 WHERE kd_obat = 'OB005';
Query OK, 1 row affected (0.010 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [apotek_252011004]> UPDATE obat SET lokasi_rak = 'A01' WHERE jenis = 'Tablet';
Query OK, 4 rows affected (0.004 sec)
Rows matched: 4  Changed: 4  Warnings: 0

MariaDB [apotek_252011004]> SELECT * FROM obat;
+---------+-------------------+--------+----------+------+-------------+-------------+------------+
| kd_obat | nama_obat         | jenis  | harga    | stok | tgl_expired | kd_supplier | lokasi_rak |
+---------+-------------------+--------+----------+------+-------------+-------------+------------+
| OB001   | Paracetamol 500mg | Tablet | 12000.00 |  120 | 2027-08-31  | S001        | A01        |
| OB002   | Amoxicillin 500mg | Kapsul | 25000.00 |   60 | 2027-03-31  | S002        | NULL       |
| OB003   | Obat Batuk Herbal | Sirup  | 20350.00 |   35 | 2026-12-31  | S003        | NULL       |
| OB004   | Vitamin C 1000mg  | Tablet | 45000.00 |   80 | 2028-01-31  | S001        | A01        |
| OB005   | Antasida Doen     | Tablet |  8500.00 |  100 | 2026-11-30  | S004        | A01        |
| OB006   | Ibuprofen 400mg   | Tablet | 15000.00 |   50 | 2027-06-30  | S002        | A01        |
| OB007   | Minyak Kayu Putih | Cair   | 22000.00 |   40 | 2028-05-31  | S003        | NULL       |
| OB008   | Salep Kulit       | Salep  | 17500.00 |   25 | 2027-02-28  | S004        | NULL       |
| OB009   | Sirup Anak Demam  | Sirup  | 29700.00 |   15 | 2026-12-15  | S001        | NULL       |
| OB010   | Kapsul Temulawak  | Kapsul | 30000.00 |    0 | 2027-10-31  | S003        | NULL       |
+---------+-------------------+--------+----------+------+-------------+-------------+------------+
10 rows in set (0.001 sec)

MariaDB [apotek_252011004]> SELECT * FROM obat WHERE stok = 0;
+---------+------------------+--------+----------+------+-------------+-------------+------------+
| kd_obat | nama_obat        | jenis  | harga    | stok | tgl_expired | kd_supplier | lokasi_rak |
+---------+------------------+--------+----------+------+-------------+-------------+------------+
| OB010   | Kapsul Temulawak | Kapsul | 30000.00 |    0 | 2027-10-31  | S003        | NULL       |
+---------+------------------+--------+----------+------+-------------+-------------+------------+
1 row in set (0.001 sec)

MariaDB [apotek_252011004]> DELETE FROM obat WHERE stok = 0;
Query OK, 1 row affected (0.010 sec)

MariaDB [apotek_252011004]> DELETE FROM supplier WHERE kd_supplier = 'S004';
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`apotek_252011004`.`obat`, CONSTRAINT `obat_ibfk_1` FOREIGN KEY (`kd_supplier`) REFERENCES `supplier` (`kd_supplier`))
MariaDB [apotek_252011004]> ALTER TABLE obat DROP COLUMN lokasi_rak;
Query OK, 0 rows affected (0.044 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [apotek_252011004]> DROP TABLE keranjang_temp;
Query OK, 0 rows affected (0.023 sec)

MariaDB [apotek_252011004]> SHOW TABLES;
+----------------------------+
| Tables_in_apotek_252011004 |
+----------------------------+
| obat                       |
| supplier                   |
+----------------------------+
2 rows in set (0.010 sec)

MariaDB [apotek_252011004]>