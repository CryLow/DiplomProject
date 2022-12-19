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
            <h3 class="float-md-start mb-0">Cover</h3>
            <nav class="nav nav-masthead justify-content-center float-md-end">
                <a class="mac dec nav-masthead fw-bold py-1 px-0 active" aria-current="page" href="/main">Главная страница</a>
                <#if user.isAdmin()>
                    <a class="mac col dec nav-masthead fw-bold py-1 px-0" href="/admin">Панель администратора</a>
                </#if>
                <form class="nav-masthead  dec fw-bold py-1 px-0" action="/logout" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <a class="mac col" href="/logout">Выход</a>
                </form>
            </nav>
        </div>
    </header>
    <main class="px-3">
        <h1>Cover your page.</h1>
        <p class="lead">Cover is a one-page template for building simple and beautiful home pages. Download, edit the text, and add your own fullscreen background photo to make it your own.</p>
        <p class="lead">
            <a href="#" class="btn btn-lg btn-secondary fw-bold border-white bg-white">Learn more</a>
        </p>
    </main>

    <footer class="mt-auto text-white-50">
        <p>Cover template for <a href="https://getbootstrap.com/" class="text-white">Bootstrap</a>, by <a href="https://twitter.com/mdo" class="text-white">@mdo</a>.</p>
    </footer>
</div>





</body>
</html>