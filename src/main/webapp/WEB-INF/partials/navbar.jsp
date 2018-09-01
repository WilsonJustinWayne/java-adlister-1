<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand ml-5" href="/ads">MyriadLister</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
        <ul class="navbar-nav mx-5">
            <li class="nav-item">
                <a class="nav-link link-text" href="/ads/create">Create Myriad</a>
            </li>
            <c:choose>
                <c:when test="${sessionScope.user == null}">
                    <li class="nav-item">
                        <a class="nav-link link-text" href="/login">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link link-text" href="/register">Register</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item">
                        <a class="nav-link link-text" href="/profile">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link link-text" href="/logout">Logout</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</nav>