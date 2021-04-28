<?php
$error_header = 'error';

if (!$_POST) {
    echo $error_header;
};
if (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
    echo $error_header;
    exit();
};
if (!isset($_POST['firstName'])) {
    echo $error_header;
    exit();
}
if (strlen($_POST['firstName']) < 2) {
    echo $error_header;
    exit();
}
if (strlen($_POST['firstName']) > 20) {
    echo $error_header;
    exit();
}
if (!isset($_POST['lastName'])) {
    echo $error_header;
    exit();
}
if (strlen($_POST['lastName']) < 2) {
    echo $error_header;
    exit();
}
if (strlen($_POST['lastName']) > 20) {
    echo $error_header;
    exit();
}
if (!isset($_POST['password'])) {
    echo $error_header;
    exit();
}
if (!isset($_POST['confirmPassword'])) {
    echo $error_header;
    exit();
}
if (strcmp($_POST['password'], $_POST['confirmPassword']) !== 0) {
    echo $error_header;
    exit();
}

try {
    require_once('db.php');
    $q = $db->prepare('INSERT INTO users VALUES(
        :user_id, :user_first_name, :user_last_name, :user_username, :user_email, :user_password, :user_verification_code, :user_verified, 
        :user_active, :user_is_staff, :user_last_login, :user_created)');
    $q->bindValue(':user_id', null);
    $q->bindValue(':user_first_name', $_POST['firstName']);
    $q->bindValue(':user_last_name', $_POST['lastName']);
    $q->bindValue(':user_username', null);
    $q->bindValue(':user_email', $_POST['email']);
    $q->bindValue(':user_password', password_hash($_POST['password'], PASSWORD_DEFAULT));
    $q->bindValue(':user_verification_code', uniqid(true));
    $q->bindValue(':user_verified', 0);
    $q->bindValue(':user_active', 0);
    $q->bindValue(':user_is_staff', 0);
    $q->bindValue(':user_last_login', date("Y-m-d H:i:s"));
    $q->bindValue(':user_created', date("Y-m-d H:i:s"));
    $q->execute();
    exit();
} catch (PDOException $ex) {
    echo $ex;
    exit();
}