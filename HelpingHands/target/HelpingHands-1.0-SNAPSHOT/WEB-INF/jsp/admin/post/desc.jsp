<%@include file="../header.jsp" %>
<%@include file="../navbar.jsp" %>
<div class="container">
    <h3>Description about Post</h3><br/>
    <table>
        <p><label>Post ID:</label> ${post.postId}</p>
        <p><label>Description:</label> ${post.description}</p>
        <p><label>Added Date:</label> ${post.addedDate}</p>
        <p><label>Posted By(ID):</label> ${post.userId.userId}</p>
        <p><label>Posted By(Name):</label> ${post.userId.firstName} ${post.userId.lastName}</p>
    </table>
    <a href="${SITE_URL}/admin/post/edit/${post.postId}" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span> Edit</a>
    <a href="${SITE_URL}/admin/post" class="btn btn-danger"><span class="glyphicon glyphicon-circle-arrow-left"></span> Back</a>
</div>
<%@include file="../footer.jsp" %>