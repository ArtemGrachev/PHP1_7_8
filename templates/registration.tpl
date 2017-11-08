{{ERROR}}
<h1>Регистрация нового пользователя</h1>
<form method="post">
    <p><input type="text" name="login" placeholder="Логин" value="{{SAVE_LOGIN}}"></p>
    <p><input type="text" name="name" placeholder="Имя пользователя" value="{{SAVE_NAME}}"></p>
    <p><input type="password" name="password" placeholder="Пароль" value="{{SAVE_PASS}}"></p>
    <p><input type="password" name="repeatPass" placeholder="Повторите пароль" value="{{SAVE_REPEATPASS}}"></p>
    <p><input type="hidden" name="reg" value="true">
    <input type="submit" value="Отправить"></p>
</form>