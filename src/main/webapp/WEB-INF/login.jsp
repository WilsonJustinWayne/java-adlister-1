<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>
</head>
<%
    if (request.getAttribute("username") == null) {
        request.setAttribute("username", "");
    }
%>

<style>
    <%@ include file="/resources/css/main.css" %>
</style>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container-fluid p-5" id="login-page">
        <h1 class="display-4">Please log in</h1>
        <form action="/login" method="POST">
            <div class="form-group">
                <label for="username" class="placeholder-label">
                    <input id="username" name="username" class="form-control" type="text" required value="<%= request.getAttribute("username")%>" placeholder=" ">
                    <span class="placeholder-text">Username</span>
                </label>
            </div>
            <div class="form-group">
                <label for="password" class="placeholder-label">
                    <input id="password" name="password" class="form-control" type="password" required placeholder=" ">
                    <span class="placeholder-text">Password</span>
                </label>
            </div>
            <input type="submit" class="btn btn-outline-success btn-block" value="Log In">
        </form>
        <div id="register">
            <h4>Not already a user?</h4>
            <h4 class="text-primary"><a href="/register" class="link-text">Register Here!</a></h4>
        </div>
        <jsp:include page="/WEB-INF/partials/errors.jsp" />
    </div>

    <jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
