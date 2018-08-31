<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">

        <div class="col-6 offset-3 my-3">
            <h1>Targeted Ad</h1>
            <h2>${ads.title}</h2>
            <p>${ads.description}</p>
        </div>

    <h1 class="my-5">Edit the targeted Ad</h1>
    <form action="/edit" method="post">
        <div class="form-group">
            <label for="title">New Title</label>
            <input id="title" name="title" class="form-control" type="text" required>
        </div>
        <div class="form-group">
            <label for="description">New Description</label>
            <textarea id="description" name="description" class="form-control" type="text" required></textarea>
        </div>
        <input hidden type="text" name="ad_id" value="${ads.id}">
        <input type="submit" class="btn btn-block btn-primary mt-5">
    </form>
</div>

<jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
