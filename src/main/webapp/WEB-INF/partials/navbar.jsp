<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light navbar-right mb-3">
    <a class="navbar-brand ml-5" href="/ads">MyriadLister</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse d-flex flex-row-reverse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link mr-5" href="/ads/create">Create Ad</a>
            </li>
            <c:choose>
                <c:when test="${sessionScope.user == null}">
                    <li class="nav-item active mx-4">
                        <a class="nav-link" href="/login">Login</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item mx-4">
                        <a class="nav-link" href="/logout">Logout</a>
                    </li>
                </c:otherwise>

            </c:choose>

        </ul>
    </div>
</nav>