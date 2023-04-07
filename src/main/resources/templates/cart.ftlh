<!doctype html>
<html lang="en">
<head>
    <title>Документы</title>
</head>
<body>
<h2>Документы</h2>
<#list carts as cart>
    <div>
        <p>
            <b>
                ${cart.title}
            </b>
            <b>
                ${cart.dateOfCreated}
            </b>
        </p>
    </div>
</#list>

<h2>Создать новую карточку документа</h2>
<form action="/cart/create" method="post" enctype="multipart/form-data">
    Название документа: <label>
        <input type="text" name="title"/>
    </label><br><br>
    Документ: <input type="file" name="file"/><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Добавить карточку">
</form>
</body>
</html>