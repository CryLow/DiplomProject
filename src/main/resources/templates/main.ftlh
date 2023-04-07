<!DOCTYPE HTML>
<html xmlns:th="http://www.thymeleaf.org" xmlns:spring="http://java.sun.com/xml/ns/javaee">
<head>
    <title>Главная страница</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="script" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="/css/styleMain.css">
</head>
<body class="d-flex h-100 text-center text-bg-dark">
<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
    <header class="mb-auto">
        <div>
            <h3 class="float-md-start mb-0">Документ и.</h3>
            <nav class="nav nav-masthead justify-content-center float-md-end">
                <a class="mac dec nav-masthead fw-bold py-1 px-0 active" aria-current="page" href="/main">Главная страница</a>
                <#if user.isAdmin()>
                    <a class="mac col dec nav-masthead fw-bold py-1 px-0" href="/admin">Панель администратора</a>
                </#if>
                <form class="nav-masthead  dec fw-bold py-1 px-0" action="/logout" method="POST">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <a class="mac col" href="/login">Выход</a>
                </form>
            </nav>
        </div>
    </header>
    <main class="px-3">
        <hr size="8" color="#whiteble">
        <h1>Документы</h1>
        <#list carts as cart>
            <div>
                <div>Название: <b>
                        ${cart.title}
                    </b></div>
                <div>Дата регистрации: <b>
                        ${cart.dateOfCreated.getDayOfMonth()}
                        ${cart.dateOfCreated.getMonth()}
                    </b></div>
                <div>Время регистрации: <b>
                        ${cart.dateOfCreated.hour}:${cart.dateOfCreated.minute}
                    </b></div>
                <div>
                    <a href="#">Скачать документ</a>
                </div>
            </div>
        </#list>

        <hr size="8" color="#whiteble">
        <h2>Создать новую карточку документа</h2>
        <form action="/cart/create" method="post" enctype="multipart/form-data">
            Название документа: <label>
                <input type="text" name="title"/>
            </label><br><br>
            Документ: <input type="file" name="file"/><br><br>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Добавить карточку">
        </form>
        <br>
    </main>

    <footer class="mt-auto text-white-50">
        <p>Cover template for <a href="https://tsput.ru/" class="text-white">ТГПУ</a>, by <a href="https://vk.com/dmtrkrylov" class="text-white">@dmtrkrylov</a>.</p>
    </footer>
</div>





</body>
</html>