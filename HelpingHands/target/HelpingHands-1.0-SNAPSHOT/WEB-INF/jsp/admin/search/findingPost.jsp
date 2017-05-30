<%@include file="../header.jsp" %>
<%@include file="../navbar.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-6">
            <h3>Listing All Findings</h3>
            <br/>
            <table class="table table-hover">
                <tr>
                    <th>Description</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="post" items="${posts}">
                    <tr>
                        <td><label>${post.description}</td>
                        <td>
                            <a href="${SITE_URL}/admin/post/desc/${post.postId}" class="btn btn-success btn-xs"><span class="glyphicon glyphicon-list-alt"></span></a>
                            <a href="${SITE_URL}/admin/post/edit/${post.postId}" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-pencil"></span></a>
                            <a href="${SITE_URL}/admin/post/delete/${post.postId}" class="btn btn-danger btn-xs" onclick="return confirm('Are you sure to delete?')"><span class="glyphicon glyphicon-trash"></span></a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="col-md-4"></div>
    </div>
</div>
<%@include file="../footer.jsp" %>