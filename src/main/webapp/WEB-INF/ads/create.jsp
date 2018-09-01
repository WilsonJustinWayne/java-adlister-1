<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad"/>
    </jsp:include>
    <style>
        <%@ include file="/resources/css/main.css" %>
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container-fluid p-5" id="create-ad">
    <h1 class="display-4">Create a new myriad</h1>
    <form action="/ads/create" method="post">
        <div class="form-group">
            <label for="title" class="placeholder-label">
                <input id="title" name="title" class="form-control" type="text" required placeholder=" ">
                <span class="placeholder-text">Title</span>
            </label>
        </div>
        <div class="form-group">
            <label for="description" class="placeholder-label" id="desc">
                <textarea id="description" name="description" class="form-control" type="text" required placeholder=" "></textarea>
                <span class="placeholder-text placeholder-text-area">Description</span>
            </label>
        </div>
        <div class="form-check pl-0 py-3">
            <label for="categories">Categories: </label>
            <div id="categories" class="form-check form-check-inline">
                <input id="animals" name="categories" class="form-check-input" type="checkbox" value="1">
                <label class="form-check-label pr-2" for="animals">Animals </label>
                <input id="people" name="categories" class="form-check-input" type="checkbox" value="2">
                <label class="form-check-label pr-2" for="people">People </label>
                <input id="concepts" name="categories" class="form-check-input" type="checkbox" value="3">
                <label class="form-check-label pr-2" for="concepts">Concepts </label>
                <input id="things" name="categories" class="form-check-input" type="checkbox" value="4">
                <label class="form-check-label pr-2" for="things">Things </label>
                <input id="places" name="categories" class="form-check-input" type="checkbox" value="5">
                <label class="form-check-label pr-2" for="places">Places </label>
            </div>
        </div>
        <input id="adCreateButton" type="submit" class="btn btn-block btn-outline-success">
    </form>
</div>
<jsp:include page="/WEB-INF/partials/scripts.jsp"/>
<script>
    (function () {
        $(document).ready(function () {
            $('#adCreateButton').click(() => {
                if (!$("input[type=checkbox]:checked").length) {
                    alert("You must check at least one checkbox.");
                    return false;
                }

            });
        });
    })();
</script>
</body>
</html>
