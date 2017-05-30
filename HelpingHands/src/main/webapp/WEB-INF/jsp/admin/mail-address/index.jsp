<%@include file="../header.jsp" %>
<%@include file="../navbar.jsp" %>
<div class="container">
    <div class="pull-right">
        <p>
            <a href="${SITE_URL}/admin/mail-address/add" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-plus"> Add</span></a>
        </p>
    </div>
    <table class="table table-hover">
        <tr style="background: #333333">
            <th style="color: #ffffff">ID</th>
            <th style="color: #ffffff">Mail Address</th>
            <th style="color: #ffffff">Action</th>
        </tr>
        <c:forEach var="ma" items="${mailAddress}">
            <tr>
                <td>${ma.mailAddressId}</td>
                <td>${ma.email}</td>
                <td>
                    <a href="${SITE_URL}/admin/mail-address/edit/${ma.mailAddressId}" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-pencil"></span></a>
                    <a href="${SITE_URL}/admin/mail-address/delete/${ma.mailAddressId}" class="btn btn-danger btn-xs" onclick="return confirm('Are you sure to delete?')"><span class="glyphicon glyphicon-trash"></span></a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<%@include file="../footer.jsp" %>