<?php
    class Database{
        private $dbUserName = 'root';
        private $dbPassword = '';
        private $dbConnection = 'mysql:host=localhost; dbname=rest_api_project; charset=utf8mb4';
        private $options = [
          PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
          PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        ];

        public $db;

        public function getConnection(){
            $this->db = null;
            try {
                $this->db = new PDO(
                $this->dbConnection,
                $this->dbUserName,
                $this->dbPassword,
                $this->options
              );
            } catch (PDOException $ex) {
                echo "Database could not be connected: " . $ex->getMessage();
            }
            return $this->db;
        }
    }