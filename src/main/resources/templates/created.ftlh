<!DOCTYPE HTML>
<html>

<head>
    <title>Главная страница</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="script" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="static/css/styleHeader.css">
    <link rel="stylesheet" href="static/css/file.css">
</head>
<#include "blocks/header_main.ftlh">

<body>
<div class="container">
    <div class="main-body">
        <div class="row gutters-sm">
            <div class="">
                <div class="card">
                    <div class="card-body">
                        <form action="/cart/create" method="post" enctype="multipart/form-data">
                        <div class="row mb-3">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Название документа</h6>
                            </div>
                            <div class="col-sm-9 text-secondary"> <input type="text" name="title" class="form-control"></div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Категория документа</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <div class="">
                                    <select class="form-control" name="category" id="exampleFormControlSelect1">
                                        <option></option>
                                        <option>Федеральные документы</option>
                                        <option>Дополнительно-образовательные документы</option>
                                        <option>Организационные документы</option>
                                        <option>Нормативные документы</option>

                                    </select></div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Документ</h6>
                            </div>
                            <div class="col-sm-9 text-secondary"> <input type="file" name="file" class="form-control"></div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Дата начала эксплуатации и конца</h6>
                            </div>
                            <div class="col-sm-9 text-secondary flex-date">
                                <input type="date" name="startDate" class="form-control-date">
                                <input type="date" name="endDate" class="form-control-date">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-9 text-secondary">
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <button  type="submit " class="btn btn-primary px-4">Сохранить документ</button>
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