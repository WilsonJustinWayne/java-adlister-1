<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

    nav {
        padding: 0 !important;
    }

    li {
        list-style: none;
    }

    a {
        color: black;
    }
    a:hover {
        color: white;
    }

    .navbar-brand {
        font-size: 2em;
    }

    .nav-link {
        color: white;
        font-size: 1.5em;
    }

</style>

<nav class="navbar navbar-dark bg-dark">
    <a class="navbar-brand ml-5" href="/ads">MyriadLister</a>
    <ul class="navbar">
        <li class="nav-item">
            <a class="nav-link" href="/ads/create">Create Ad</a>
        </li>
        <c:choose>
            <c:when test="${sessionScope.user == null}">
                <li class="nav-item">
                    <a class="nav-link" href="/login">Login</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="nav-item">
                    <a class="nav-link" href="/profile">Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/logout">Logout</a>
                </li>
            </c:otherwise>

        </c:choose>

    </ul>
</nav>