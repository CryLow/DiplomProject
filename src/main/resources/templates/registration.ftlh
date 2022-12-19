<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="https://www.thymeleaf.org">
<head>
    <title>Регистрация</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="script" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" th:href="@{/css/styleSignIn.css}">
</head>
<body  class="text-center">
<div th:if="${param.error}">
    Invalid username and password.
</div>
<main class="form-signin w-100 m-auto">
    <form th:action="@{/registration}" method="post">
        <h1 class="h3 mb-3 fw-normal">Регистрация</h1>
        <div class="form-floating">
            <input type="text" class="form-control" id="floatingInput" name="firstname" placeholder="name@example.com">
            <label for="floatingInput">Имя пользователя</label>
        </div>
        <div class="form-floating">
            <input type="email" class="form-control" id="floatingEmail" name="email" placeholder="name@example.com">
            <label for="floatingEmail">Введите почту</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password">
            <label for="floatingPassword">Пароль</label>
        </div>
        <input type="hidden" name="_csrf" value="${_csrg.token}">
        <button class="w-100 btn btn-lg btn-primary" type="submit">Зарегестрироваться</button>
        <a th:href="@{/login}">Вход в учетную запись</a>
        <p class="mt-2 mb-2 text-muted">©2022</p>
    </form>
</main>
</body>
</html>