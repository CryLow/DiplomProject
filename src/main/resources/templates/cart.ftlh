<!doctype html>
<html lang="en">
<head>
    <title>Документы</title>
</head>
<body>
<h2>Документы</h2>


<h2>Создать новую карточку документа</h2>
<form action="/cart/create" method="post" enctype="multipart/form-data">
    Название документа: <input type="text" name="title"/><br><br>
    Документ: <input type="file" name="file"/><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Добавить карточку">
</form>
</body>
</html>