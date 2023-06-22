<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="https://www.thymeleaf.org" lang="ru">
<head>
    <title>Главная страница</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="script" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="static/css/styleHeader.css">
    <link rel="stylesheet" href="static/css/about.css">
</head>
<body>
<div>
    <#if isAuthentic==true>
        <#include "blocks/header_main.ftlh">
    <#else>
        <#include "blocks/header_all.ftlh">
    </#if>
</div>
<body>
<section class="section about-section gray-bg" id="about">
    <div class="container">
        <div class="row align-items-center flex-row-reverse">
            <div class="col-lg-6">
                <div class="about-text go-to">
                    <h3 class="dark-color">О нас</h3>
                    <h6 class="theme-color lead">Document and point.</h6>
                    <p>Проект разработан студентом 4-го курса группы 1521691 Крыловым Дмитрием Эдуардовичем. Специально для выпускной квалификационной работы в Тульском Государственном Педагогическом Университете имени Льва Николаевича Толстого.</p>
                    <div class="row about-list">
                        <div class="col-md-6">
                            <div class="media">
                                <label>Birthday</label>
                                <p>20 января 2002</p>
                            </div>
                            <div class="media">
                                <label>Age</label>
                                <p>21 год</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="media">
                                <label>E-mail</label>
                                <p>goldolov16@mail.com</p>
                            </div>
                            <div class="media">
                                <label>Telegram</label>
                                <p>@dmtrkrylov</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="about-avatar">
                    <img src="https://bootdey.com/img/Content/avatar/avatar7.png" title="" alt="">
                </div>
            </div>
        </div>
    </div>
</section>
</body>

</html>