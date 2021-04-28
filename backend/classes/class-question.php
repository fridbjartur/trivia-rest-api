<?php
    class Question{

        // Connection
        private $db;

        // Tables
        private $questions_table = "questions_view",
                $answers_table = "answers";

        // Db connection
        public function __construct($db){
            $this->db = $db;
        }

        // GET ALL QUESTIONS
        public function getQuestions(){
            try {
                $q =  $this->db->prepare("SELECT * FROM $this->questions_table WHERE category = 'Tónleikur'");
                $q->execute();
                return $q;
            } catch (Exception $ex) {
                echo "Database could not be connected: " . $ex->getMessage();
            }
        }

        // GET ANSWERS BY ID
        public function getAnswers($questionId){
            try {
                $q =  $this->db->prepare("SELECT answer_text FROM $this->answers_table WHERE answer_question_fk = :questionId AND answer_is_correct = false");
                $q->bindValue(':questionId', $questionId);
                $q->execute();
                while ($aRow = $q->fetch()) {
                    $aAnswers[] = $aRow['answer_text'];
                }
                return($aAnswers);
            } catch (Exception $ex) {
                echo "Database could not be connected: " . $ex->getMessage();
            }
        }
    }
?>

