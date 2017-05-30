<%@include file="../header.jsp" %>
<%@include file="../navbar.jsp" %>
<div class="container">
    <div class="col-md-4 col-md-offset-4">
        <form method="post" class="search-form" action="${SITE_URL}/admin/reply/search">
            <div class="form-group has-feedback">
                <label for="search" class="sr-only">Search</label>
                <input type="text" class="form-control" name="keyword" placeholder="search by keyword">
                <span class="glyphicon glyphicon-search form-control-feedback"></span>
            </div>
        </form>
    </div>
    <table class="table table-hover">
        <tr style="background: #333333">
            <th style="color: #ffffff">Reply ID</th>
            <th style="color: #ffffff">Description</th>
            <th style="color: #ffffff">Added Date</th>
            <th style="color: #ffffff">Action</th>
        </tr>
        <c:forEach var="reply" items="${replies}">
            <tr>
                <td>${reply.replyId}</td>
                <td>${reply.description}</td>
                <td>${reply.addedDate}</td>
                <td>
                    <a href="${SITE_URL}/admin/reply/desc/${reply.replyId}" class="btn btn-success btn-xs"><span class="glyphicon glyphicon-list-alt"></span></a>
                    <a href="${SITE_URL}/admin/reply/edit/${reply.replyId}" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-pencil"></span></a>
                    <a href="${SITE_URL}/admin/reply/delete/${reply.replyId}" class="btn btn-danger btn-xs" onclick="return confirm('Are you sure to delete?')"><span class="glyphicon glyphicon-trash"></span></a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<%@include file="../footer.jsp" %>