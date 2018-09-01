<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit Ads" />
    </jsp:include>

    <style>
        <%@ include file="/resources/css/main.css" %>
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container-fluid p-5" id="edit-page">

    <form class="mt-5" action="/edit" method="post">
        <div class="form-group">
            <label for="title" class="placeholder-label">
                <input id="title" name="title" class="form-control inputs" type="text" required placeholder=" ">
                <span class="placeholder-text">New Title</span>
            </label>
        </div>
        <div class="form-group">
            <label for="description" class="placeholder-label">
                <textarea id="description" name="description" class="form-control inputs" type="text" required placeholder=" "></textarea>
                <span class="placeholder-text placeholder-text-area">New Description</span>
            </label>
        </div>
        <input hidden type="text" name="ad_id" value="${ads.id}">
        <input type="submit" class="btn btn-block btn-outline-success mt-5">
    </form>
</div>

<jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
