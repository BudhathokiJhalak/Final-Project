<%@include file="../header.jsp" %>
<%@include file="../navbar.jsp" %>
<div class="container">
    <div class="col-md-4 col-md-offset-4">
        <form method="post" class="search-form" action="${SITE_URL}/admin/user/search">
            <div class="form-group has-feedback">
                <label for="search" class="sr-only">Search</label>
                <input type="text" class="form-control" name="name" placeholder="search by user's name.">
                <span class="glyphicon glyphicon-search form-control-feedback"></span>
            </div>
        </form>
    </div>
    <br/>
    <div class="pull-right">
        <p>
            <a href="${SITE_URL}/admin/user/add" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-plus"> Add</span></a>
        </p>
    </div>
    <table class="table table-hover">
        <tr style="background: #333333">
            <th style="color: #ffffff">ID</th>
            <th style="color: #ffffff">Full Name</th>            
            <th style="color: #ffffff">Gender</th>
            <th style="color: #ffffff">Email</th>           
            <th style="color: #ffffff">Contact No</th>
            <th style="color: #ffffff">Address(Current)</th>
            <th style="color: #ffffff">Status</th>
            <th style="color: #ffffff">Action</th>
        </tr>
        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.userId}</td>
                <td>${user.firstName} ${user.lastName}</td>
                <td>${user.gender}</td>
                <td>${user.email}</td>
                <td>${user.mobileNo}</td>
                <td>${user.currentAddress}</td>
                <td>
                    <c:choose>
                        <c:when test="${user.status}">
                            Active
                        </c:when>
                        <c:otherwise>
                            Inactive
                        </c:otherwise>
                    </c:choose>
                </td>
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
<%@include file="../footer.jsp" %>