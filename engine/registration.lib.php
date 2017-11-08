<?php
// Сохранение переменных при ошибке
function regSaveValues(&$vars) {
    if (isset($_POST['reg']) && $_POST['reg'] === 'true') {
        $vars['save_login'] = $_POST['login'];
        $vars['save_name'] = $_POST['name'];
        $vars['save_pass'] = $_POST['password'];
        $vars['save_repeatpass'] = $_POST['repeatPass'];
    }
}
// Приведение строковых данных
function prepareData($data) {
    $db_link = mysqli_connect(HOST, USER, PASS, DB);
    mysqli_query($db_link, "SET NAMES 'utf8'");
    $result = mysqli_real_escape_string($db_link, (string)htmlspecialchars(strip_tags($data)));
    mysqli_close($db_link);
    return $result;
}
// Проверка формы и регистрация нового пользователя
function register(&$vars) {
    $vars['error'] = '';
    if (!isset($_POST['login']) || $_POST['login'] == '') {
        $vars['error'] .= '<p>Логин не задан.</p>';
    } elseif (!preg_match("/^[0-9a-zа-яё]{5,}$/iu", $_POST['login'])) {
        $vars['error'] .= '<p>Логин должен состоять из букв и цифр, не менее 5 символов.</p>';
    }
    if (!isset($_POST['name']) || $_POST['name'] == '') {
        $vars['error'] .= '<p>Имя не задано.</p>';
    } elseif (!preg_match("/^[a-zа-яё]{3,}$/iu", $_POST['name'])) {
        $vars['error'] .= '<p>Имя должно состоять из букв, не менее 3 символов.</p>';
    }
    if (!isset($_POST['login']) || $_POST['login'] == '') {
        $vars['error'] .= '<p>Пароль не задан.</p>';
    } elseif (!preg_match("/^.{6,}$/iu", $_POST['password'])) {
        $vars['error'] .= '<p>Минимальная длина пароля -  6 символов.</p>';
    }
    if ($_POST['password'] !== $_POST['repeatPass']) {
        $vars['error'] .= '<p>Пароль не совпадает с его повтором.</p>';
    }
    if ($vars['error'] === '') {
        $checkLogin = (int)(getRowResult("SELECT id_user
            FROM user
            WHERE user_login = '". $_POST['login'] ."'")['id_user']);
        if ($checkLogin > 0) {
            $vars['error'] .= '<p>Пользователь с таким логином уже существует</p>';
            regSaveValues($vars);
        } else {
            executeQuery("INSERT INTO user
                SET user_login = '". prepareData($_POST['login']) ."',
                user_name = '". prepareData($_POST['name']) ."',
                user_password = '". hashPassword($_POST['password']) ."'");
            authWithCredentials();
            $_SESSION['messReg'] .= '<p>Регистрация прошла успешно!</p>';
            header( "Location: http://" . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'] );
        }
    } else {
        regSaveValues($vars);
    }
}