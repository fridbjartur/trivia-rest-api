<?php
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");
    
    require_once(__DIR__ . '/../config/database.php');
    require_once(__DIR__ . '/../classes/class-question.php');

    $database = new Database();
    $db = $database->getConnection();


    $items = new Question($db);
    $q = $items->getQuestions();

    if($q){
        
        $aQuestions = array();
        $aQuestions["results"] = array();

        while ($aRow = $q->fetch()){
            extract($aRow);
            
            $e = array(
                "id" => $id,
                "author" => $author,
                "category" => $category,
                "type" => $type,
                "difficulty" => $difficulty,
                "question" => $question,
                "correct_answer" => $correct_answer,
                "incorrect_answers" => $items->getAnswers($id),
                "created" => $created
            );

            array_push($aQuestions["results"], $e);
        }
        echo json_encode($aQuestions);
    }

    else{
        http_response_code(404);
        echo json_encode(
            array("message" => "No record found.")
        );
    }
?>