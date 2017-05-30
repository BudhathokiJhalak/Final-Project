<%@include file="header.jsp" %>
<%@include file="navbar.jsp" %>
<br/><br/><br/>
<div class="container">
    <div class="col-md-4">
        <h3>User Profile</h3>
        <table>
            <p style="font-family: Georgia"><label style="font-family: Forte">ID:  </label> ${user.userId}</p>
            <p style="font-family: Georgia"><label style="font-family: Forte">Full   Name:</label> ${user.firstName} ${user.lastName}</p>
            <p style="font-family: Georgia"><label style="font-family: Forte">Email:  </label> ${user.email}</p>
            <p style="font-family: Georgia"><label style="font-family: Forte">Mobile No:</label> ${user.mobileNo}</p>
            <p style="font-family: Georgia"><label style="font-family: Forte">Gender:</label> ${user.gender}</p>
            <p style="font-family: Georgia"><label style="font-family: Forte">Current Address:</label> ${user.currentAddress}</p>
            <p style="font-family: Georgia"><label style="font-family: Forte">Permanent Address:</label> ${user.permanentAddress}</p>
            <p style="font-family: Georgia"><label style="font-family: Forte">Blood Group:</label> ${user.bloodGroup}</p>
            <p style="font-family: Georgia"><label style="font-family: Forte">Interest:</label> ${user.interest}</p>
            <p style="font-family: Georgia"><label style="font-family: Forte">Added Date:</label> ${user.addedDate}</p>
            <p style="font-family: Georgia"><label style="font-family: Forte">Status:</label> 
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
        <a href="${SITE_URL}/home/profile/update/${user.userId}" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span> Edit</a>
        <a href="${SITE_URL}/home" class="btn btn-danger"><span class="glyphicon glyphicon-circle-arrow-left"></span> Back</a>
    </div>
    <div class="col-md-8">

        <form method="post" action="${SITE_URL}/home/post/save">
            <div class="col-sm-11">
                <div class="form-group">
                    <textarea name="description" class="form-control" placeholder="Ask any Question??" required="required"></textarea>
                    <hr/>
                </div>
            </div>
            <div class="col-md-1">
                <input type="hidden" name="userId.userId" value="${loggedUser.userId}"/>
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
                        <a href="${SITE_URL}/home/post/update/${post.postId}" class="btn btn-default btn-xs"><span class="glyphicon glyphicon-pencil"></span></a>
                        <a href="${SITE_URL}/home/post/delete/${post.postId}" class="btn btn-danger btn-xs" onclick="return confirm('Are you sure to delete?')"><span class="glyphicon glyphicon-trash"></span></a>
                    </p>
                </div>
                <div class="form-group">
                    <label style="font-size: 17px ;font-family: Magneto">${post.userId.firstName} ${post.userId.lastName}</label> 
                    <p style="font-size: 17px; font-family: Consolas">${post.description}</p>
                    <p style="font-size: 17px; font-family: Microsoft Uighur">${post.addedDate}</p>
                    <a href="${SITE_URL}/home/post/view/${post.postId}">View all replies</a>
                    <hr/>
                    <br/>
                </div>
            </c:forEach>
        </div>
    </div>

</div>
<%@include file="footer.jsp" %>