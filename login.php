<?php
session_start();
if (isset($_SESSION['user_id'])) {
    header('Location: index.php');
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<form id="login-form" class="main-padding" action="login_app/login-action.php" method="POST" novalidate>
            <div>
                <input id="loginEmail" name="email" type="email" required />
                <label for="loginEmail">Email</label>
                <div class="input-validation-message"></div>
            </div>
            <div>
                <input id="loginPassword" name="password" type="password" required />
                <label for="loginPassword">Password</label>
                <div class="input-validation-message"></div>
            </div>
            <button class="btn" type="submit">Login</button>
</form>
</body>
</html>