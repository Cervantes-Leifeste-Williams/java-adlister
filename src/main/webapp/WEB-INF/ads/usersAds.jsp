<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here are your Ads!</h1>
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
</body>
</html>
