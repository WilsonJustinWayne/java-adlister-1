<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>

    <style>
        .card {
            height: 300px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
        }

        .btn {
            border-radius: 0;
        }
    </style>

</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here Are all the ads!</h1>

    <jsp:include page="/WEB-INF/partials/searchBar.jsp" />

    <div class="container-fluid">
        <div class="row">
            <c:forEach var="ad" items="${ads}">
                <div class="col-6 mb-3">
                    <div class="card">
                        <div class="card-body text-center">
                            <h2 class="card-title p-2">${ad.title}</h2>
                            <p class="card-text">${ad.description}</p>
                        </div>
                        <a class="btn btn-light btn-small" href="/ad?id=${ad.id}">More info</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/partials/scripts.jsp" />

</body>
</html>
