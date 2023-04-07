<!DOCTYPE HTML>
<html xmlns:th="http://www.thymeleaf.org" xmlns:spring="http://java.sun.com/xml/ns/javaee">
<head>
    <title>Администрирование</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="script" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="/css/styleMain.css">
</head>
<body class="d-flex h-100 text-center text-bg-dark">

<div class=" d-flex h-100 p-3 mx-auto flex-column">
    <header class="mb-auto">
        <div>
            <h3 class="float-md-start mb-0">Документ и.</h3>
            <nav class="nav nav-masthead justify-content-center float-md-end">
                <a class="mac col dec nav-masthead fw-bold py-1 px-0" aria-current="page" href="/main">Главная страница</a>
                <#if user.isAdmin()>
                    <a class="mac dec nav-masthead fw-bold py-1 px-0 active" href="/admin">Панель администратора</a>
                </#if>
                <form class="nav-masthead  dec fw-bold py-1 px-0" action="/logout" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <a class="mac col" href="/login">Выход</a>
                </form>
            </nav>
        </div>
    </header>

    <main class="px-1">
        <h1>Панель администратора</h1>
        <table class="table table-borderless table-dark">
            <tr>
                <th>Имя</th>
                <th>Email</th>
                <th>Активность</th>
                <th>Роли</th>
                <th>Изменение роли</th>
                <th>Доступ</th>
            </tr>
            <#list users as user>
                <tr>
                    <th>${user.firstname}</th>
                    <th>${user.email}</th>
                    <th><#if user.active>Есть доступ<#else>Нет доступа</#if></th>
                    <th><#list user.roles as role>
                            <#if role == 'ROLE_USER'>Пользователь<#else><#if role == 'ROLE_ADMIN'>Администратор</#if></#if>
                        </#list>
                    </th>
                    <th><a href="/admin/user/edit/${user.id}">Изменение роли</a></th>
                    <th>
                        <form action="/admin/user/access/${user.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <input type="submit" value="Изменить доступ">
                        </form>
                    </th>
                </tr>
                <#else>
            </#list>
        </table>
    </main>

    <footer class="mt-auto text-white-50">
        <p>Cover template for <a href="https://tsput.ru/" class="text-white">ТГПУ</a>, by <a href="https://vk.com/dmtrkrylov" class="text-white">@dmtrkrylov</a>.</p>
    </footer>
</div>





</body>
</html>