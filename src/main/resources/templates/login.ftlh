<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="https://www.thymeleaf.org" lang="ru">
<head>
  <title>Вход</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
  <link rel="script" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
  <link rel="stylesheet" href="static/css/styleSignIn.css">
</head>
<body class="text-center">
<main class="form-signin w-100 m-auto">
  <form th:action="@{/login}" method="post">
    <h1 class="h3 mb-3 fw-normal">Вход в учетную запись</h1>
    <div class="form-floating">
      <input type="email" class="form-control" id="floatingInput" name="username" placeholder="name@example.com">
      <label for="floatingInput">Email address</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password">
      <label for="floatingPassword">Password</label>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <button class="w-100 btn btn-lg btn-primary" type="submit">Вход</button>
    <p class="mt-2 mb-2 text-muted">©2023</p>
  </form>
</main>
</body>
</html>