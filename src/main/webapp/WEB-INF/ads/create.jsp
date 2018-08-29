<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container">
    <h1>Create a new Ad</h1>
    <form action="/ads/create" method="post">
        <div class="form-group">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text" required>
        </div>
        <label for="categories">Categories: </label>
        <div id="categories" class="form-check form-check-inline">
            <input id="animals" name="categories" class="form-check-input" type="checkbox" value="1" required>
            <label class="form-check-label pr-2" for="animals">Animals </label>
            <input id="people" name="categories" class="form-check-input" type="checkbox" value="2" required>
            <label class="form-check-label pr-2" for="people">People </label>
            <input id="concepts" name="categories" class="form-check-input" type="checkbox" value="3" required>
            <label class="form-check-label pr-2" for="concepts">Concepts </label>
            <input id="things" name="categories" class="form-check-input" type="checkbox" value="4" required>
            <label class="form-check-label pr-2" for="things">Things </label>
            <input id="places" name="categories" class="form-check-input" type="checkbox" value="5" required>
            <label class="form-check-label pr-2" for="places">Places </label>
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" class="form-control" type="text" required></textarea>
        </div>
        <input type="submit" class="btn btn-block btn-primary">
    </form>
</div>

<jsp:include page="/WEB-INF/partials/scripts.jsp"/>
</body>
</html>
