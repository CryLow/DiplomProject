<!DOCTYPE HTML>
<html>

<head>
    <title>Главная страница</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="script" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="css/styleHeader.css">
    <link rel="stylesheet" href="css/main.css">
</head>
<#include "blocks/header_main.ftlh">

<body>
<div class="container mt-5 pt-4">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title text-uppercase mb-0">Управление пользователями</h5>
                </div>
                <div class="table-responsive">
                    <table class="table no-wrap user-table mb-0">
                        <thead>
                        <tr>
                            <th scope="col" class="border-0 text-uppercase font-medium pl-4">#</th>
                            <th scope="col" class="border-0 text-uppercase font-medium">Фамилия Имя</th>
                            <th scope="col" class="border-0 text-uppercase font-medium">Email</th>
                            <th scope="col" class="border-0 text-uppercase font-medium">Активность</th>
                            <th scope="col" class="border-0 text-uppercase font-medium">Роль</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#assign temp = 0>
                        <#list users as user>
                            <#assign temp = temp + 1>
                            <tr>
                                <td class="pl-4">${temp}</td>

                                <td>
                                    <h5 class="font-medium mb-0">
                                        <#if user.getSecondname()?has_content>${user.getSecondname()}</#if>
                                        <#if user.getFirstname()?has_content>${user.getFirstname()}</#if>
                                    </h5>
                                </td>

                                <td>
                                    <span class="text-muted">${user.getEmail()}</span><br>
                                </td>
                                <td>
                                    <span class="text-muted"><#if user.getLastLogin()?has_content>${user.getDateFormat(user.getLastLogin())}<br>${user.getTimeFormat(user.getLastLogin())}</#if></span><br>
                                    <#--<form action="/admin/user/access/${user.id}" method="post">
                                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                                        <input type="submit" value="Изменить доступ">
                                    </form>-->
                                </td>
                                <td>
                                    <select class="form-control category-select" id="exampleFormControlSelect1">
                                        <option <#if user.isAdmin()>selected</#if>>Администратор</option>
                                        <option <#if user.isEmployee()>selected</#if>>Сотрудник</option>
                                        <option <#if user.isGuest()>selected</#if>>Гость</option>
                                    </select>
                                </td>

                            </tr>
                        <#else>
                        </#list>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="row"> <a href="main.php"><button class="btn_1 btn-lg btn-primary_1 color-btn" type="submit">Сохранить изменения</button></a></div>
</div>
</body>
