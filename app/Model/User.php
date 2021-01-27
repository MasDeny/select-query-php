<?php
namespace App\Model;
use App\Model\Model;

class User extends Model{

    // public function __construct()
    // {
    //     $this->db = (new Database())->getConnection();
    // }

    // query untuk mendapatkan semua data
    public function findAll()
    {
        $statement = "
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
                join Students ON Users.idUsers = Students.idUsers 
                join TransactionScores ON Students.idStudents = TransactionScores.idStudent;
        ";

        try {
            $this->query($statement);
            $result = $this->fetchAll();
            return $result;
        } catch (\PDOException $e) {
            exit($e->getMessage());
        }
    }
    // query untuk mendapatkan salah satu data
    public function find($id)
    {
        $statement = "
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
                join Students ON Users.idUsers = Students.idUsers 
                join TransactionScores ON Students.idStudents = TransactionScores.idStudent
            WHERE Users.idUsers = :id;
        ";

        try {
            $this->query($statement);
            $this->bind('id', $id);
            $result = $this->fetch();
            return $result;
        } catch (\PDOException $e) {
            exit($e->getMessage());
        }    
    }
}
