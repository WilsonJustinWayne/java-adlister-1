<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>

    <style>
        .card {
            height: 300px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
        }
        .card-footer {
            padding-bottom: 0;
        }
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
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="/profile" method="post">
                    <div class="form-group">
                        <div class="modal-body">
                            <label for="username">Username</label>
                            <input type="text" class="form-control" name="username" id="username" value="${sessionScope.user.username}">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" name="email" id="email" value="${sessionScope.user.email}">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" name="password" id="password">
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" name="methods" value="PUT">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <c:forEach var="ads" items="${ads}">
                <c:if test="${ads.userId == sessionScope.user.id}">
                    <div class="col-6 py-5">
                        <div class="card">
                            <div class="card-body text-center">
                                <h1 class="card-title">${ads.title}</h1>
                                <p class="card-text">${ads.description}</p>
                            </div>
                            <div class="card-footer">
                                <div class="row">
                                    <div class="col-6">
                                        <form action="/profile" method="POST">
                                            <div class="form-group">
                                                <input hidden type="number" name="ad_id" value="${ads.id}">
                                                <button id="submitButton" type="submit" class="btn btn-danger btn-sm btn-block">Delete</button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="col-6">
                                        <form action="/edit" method="GET">
                                            <div class="form-group">
                                                <input hidden type="number" name="ad_id" value="${ads.id}">
                                                <button type="submit" class="btn btn-primary btn-sm btn-block">Edit</button>
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
