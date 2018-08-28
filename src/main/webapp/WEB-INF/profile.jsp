<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
    </div>

    <div class="container-fluid">
        <div class="row">
            <c:forEach var="ads" items="${ads}">
                <c:if test="${ads.userId == sessionScope.user.id}">
                    <div class="col-6 py-5">
                        <h1 class="text-center">${ads.title}</h1>
                        <p class="text-center">${ads.description}</p>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>

    <jsp:include page="/WEB-INF/partials/scripts.jsp" />

</body>
</html>
