<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container">
    <div class="col-md-12">
        <h1>All Funko Pop Ads!</h1>
        <form action="/ads" method="POST" class="form-inline my-2 my-lg-0">
            <input name="ads" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">GO!</button>
        </form>
<%--        <form action="/ads" method="POST" class="form-inline my-2 my-lg-0">--%>
<%--            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">--%>
<%--            <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">GO!</button>--%>
<%--        </form>--%>
    </div>


    <div class="container">
        <c:forEach var="ad" items="${ads}">
            <div class="col-md-6">
                <div><h3>${ad.title}</h3>
                    <div><p>${ad.description}</p>
                        <div>
                            <a href="/updateAd?adToUpdate=${ad.id}" class="btn btn-info stretched-link">View Details</a>
                                <%--                <a href="/goToAd?id=${ad.id}" class="btn btn-info stretched-link">View ad details</a>--%>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
