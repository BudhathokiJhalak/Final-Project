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
                    <th>Full Name</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td><label>${user.firstName} ${user.lastName}</td>
                        <td>
                            <a href="${SITE_URL}/admin/user/profile/${user.userId}" class="btn btn-default btn-xs"><span class="glyphicon glyphicon-user"></span></a>
                            <a href="${SITE_URL}/admin/user/mail/${user.userId}" class="btn btn-success btn-xs"><span class="glyphicon glyphicon-envelope"></span></a>
                            <a href="${SITE_URL}/admin/user/edit/${user.userId}" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-pencil"></span></a>
                            <a href="${SITE_URL}/admin/user/delete/${user.userId}" class="btn btn-danger btn-xs" onclick="return confirm('Are you sure to delete?')"><span class="glyphicon glyphicon-trash"></span></a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="col-md-4"></div>
    </div>
</div>
<%@include file="../footer.jsp" %>