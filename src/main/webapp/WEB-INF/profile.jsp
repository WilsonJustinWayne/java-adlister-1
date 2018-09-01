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
                            <label for="username" class="placeholder-label modal-label">
                                <input type="text" class="form-control modal-input" name="username" id="username" value="${sessionScope.user.username}" placeholder=" ">
                                <span class="placeholder-text modal-text">Username</span>
                            </label>
                        </div>
                        <div class="form-group">
                            <label for="email" class="placeholder-label modal-label">
                                <input type="email" class="form-control modal-input" name="email" id="email" value="${sessionScope.user.email}" placeholder=" ">
                                <span class="placeholder-text modal-text">Email</span>
                            </label>
                        </div>
                        <div class="form-group">
                            <label for="password" class="placeholder-label modal-label">
                                <input type="password" class="form-control modal-input" name="password" id="password" placeholder=" ">
                                <span class="placeholder-text modal-text">Password</span>
                            </label>
                        </div>
                        <div class="row float-right pr-3">
                            <input type="hidden" name="methods" value="PUT">
                            <button type="button" class="btn btn-outline-secondary border-right-0" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-outline-primary border-left-0">Save changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid p-5" id="profile-ads">
        <div class="row">
            <c:forEach var="ads" items="${ads}">
                <c:if test="${ads.userId == sessionScope.user.id}">
                    <div class="col-12 col-md-6 mb-5">
                        <div class="card profile-cards">
                            <div class="card-body text-center">
                                <h1 class="card-title p-2">${ads.title}</h1>
                                <p class="card-text pt-5">${ads.description}</p>
                            </div>
                            <div class="row w-100 m-0 p-0">
                                <div class="col-6 m-0 p-0">
                                    <form action="/profile" method="POST">
                                        <div class="form-group">
                                            <input hidden type="number" name="id" value="${ads.id}">
                                            <button id="submitButton" type="submit" class="btn btn-outline-danger btn-lg btn-block">Delete</button>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-6 m-0 p-0">
                                    <form action="/edit" method="GET">
                                        <%--<form action="/profile" method="">--%>
                                        <div class="form-group">
                                            <input hidden type="number" name="ad_id" value="${ads.id}">
                                            <button type="submit" class="btn btn-outline-primary btn-lg btn-block fill">Edit</button>
                                            <input type="hidden" name="methods" value="ad_input">
                                        </div>
                                    </form>
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
