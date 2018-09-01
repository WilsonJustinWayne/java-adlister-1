<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp" />

    <style>
        <%@ include file="/resources/css/main.css" %>
    </style>
</head>
<body>

    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container-fluid h-100">
        <div class="row h-100">
            <div class="col-6 m-auto">
                <div class="card">
                    <div class="card-body text-center">
                        <h2 class="card-title p-2">${ad.title}</h2>
                        <p class="card-text pt-5">${ad.description}</p>
                    </div>
                    <div class="card-footer">
                        <c:forEach var="cat" items="${ad.categories}">
                            <c:choose>
                                <c:when test="${cat.categoryId == 1}">
                                        <span class="badge badge-pill badge-dark" id="b-animals">
                                            Animals
                                        </span>
                                </c:when>
                                <c:when test="${cat.categoryId == 2}">
                                        <span class="badge badge-pill badge-dark" id="b-people">
                                            People
                                        </span>
                                </c:when>
                                <c:when test="${cat.categoryId == 3}">
                                        <span class="badge badge-pill badge-dark" id="b-concepts">
                                            Concepts
                                        </span>
                                </c:when>
                                <c:when test="${cat.categoryId == 4}">
                                        <span class="badge badge-pill badge-dark" id="b-food">
                                            Food
                                        </span>
                                </c:when>
                                <c:otherwise>
                                        <span class="badge badge-pill badge-dark" id="b-places">
                                            Places
                                        </span>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <p class="card-text text-right" id="created-by">Created by ${ad.createdBy}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/partials/scripts.jsp" />

</body>
</html>
