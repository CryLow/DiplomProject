<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/html">

<head>
    <title>Главная страница</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="script" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="../static/css/styleHeader.css">
    <link rel="stylesheet" href="../static/css/main.css">
    <link rel="stylesheet" href="../static/css/file.css">
</head>
<#include "blocks/header_main.ftlh">
<body>
<div class="container">
    <div class="main-body">
        <div class="row gutters-sm">
            <div class="">
                <div class="card">
                    <div class="card-body">
                        <form action="/editfile/${cart.getId()}/edit" method="post" enctype="multipart/form-data">
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Название документа</h6>
                                </div>
                                <div class="col-sm-9 text-secondary"><input type="text" name="title" class="form-control"
                                                                            value="${cart.title}"></div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Категория документа</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <div class="">
                                        <select class="form-control" name="category" id="exampleFormControlSelect1">
                                            <option disabled selected>Категория не выбрана</option>
                                            <option <#if cart.getCategory()=="Федеральные документы"> selected <#else></#if>>Федеральные документы</option>
                                            <option <#if cart.getCategory()=="Дополнительно-образовательные документы"> selected</#if>>Дополнительно-образовательные документы</option>
                                            <option <#if cart.getCategory()=="Организационные документы"> selected</#if>>Организационные документы</option>
                                            <option <#if cart.getCategory()=="Нормативные документы"> selected</#if>>Нормативные документы</option>
                                            </select></div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Документ</h6>
                                </div>
                                <div class="col-sm-9 text-secondary"><input type="file" name="file" class="form-control"></div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Дата начала эксплуатации и конца</h6>
                                </div>
                                <div class="col-sm-9 text-secondary flex-date">
                                    <input type="date" name="startDate" value="<#if cart.getStartDate()?has_content>${cart.getFormatDateForValue(cart.getStartDate())}</#if>"
                                           id="date-input" class="form-control-date">
                                    <input type="date" name="endDate" value="<#if cart.getEndDate()?has_content>${cart.getFormatDateForValue(cart.getEndDate())}</#if>"
                                           id="date-input" class="form-control-date">
                                </div>
                            </div>
                            <div class="row">
                                <div class="">
                                    <#if !cart.getArchived()>
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                   <button type="submit" name="editButton" class="btn btn-primary px-4">Сохранить изменения</button>
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <button type="submit" name="archButton" class="btn btn-primary px-10">Перенести в архив</button></#if>
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <button type="submit" name="removeButton" class="btn btn-primary px-10">Удалить</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>