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
        <h1>Welcome to the Funko Pop Adlister!</h1>
<%--        <h3>Here are your Ads.</h3>--%>

        <a class="btn btn-primary stretched-link" href="/ads">Please Click here to see all the ads.</a>

    </div>
<%--    <div class="container">--%>
<%--        <c:forEach var="ad" items="${ads}">--%>
<%--            <div class="col-md-6">--%>
<%--                <h2>${ad.title}</h2>--%>
<%--                <p>${ad.description}</p>--%>
<%--            </div>--%>
<%--        </c:forEach>--%>
<%--    </div>--%>
</body>
</html>
