<!DOCTYPE HTML>
<html>

<head>
    <title>Главная страница</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="script" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="static/css/styleHeader.css">
    <link rel="stylesheet" href="static/css/main.css">


</head>
<#include "blocks/header_main.ftlh">
<body>
<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
    <div class="container mt-5 pt-4">
        <#include "blocks/search.ftlh">
        <div class="row">
            <#list carts as cart>
                <#if cart.getArchived()>
                    <div class="col-lg-4 col-md-6 col-12 mt-4 pt-2">
                        <div class="card border-0 bg-light rounded shadow">
                            <div class="card-body p-4">
                                <#if cart.getArchived()>
                                    <span class="badge rounded-pill bg-primary_1 float-md-end mb-3 mb-sm-0">Архив</span>
                                <#else>
                                    <span class="badge rounded-pill bg-primary float-md-end mb-3 mb-sm-0">Актуальное</span>
                                </#if>
                                <h5> ${cart.title?truncate(26)?replace("[", "")?replace("]", "")}</h5>
                                <div class="mt-3">
                                <span class="text-muted d-block"><i aria-hidden="true"></i> <a
                                            <#if cart.getUser()?has_content>href="profile/${cart.getUser().getId()}"
                                            <#else>href="#"</#if>
                                            class="text-muted">
                                        <#if cart.getUser()?has_content>
                                            ${cart.getUser().getFirstname()}
                                        <#else>Пользователь не найден
                                        </#if>
                                        </a></span>
                                    <span class="text-muted d-block"><i aria-hidden="true"></i> Дата регистрации:
                                    ${cart.getDate()}
                                </span>
                                    <span class="text-muted d-block"><i aria-hidden="true"></i> Актуальность:
                                    <#if cart.getStartDate()?has_content && cart.getEndDate()?has_content> ${cart.getFormatDate(cart.getStartDate())} - ${cart.getFormatDate(cart.getEndDate())}
                                    <#else>Даты не найдены</#if></span>
                                    <span class="text-muted d-block"><i aria-hidden="true"></i>
                                    <#if cart.getCategory()!=""> ${cart.getCategory()}
                                    <#else>Категория не найдена</#if>
                                    </span>
                                </div>
                                <div class="mt-3">
                                    <a href="prik.pdf" target="_blank" class="btn btn-primary-open">Открыть</a>
                                    <#if user.isAdmin()>
                                        <a href="/editfile/${cart.id}" class="btn btn-primary">Редактировать</a>
                                    </#if>
                                </div>
                            </div>
                        </div>
                    </div>
                </#if>
            </#list>
        </div>
    </div>
</div>
</body>
</html>