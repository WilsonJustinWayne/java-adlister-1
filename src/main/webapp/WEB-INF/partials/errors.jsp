<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${hasError == true}">
    <div id="errors">
        <p class="text-white text-center py-2">
            <c:choose>
                <c:when test="${error == \"usernameAlreadyExists\"}">
                    Username already exists. Please enter a different username.
                </c:when>
                <c:when test="${error == \"usernameDoesntExist\"}">
                    Username doesn't exist. Please enter a different username.
                </c:when>
                <c:when test="${error == \"incorrectPasswordError\"}">
                    Incorrect password for this username. Please try a different password.
                </c:when>
                <c:when test="${error == \"passwordNonMatch\"}">
                    Passwords do not match. Please try again.
                </c:when>
            </c:choose>
        </p>
    </div>
</c:if>



