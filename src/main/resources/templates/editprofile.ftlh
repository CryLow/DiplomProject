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
                                <h4><#if user.getSecondname()?has_content>${user.getSecondname()}</#if>
                                    <#if user.getFirstname()?has_content>${user.getFirstname()}</#if>
                                    <#if user.getMiddlename()?has_content>${user.getMiddlename()}</#if>
                                </h4>
                                <p class="text-secondary mb-1"><#if user.getPost()?has_content>${user.getPost()}</#if></p>
                                <p class="text-muted font-size-sm">МОУ СШ №17</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-lg-8">
                <div class="card">
                    <form action="/editprofile/${user.getId()}/edit" method="post" >
                    <div class="card-body">
                        <div class="row mb-3">
                            <div class="col-sm-3 d-flex align-items-center">
                                <h6 class="mb-0">Фамилия</h6>
                            </div>
                            <div class="col-sm-9 text-secondary"> <input type="text" class="form-control" name="secondname" value="<#if user.getSecondname()?has_content>${user.getSecondname()}</#if>"></div>
                        </div>
                        <hr>
                        <div class="row mb-3">
                            <div class="col-sm-3 d-flex align-items-center">
                                <h6 class="mb-0">Имя</h6>
                            </div>
                            <div class="col-sm-9 text-secondary"> <input type="text" class="form-control" name="firstname" value="<#if user.getFirstname()?has_content>${user.getFirstname()}</#if>"></div>
                        </div>
                        <hr>
                        <div class="row mb-3">
                            <div class="col-sm-3 d-flex align-items-center">
                                <h6 class="mb-0">Отчество</h6>
                            </div>
                            <div class="col-sm-9 text-secondary"> <input type="text" class="form-control" name="middlename" value="<#if user.getMiddlename()?has_content>${user.getMiddlename()}</#if>"></div>
                        </div>
                        <hr>
                        <div class="row mb-3">
                            <div class="col-sm-3 d-flex align-items-center">
                                <h6 class="mb-0">Электронная почта</h6>
                            </div>
                            <div class="col-sm-9 text-secondary"> <input type="text" class="form-control" name="email" value="<#if user.getEmail()?has_content>${user.getEmail()}</#if>"></div>
                        </div>
                        <hr>
                        <div class="row mb-3">
                            <div class="col-sm-3 d-flex align-items-center">
                                <h6 class="mb-0">Стаж работы</h6>
                            </div>
                            <div class="col-sm-9 text-secondary"> <input type="text" class="form-control" name="experience" value="<#if user.getExperience()?has_content>${user.getExperience()}</#if>"></div>
                        </div>
                        <hr>
                        <div class="row mb-3">
                            <div class="col-sm-3 d-flex align-items-center">
                                <h6 class="mb-0">Должность</h6>
                            </div>
                            <div class="col-sm-9 text-secondary"> <input type="text" class="form-control" name="post" value="<#if user.getPost()?has_content>${user.getPost()}</#if>"></div>
                        </div>
                        <hr>
                        <div class="row">

                            <div class="col-sm-9 text-secondary"><input type="hidden" name="_csrf" value="${_csrf.token}">
                                <button type="submit"class="btn btn-primary px-4">Сохранить изменения</button></div>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</html>