<%@include file="header.jsp" %>
<%@include file="navbar.jsp" %>
<div class="container">
    <div class="col-md-4">
        <h3>Profile</h3>
        <table>
            <p><label>ID:</label> ${user.userId}</p>
            <p><label>Full Name:</label> ${user.firstName} ${user.lastName}</p>
            <p><label>Email:</label> ${user.email}</p>
            <p><label>Mobile No:</label> ${user.mobileNo}</p>
            <p><label>Gender:</label> ${user.gender}</p>
            <p><label>Current Address:</label> ${user.currentAddress}</p>
            <p><label>Permanent Address:</label> ${user.permanentAddress}</p>
            <p><label>Blood Group:</label> ${user.bloodGroup}</p>
            <p><label>Interest:</label> ${user.interest}</p>
            <p><label>Added Date:</label> ${user.addedDate}</p>
            <p><label>Username:</label> ${user.username}</p>
            <p><label>Password:</label> ${user.password}</p>
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
        <a href="${SITE_URL}/admin" class="btn btn-danger"><span class="glyphicon glyphicon-circle-arrow-left"></span> Back</a>
    </div>
    <div class="col-md-8">

        <form>
            <div class="col-sm-11">
                <div class="form-group">
                    <textarea name="description" class="form-control" placeholder="Ask any Question??" required="required"></textarea>
                    <hr/>
                </div>
            </div>
            <div class="col-md-1">
                <button type="submit" class="btn btn-primary">Post</button>
            </div>
        </form>
        <br/>
        <div class="col-sm-12">
            <h3>Activity</h3>
            <hr/>
            <c:forEach var="post" items="${posts}">
                <div class="pull-right">
                    <p>
                        <a href="${SITE_URL}/admin/post/edit/${post.postId}" class="btn btn-default btn-xs"><span class="glyphicon glyphicon-pencil"></span></a>
                        <a href="${SITE_URL}/admin/post/delete/${post.postId}" class="btn btn-danger btn-xs" onclick="return confirm('Are you sure to delete?')"><span class="glyphicon glyphicon-trash"></span></a>
                    </p>
                </div>
                <div class="form-group">
                    <label>${post.userId.firstName} ${post.userId.lastName}</label> 
                    <p>${post.description}</p>
                    <p>${post.addedDate}</p>
                    <a href="${SITE_URL}/admin/post/view/${post.postId}">View all replies</a>
                    <hr/>
                    <br/>
                </div>
            </c:forEach>
        </div>
    </div>

</div>
<%@include file="footer.jsp" %>