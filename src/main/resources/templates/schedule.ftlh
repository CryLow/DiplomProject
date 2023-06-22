<!DOCTYPE HTML>
<html>

<head>
    <title>Главная страница</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="script" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="static/css/styleHeaderAll.css">
    <link rel="stylesheet" href="static/css/schedule.css">
    <link rel="stylesheet" href="static/css/styleHeader.css">
</head>
<#if isAuthentic==true>
    <#include "blocks/header_main.ftlh">
    <#else>
        <#include "blocks/header_all.ftlh">
</#if>

<body>

</body>
<div class="container mt-5 pt-4">
    <div class="timetable-img text-center">
        <img src="img/content/timetable.png" alt="">
    </div>
    <div class="table-responsive">
        <table class="table table-bordered text-center light-color">
            <thead>
            <tr class="bg-light-gray">
                <th class="text-uppercase">Время</th>
                <th class="text-uppercase">Понедельник</th>
                <th class="text-uppercase">Вторник</th>
                <th class="text-uppercase">Среда</th>
                <th class="text-uppercase">Четверг</th>
                <th class="text-uppercase">Пятница</th>
                <th class="text-uppercase">Суббота</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td class="align-middle">08:30-9:15</td>
                <td class="bg-light-gray">

                </td>
                <td>
                    <span class="bg-purple padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">Кванториум</span>
                    <div class="margin-10px-top font-size14">1 группа</div>
                    <div class="font-size13 text-light-gray">Никита Михайлович</div>
                </td>
                <td class="bg-light-gray">

                </td>
                <td class="bg-light-gray">

                </td>
                <td class="bg-light-gray">

                </td>
                <td>
                    <span class="bg-pink padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">IT-Куб</span>
                    <div class="margin-10px-top font-size14">2 группа</div>
                    <div class="font-size13 text-light-gray">Евгения Сергеевна</div>
                </td>
            </tr>

            <tr>
                <td class="align-middle">09:25-10:10</td>
                <td class="bg-light-gray">

                </td>
                <td class="bg-light-gray">

                </td>
                <td class="bg-light-gray">

                </td>
                <td class="bg-light-gray">

                </td>
                <td class="bg-light-gray">

                </td>
                <td>
                    <span class="bg-yellow padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">Точка роста</span>
                    <div class="margin-10px-top font-size14">1 группа</div>
                    <div class="font-size13 text-light-gray">Фанис Рашидович</div>
                </td>
            </tr>

            <tr>
                <td class="align-middle">10:30-11:15</td>
                <td class="bg-light-gray">

                </td>
                <td class="bg-light-gray">

                </td>
                <td class="bg-light-gray">

                </td>
                <td class="bg-light-gray">

                </td>
                <td class="bg-light-gray">

                </td>
                <td class="bg-light-gray">

                </td>
            </tr>

            <tr>
                <td class="align-middle">11:35-12:20</td>
                <td class="bg-light-gray">

                </td>
                <td class="bg-light-gray">

                </td>
                <td class="bg-light-gray">

                </td>
                <td class="bg-light-gray">

                </td>
                <td class="bg-light-gray">

                </td>
                <td class="bg-light-gray">

                </td>
            </tr>

            <tr>
                <td class="align-middle">12:35-13:20</td>
                <td class="bg-light-gray">

                </td>
                <td class="bg-light-gray">

                </td>
                <td>
                    <span class="bg-purple padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">Кванториум</span>
                    <div class="margin-10px-top font-size14">2 группа</div>
                    <div class="font-size13 text-light-gray">Никита Михайлович</div>
                </td>
                <td class="bg-light-gray">

                </td>
                <td class="bg-light-gray">

                </td>
                <td class="bg-light-gray">

                </td>
            </tr>
            <tr>
                <td class="align-middle">13:30-14:15</td>
                <td class="bg-light-gray">

                </td>
                <td class="bg-light-gray">

                </td>
                <td class="bg-light-gray">

                </td>
                <td>
                    <span class="bg-pink padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">IT-Куб</span>
                    <div class="margin-10px-top font-size14">3 группа</div>
                    <div class="font-size13 text-light-gray">Евгения Сергеевна</div>
                </td>
                <td class="bg-light-gray">

                </td>
                <td class="bg-light-gray">

                </td>
            </tr>
            <tr>
                <td class="align-middle">14:25-15:10</td>
                <td>
                    <span class="bg-pink padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">IT-Куб</span>
                    <div class="margin-10px-top font-size14">1 группа</div>
                    <div class="font-size13 text-light-gray">Евгения Сергеевна</div>
                </td>
                <td>
                    <span class="bg-yellow padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">Точка роста</span>
                    <div class="margin-10px-top font-size14">2 группа</div>
                    <div class="font-size13 text-light-gray">Фанис Рашидович</div>
                </td>
                <td class="bg-light-gray">

                </td>
                <td class="bg-light-gray">

                </td>
                <td class="bg-light-gray">

                </td>
                <td class="bg-light-gray">

                </td>

            </tr>
            </tbody>
        </table>
    </div>
</div>

</html>