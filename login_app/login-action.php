<?php
try {
    require_once('db.php');
    $q =  $db->prepare('SELECT * FROM users 
                      WHERE user_email = :user_email LIMIT 1');
    $q->bindValue(':user_email', $_POST['email']);
    $q->execute();
    $row = $q->fetch();
    if (!$row) {
        echo 'wrong email';
        exit();
    }
    if (password_verify($_POST['password'], $row->user_password)) {
        echo 'succes';
        session_start();
        $_SESSION['user_id'] = $row->user_id;
        $_SESSION['user_name'] = $row->user_name;
        $_SESSION['user_last_name'] = $row->user_last_name;
        header('Location: ../index.php');
        exit();
    }
    // header('Location: ../login.php');
    echo 'wrong password';
    exit();
} catch (Exception $ex) {
    echo $ex;
    // header('Location: ../login.php');
    exit();
}