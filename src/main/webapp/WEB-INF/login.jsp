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
    <div class="container-fluid p-5">
        <h1 class="display-4">Please log in</h1>
        <form action="/login" method="POST">
            <div class="form-group">
                <input id="username" name="username" class="form-control inputs" type="text" required value="<%= request.getAttribute("username")%>">
                <label for="username" class="form-control-placeholder">Username</label>
            </div>
            <div class="form-group">
                <input id="password" name="password" class="form-control inputs" type="password" required>
                <label for="password" class="form-control-placeholder">Password</label>
            </div>
            <input type="submit" class="btn btn-primary btn-block" value="Log In">
        </form>
        <div id="register">
            <h4>Not already a user?</h4>
            <h4 class="text-primary"><a href="/register">Register Here!</a></h4>
        </div>
        <jsp:include page="/WEB-INF/partials/errors.jsp" />
    </div>

    <jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
