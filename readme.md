# SQL

1. [Step](#step)
2. [Query Usage](#usage-query)

## Step

A. Untuk menginstall database lakukan langkah berikut

```txt
1. Masuk directory project dan ganti name file .env.example menjadi .env
2. Cek file .env pastikan host, username dan password sesuai dengan database sistem
3. Setelah semua sesuai lakukan import file db.sql ke database

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

