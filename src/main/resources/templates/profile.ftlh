<!DOCTYPE HTML>
<html>

<head>
    <title>Главная страница</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="script" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="../static/css/styleHeader.css">
    <link rel="stylesheet" href="../static/css/profile.css">
</head>
<#include "blocks/header_main.ftlh">
<body>
<div class="container">
    <div class="main-body">

        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="main-breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item"><a href="javascript:void(0)">User</a></li>
                <li class="breadcrumb-item active" aria-current="page">User Profile</li>
            </ol>
        </nav>
        <!-- /Breadcrumb -->

        <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-column align-items-center text-center">
                            <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin" class="rounded-circle" width="150">
                            <div class="mt-3">
                                <h4><#if userProfile.getSecondname()?has_content>${userProfile.getSecondname()}</#if>
                                    <#if userProfile.getFirstname()?has_content>${userProfile.getFirstname()}</#if>
                                    <#if userProfile.getMiddlename()?has_content>${userProfile.getMiddlename()}</#if> </h4>
                                <p class="text-secondary mb-1">
                                    <#if userProfile.getPost()?has_content> ${userProfile.getPost()}<#else>Не указанно</#if></p>
                                <p class="text-muted font-size-sm">МОУ СШ №17</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-md-8">
                <div class="card mb-3">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-3 d-flex align-items-center">
                                <h6 class="mb-0">Фамилия</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <#if userProfile.getSecondname()?has_content>${userProfile.getSecondname()}</#if>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3 d-flex align-items-center">
                                <h6 class="mb-0">Имя</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <#if userProfile.getFirstname()?has_content>${userProfile.getFirstname()}</#if>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3 d-flex align-items-center">
                                <h6 class="mb-0">Отчество</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <#if userProfile.getMiddlename()?has_content>${userProfile.getMiddlename()}</#if>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3 d-flex align-items-center">
                                <h6 class="mb-0">Email</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                ${userProfile.getEmail()}
                            </div>
                        </div>
                        <hr>


                        <div class="row">
                            <div class="col-sm-3 d-flex align-items-center">
                                <h6 class="mb-0">Стаж работы</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <#if userProfile.getExperience()?has_content> ${userProfile.getExperience()} года<#else>Стаж не указан</#if>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-12">
                                <#if user==userProfile>
                                <a class="btn btn-info " href="/editprofile/${user.getId()}">Редактировать</a>
                                </#if>
                                    <a class="btn btn-info " href="/carts/${userProfile.getId()}">Связанные карточки</a>
                                </div>
                        </div>
                    </div>
                </div>



            </div>
        </div>

    </div>
</div>
</body>
</html>