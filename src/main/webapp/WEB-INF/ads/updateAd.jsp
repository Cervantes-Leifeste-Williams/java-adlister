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
<h1>Original Ad:</h1>
<jsp:include page="/WEB-INF/ads/viewAnAdOnly.jsp">
<h1>Update You Ad:</h1>
<div class="container">
    <form action="/updateAd" method="post">
        <div class="form-group">
<%--            <c:if test="${userError}">--%>
<%--                <div class="alert alert-danger" role="alert">--%>
<%--                    Username is a required field--%>
<%--                </div>--%>
<%--            </c:if>--%>
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text" placeholder="${ad.title}">
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <input id="description" name="description" class="form-control" type="text">
        </div>
        <input type="submit" class="btn btn-primary btn-block">
    </form>

</div>
