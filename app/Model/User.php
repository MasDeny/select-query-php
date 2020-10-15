<?php
namespace App\Model;

class User {

    private $db = null;

    public function __construct($db)
    {
        $this->db = $db;
    }

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
            $statement = $this->db->prepare($statement);
            $statement->execute();
            $result = $statement->fetchAll(\PDO::FETCH_ASSOC);
            return $result;
        } catch (\PDOException $e) {
            exit($e->getMessage());
        }
    }

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
            WHERE Users.idUsers = ?;
        ";

        try {
            $statement = $this->db->prepare($statement);
            $statement->execute(array($id));
            $result = $statement->fetchAll(\PDO::FETCH_ASSOC);
            return $result;
        } catch (\PDOException $e) {
            exit($e->getMessage());
        }    
    }
}
