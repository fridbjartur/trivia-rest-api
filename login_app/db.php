<?php

try {
  $dbUserName = 'root';
  $dbPassword = '';
  $dbConnection = 'mysql:host=localhost; dbname=rest_api_project; charset=utf8mb4';
  $options = [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ
  ];
  $db = new PDO(
    $dbConnection,
    $dbUserName,
    $dbPassword,
    $options
  );
} catch (PDOException $ex) {
  echo $ex;
  echo 'error';
  exit();
}