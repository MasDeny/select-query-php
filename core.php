<?php
require 'vendor/autoload.php';
use App\Configuration\Database;

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

$dbConnection = (new Database())->getConnection();