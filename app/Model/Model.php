<?php
namespace App\Model;

use App\Configuration\Database;
use PDO;

class Model
{
    protected $db, $stmt;

    public function __construct()
    {
        $this->db = (new Database())->getConnection();
    }

    public function query($query)
    {
        $this->stmt = $this->db->prepare($query);
    }

    public function bind($param, $value, $type = null)
    {
        if (is_null($type)) {
            switch (true) {
                case is_int($value):
                    $type = PDO::PARAM_INT;
                    break;
                case is_bool($value):
                    $type = PDO::PARAM_BOOL;
                    break;
                case is_null($value):
                    $type = PDO::PARAM_NULL;
                    break;
                default:
                    $type = PDO::PARAM_STR;
                    break;
            }
        }

        $this->stmt->bindValue($param, $value, $type);
    }

    public function execute()
    {
        $this->stmt->execute();
        return true;
    }

    public function fetch()
    {
        $this->execute();
        return $this->stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function fetchAll()
    {
        $this->execute();
        return $this->stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // protected static function lastInsertedId(){
    //     return Self::$db->lastInsertId();
    // }
}
