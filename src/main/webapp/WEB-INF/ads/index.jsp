<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads"/>
    </jsp:include>

    <style>
        <%@ include file="/resources/css/main.css" %>
    </style>

</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container-fluid p-5" id="index-ads">
    <input type="text" class="form-control my-3" id="search" name="search" placeholder="search">

    <div class="container-fluid">
        <div class="row">
            <c:forEach var="ad" items="${ads}">
                <div class="col-12 col-md-6 mb-5">
                    <div class="card">
                        <div class="card-body text-center">
                            <h1 class="card-title p-2">${ad.title}</h1>
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
                            <a class="btn btn-light btn-small float-right more-info" href="/ad?id=${ad.id}">More info</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/partials/scripts.jsp"/>
<script>
    $( document ).ready(function() {
        $('#search').keyup(function () {
            let filter = $(this).val();

            $('.card').each(function () {
                if ($(this).find('.card-title').text().search(new RegExp(filter, 'i')) < 0 ) {
                    $(this).parent().hide();
                } else {
                    $(this).parent().show();
                }
            })
        });
    });
</script>
</body>
</html>
