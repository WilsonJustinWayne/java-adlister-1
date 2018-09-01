<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>

    <style>
        <%@ include file="/resources/css/main.css" %>
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h1 class="display-4">Welcome, ${sessionScope.user.username}!</h1>
            <a href="#" class="badge badge-light" data-toggle="modal" data-target="#editProfile">Edit profile</a>
        </div>
    </div>

    <div class="modal fade" id="editProfile" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editProf">Editing Profile</h5>
                </div>
                <div class="modal-body">
                    <form action="/profile" method="post">
                        <div class="form-group">
                            <input type="text" class="form-control inputs" name="username" id="username" value="${sessionScope.user.username}">
                            <label for="username" class="form-control-placeholder">Username</label>
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control inputs" name="email" id="email" value="${sessionScope.user.email}">
                            <label for="email" class="form-control-placeholder">Email</label>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control inputs" name="password" id="password">
                            <label for="password" class="form-control-placeholder">Password</label>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" name="methods" value="PUT">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid p-5">
        <div class="row">
            <c:forEach var="ads" items="${ads}">
                <c:if test="${ads.userId == sessionScope.user.id}">
                    <div class="col-12 col-md-6 mb-3">
                        <div class="card profile-cards">
                            <div class="card-body text-center">
                                <h1 class="card-title">${ads.title}</h1>
                                <p class="card-text">${ads.description}</p>
                            </div>
                            <div class="card-footer m-0 p-0">
                                <div class="row w-100 m-0 p-0">
                                    <div class="col-6 m-0 p-0">
                                        <form action="/profile" method="POST">
                                            <div class="form-group">
                                                <input hidden type="number" name="id" value="${ads.id}">
                                                <button id="submitButton" type="submit" class="btn btn-danger btn-sm btn-block">Delete</button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="col-6 m-0 p-0">
                                        <form action="/edit" method="GET">
                                            <%--<form action="/profile" method="">--%>
                                            <div class="form-group">
                                                <input hidden type="number" name="ad_id" value="${ads.id}">
                                                <button type="submit" class="btn btn-primary btn-sm btn-block">Edit</button>
                                                <input type="hidden" name="methods" value="ad_input">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>

    <jsp:include page="/WEB-INF/partials/scripts.jsp" />

</body>
</html>
