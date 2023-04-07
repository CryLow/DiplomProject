<!doctype html>
<html lang="en">
<head>
    <title>Документы</title>
</head>
<body>
<h2>Информация о документе</h2>
<b>Уникальный индентификатор документа:</b>${cart.id}<br>
<b>Название документа:</b>${cart.title}<br>
<form th:action="@{/cart/delete/${cart.id}}" method="post">
    <input type="submit" value="Удалить карточку">
</form>
</body>
</html>