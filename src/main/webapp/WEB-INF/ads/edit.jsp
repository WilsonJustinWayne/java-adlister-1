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
<div class="container-fluid p-5">

    <form class="mt-5" action="/edit" method="post">
        <div class="form-group">
            <input id="title" name="title" class="form-control inputs" type="text" required>
            <label for="title" class="form-control-placeholder">New Title</label>
        </div>
        <div class="form-group">
            <textarea id="description" name="description" class="form-control inputs" type="text" required></textarea>
            <label for="description" class="form-control-placeholder-textarea">New Description</label>
        </div>
        <input hidden type="text" name="ad_id" value="${ads.id}">
        <input type="submit" class="btn btn-block btn-primary mt-5">
    </form>
</div>

<jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
