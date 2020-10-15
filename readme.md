# SQL
A simple SQL injection protection module that allows you to use ES6 template strings for escaped statements. Works with [pg](https://www.npmjs.com/package/pg), [mysql](https://www.npmjs.com/package/mysql) and [mysql2](https://www.npmjs.com/package/mysql2) library.

[![npm version][1]][2] [![build status][3]][4] [![js-standard-style][5]][6]



1. [Step](#step)
2. [Query Usage](#usage-query)

## Step

A. Untuk menginstall database lakukan langkah berikut

```txt
1. Masuk directory project 
2. Jalankan 'composer install' untuk menginisialisasi database dari environtment
3. Cek file .env pastikan host, username dan password sesuai dengan database sistem
4. Setelah semua sesuai lakukan import file db.sql ke database

```

B. Untuk mengakses

1. Akses dengan link

Jalankan perintah  'php -S localhost:8080 -t public' menggunakan terminal

```txt
Untuk akses semua user 

http://localhost:8080/user/

Sedangkan untuk mengakses satu user dengan

http://localhost:8080/user/{id}

```
2. Data yang dikirim berupa json dan berasal dari tabel
- Users, 
- Students
- TransactionHistory



## Usage Query

- Query yang digunakan menggunakan query join pada file untuk mengambil semua data adalah : 

```sql
SELECT
    Users.idUsers, 
    Users.Email, 
    Students.name as Nama, 
    Students.class as Kelas,
    Students.bornOfDate as TTL, 
    Users.Role as Status, 
    (TransactionScores.studentScore*100) as Nilai 
FROM 
    Users 
JOIN 
    Students ON Users.idUsers = Students.idUsers 
JOIN 
    TransactionScores ON Students.idStudents = TransactionScores.idStudent;
```
- Query yang digunakan menggunakan query join pada file untuk mengambil semua salah satu data adalah : 

```sql
SELECT
    Users.idUsers, 
    Users.Email, 
    Students.name as Nama, 
    Students.class as Kelas,
    Students.bornOfDate as TTL, 
    Users.Role as Status, 
    (TransactionScores.studentScore*100) as Nilai 
FROM 
    Users 
JOIN 
    Students ON Users.idUsers = Students.idUsers 
JOIN 
    TransactionScores ON Students.idStudents = TransactionScores.idStudent
WHERE 
    Users.idUsers = ?;
```

