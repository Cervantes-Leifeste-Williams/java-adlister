<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">
    <h3>Edit Your Ad.</h3>
</div>
<div class="container">
    <h1>${ad.title} Details!</h1>
    <div>
        <p>${ad.description} </p>
        <form action="/ads/updateAd" method="get" >
            <input type="hidden" name ="adToUpdate" value="${ad.id}">
            <a href="/updateAd?adToUpdate=${ad.id}" class="btn btn-info stretched-link">View Details</a>
            <input type="submit" value="Edit this ad" class="btn btn-info stretched-link">
        </form>
        <br>
        <form action="/ads/deleteAd"  method="post">
            <input type="hidden" name ="adToDelete" value="${ad.id}">
            <input type="submit" name ="deleteAd" value="Delete this ad" class="btn btn-danger stretched-link">
        </form>
    </div>
</div>
</body>
</html>
