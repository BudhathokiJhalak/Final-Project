<%@include file="../header.jsp" %>
<%@include file="../navbar.jsp" %>
<div class="container">
    <div class="col-md-4 col-md-offset-4">
        <form method="post" class="search-form" action="${SITE_URL}/admin/post/search">
            <div class="form-group has-feedback">
                <label for="search" class="sr-only">Search</label>
                <input type="text" class="form-control" name="keyword" placeholder="search by keyword">
                <span class="glyphicon glyphicon-search form-control-feedback"></span>
            </div>
        </form>
    </div>
    <table class="table table-hover">
        <tr style="background: #333333">
            <th style="color: #ffffff">Post ID</th>
            <th style="color: #ffffff">Description</th>
            <th style="color: #ffffff">Added Date</th>
            <th style="color: #ffffff">Action</th>
        </tr>
        <c:forEach var="post" items="${posts}">
            <tr>
                <td>${post.postId}</td>
                <td>${post.description}</td>
                <td>${post.addedDate}</td>
                <td>
                    <a href="${SITE_URL}/admin/post/desc/${post.postId}" class="btn btn-success btn-xs"><span class="glyphicon glyphicon-list-alt"></span></a>
                    <a href="${SITE_URL}/admin/post/edit/${post.postId}" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-pencil"></span></a>
                    <a href="${SITE_URL}/admin/post/delete/${post.postId}" class="btn btn-danger btn-xs" onclick="return confirm('Are you sure to delete?')"><span class="glyphicon glyphicon-trash"></span></a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<%@include file="../footer.jsp" %>