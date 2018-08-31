<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
    <style>
        <%@ include file="/resources/css/main.css" %>
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="jumbotron jumbotron-fluid" id="hero">
        <div class="container">
            <h1 class="display-3">Welcome to the MyriadLister!</h1>
        </div>
    </div>

    <jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
