<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp" />

    <style>
        .card {
            height: 300px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
        }
    </style>
</head>
<body>

    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container-fluid h-100">
        <div class="row h-100">
            <div class="col-6 m-auto">
                <div class="card">
                    <div class="card-body text-center">
                        <h2 class="card-title">${ad.title}</h2>
                        <p class="card-text">${ad.description}</p>
                    </div>
                    <div class="card-footer">
                        <p class="card-text text-right">Created by ${user.username}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/partials/scripts.jsp" />

</body>
</html>
