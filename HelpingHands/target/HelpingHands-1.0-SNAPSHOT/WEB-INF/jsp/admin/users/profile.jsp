<%@include file="../header.jsp" %>
<%@include file="../navbar.jsp" %>
<div class="container">
    <h3>User Profile</h3>
    <table>
        <p><label>ID:</label> ${user.userId}</p>
        <p><label>Full Name:</label> ${user.firstName} ${user.lastName}</p>
        <p><label>Contact Info:</label> ${user.email} | ${user.mobileNo}</p>
        <p><label>Gender:</label> ${user.gender}</p>
        <p><label>Current Address:</label> ${user.currentAddress}</p>
        <p><label>Permanent Address:</label> ${user.permanentAddress}</p>
        <p><label>Blood Group:</label> ${user.bloodGroup}</p>
        <p><label>Interest:</label> ${user.interest}</p>
        <p><label>Added Date:</label> ${user.addedDate}</p>
        <p><label>Username:</label> ${user.username}</p>
        <p><label>Password:</label> ${user.password}</p>
        <p><label>Role:</label> ${user.role}</p>
        <p><label>Status:</label> 
            <c:choose>
                <c:when test="${user.status}">
                    Active
                </c:when>
                <c:otherwise>
                    Inactive
                </c:otherwise>
            </c:choose>
        </p>
    </table>
        <a href="${SITE_URL}/admin/user/edit/${user.userId}" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span> Edit</a>
        <a href="${SITE_URL}/admin/user" class="btn btn-danger"><span class="glyphicon glyphicon-circle-arrow-left"></span> Back</a>
</div>
<%@include file="../footer.jsp" %>