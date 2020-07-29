<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>Original Ad:</h1>

<h1>Update You Ad:</h1>
<div class="container">
    <form action="/register" method="post">
        <div class="form-group">
<%--            <c:if test="${userError}">--%>
<%--                <div class="alert alert-danger" role="alert">--%>
<%--                    Username is a required field--%>
<%--                </div>--%>
<%--            </c:if>--%>
            <label for="username">Username</label>
            <input id="username" name="username" class="form-control" type="text" placeholder="${user.username}">
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input id="email" name="email" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input id="password" name="password" class="form-control" type="password">
        </div>
        <div class="form-group">
            <label for="confirm_password">Confirm Password</label>
            <input id="confirm_password" name="confirm_password" class="form-control" type="password">
        </div>
        <input type="submit" class="btn btn-primary btn-block">
    </form>

</div>
