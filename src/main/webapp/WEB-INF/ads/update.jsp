<%--
  Created by IntelliJ IDEA.
  User: georgewilliams
  Date: 7/28/20
  Time: 3:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Update Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
<%--    consider including the original add here (its show page)
                    then
                    fields prefilled with the existing data
                    and
                    update and cancel buttons
                        update takes to new ad show page
                        cancel dumps any changes made in field--%>
    <div class="container">

        <h1>Update Your Ad</h1>
        <h2>${sessionScope.ad.title}</h2>
        <h3>${sessionScope.ad.description}</h3>
        <form action="/ads/update" method="post">
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text" placeholder="${ad.title}">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text" placeholder="${ad.description}"></textarea>
            </div>
            <input type="submit" class="btn btn-block btn-primary">
            <button type="button">Cancel</button>
            <h2><a href="ads/usersAds">Cancel</a></h2>
            <h2><a href="/profile">My Profile</a></h2>
        </form>

    </div>

</body>
</html>
