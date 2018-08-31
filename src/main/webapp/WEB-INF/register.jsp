<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
</head>
<%
    if (request.getAttribute("username") == null) {
        request.setAttribute("username", "");
    }
    if (request.getAttribute("email") == null) {
        request.setAttribute("email", "");
    }
%>

<style>
    <%@ include file="/resources/css/main.css" %>
</style>
<body>
    <jsp:include page="partials/navbar.jsp" />
    <div class="container-fluid p-5">
        <h1 class="display-4">Please fill in your information</h1>
        <form action="/register" method="post">
            <div class="form-group">
                <input id="username" name="username" class="form-control inputs" type="text" required value="<%= request.getAttribute("username")%>">
                <label for="username" class="form-control-placeholder">Username</label>
            </div>
            <div class="form-group">
                <input id="email" name="email" class="form-control inputs" type="text" required value="<%= request.getAttribute("email")%>">
                <label for="email" class="form-control-placeholder">Email</label>
            </div>
            <div class="form-group">
                <input id="password" name="password" class="form-control inputs" type="password" required>
                <label for="password" class="form-control-placeholder">Password</label>
            </div>
            <div class="form-group">
                <input id="confirm_password" name="confirm_password" class="form-control inputs" type="password" required>
                <label for="confirm_password" class="form-control-placeholder">Confirm Password</label>
            </div>
            <input type="submit" class="btn btn-primary btn-block">
        </form>
        <jsp:include page="/WEB-INF/partials/errors.jsp" />
    </div>

    <jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
