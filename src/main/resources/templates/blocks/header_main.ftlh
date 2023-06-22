<header>
    <div class="d-flex flex-column flex-md-row align-items-center mb-4 ">
        <a href="/main">
            <img src="https://i.imgur.com/FdWY2zN.png" class="logo">
        </a>

        <ul class="nav nav-pills_s">
            <li class="nav-item"><a href="/main" class="nav-link active" aria-current="page">Главная</a></li>
            <li class="nav-item"><a href="/profile/${user.getId()}" class="nav-link">Профиль</a></li>
            <li class="nav-item"><a href="/archive" class="nav-link">Архив</a></li>
            <li class="nav-item"><a href="/schedule" class="nav-link">Расписание</a></li>
            <#if user.isAdmin()>
                <li class="nav-item"><a href="/admin" class="nav-link">Панель администратора</a></li>
            </#if>
            <li class="nav-item"><a href="/about" class="nav-link">О нас</a></li>
            <li class="nav-item">
                <form action="/logout" method="POST">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <a class="nav-link" href="/logout">Выход</a>
                </form></li>
        </ul>
    </div>
</header>