<div class="row">
    <div class="d-flex">
        <#if user.isAdmin()>
        <a href="/created"><button class="btn_1 btn-lg btn-primary_1 color-btn" type="submit">Добавить новый документ</button></a>
        </#if>
        <form action="<#if arch==true>/search<#else><#if profile==true>/searchBy/${carts[0].getUser().getId()}<#else>/search-active</#if></#if>"
              class="form-grow" method="GET">
        <select name="searching" class="custom-input_1" aria-label="Выберите опцию">
            <option selected value="none">Сортировка</option>
            <option value="dateS">По дате регистрации</option>
            <option value="userS">По ответственным</option>
            <option value="categoryO">Организационные документы</option>
            <option value="categoryF">Федеральные документы</option>
            <option value="categoryN">Нормативные документы</option>
            <option value="categoryD">Дополнительно-образовательные документы</option>
        </select>
        <div class="custom-input">
            <input type="text" name="keyword" placeholder="Поиск..." class="custom-input__field">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit" class="custom-input__button">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search">
                        <circle cx="11" cy="11" r="8"></circle>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                    </svg>
                </button>
            </form>
        </div>
    </div>
</div>