<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
        <hr>
        <h3>Dashboard:</h3>
        <br>
        <h2><a href="">My Ads</a></h2>
        <br>
        <h2><a href="ads/create">Create Ad</a></h2>
    </div>
<<<<<<< HEAD


=======
    <div class="container">
        <h1>Here are your Ads!</h1>
        <c:forEach var="ad" items="${ads}">
            <div class="col-md-6">
                <h2>${ad.title}</h2>
                <p>${ad.description}</p>
            </div>
        </c:forEach>
    </div>
>>>>>>> 1259612779f5e27a8f8356c5b8cfcc3056d65faa
</body>
</html>
