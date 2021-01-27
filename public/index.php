<?php
require "../core.php";
use App\Controller\UserController;

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Max-Age: 3600");

$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$uri = explode('/', $uri);

// all of our endpoints start with /person
// everything else results in a 404 Not Found
switch ($uri[1]) {
    case 'user':
        $userId = null;
        if (isset($uri[2])) {
            $userId = (int) $uri[2];
        }

        $requestMethod = $_SERVER["REQUEST_METHOD"];

        // pass the request method and user ID to the PersonController and process the HTTP request:
        $controller = new UserController($requestMethod, $userId);
        $controller->processRequest();
        break;

    default:
        header("HTTP/1.1 404 Not Found");
        exit();
        break;
}
