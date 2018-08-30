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
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Please Log In</h1>
        <form action="/login" method="POST">
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text" required value="<%= request.getAttribute("username")%>">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password" required>
            </div>
            <input type="submit" class="btn btn-primary btn-block" value="Log In">
        </form>
        <div id="register">
            <h4>Not already a user?</h4>
            <h4 class="text-primary"><a href="/register">Register Here!</a></h4>
        </div>
    </div>

    <jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
