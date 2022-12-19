<!doctype html>
<html lang="en">
<head>
    <title>Документы</title>
</head>
<body>
<h2>Информация о документе</h2>
<b>Название документа:</b>${cart.title}<br>
<b>Название документа:</b>${cart.user}<br>
<b>Название документа:</b>${cart.dateOfCreated}<br>
<h2>Создать новую карточку документа</h2>
<form action="/cart/delete/${cart.id}" method="post">
    <input type="submit" value="Удалить карточку">
</form>
</body>
</html>