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


</body>
</html>
