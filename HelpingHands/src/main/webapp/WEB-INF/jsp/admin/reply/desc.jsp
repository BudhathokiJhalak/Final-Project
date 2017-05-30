<%@include file="../header.jsp" %>
<%@include file="../navbar.jsp" %>
<div class="container">
    <h3>Description about Reply</h3><br/>
    <table>
        <p><label>Reply ID:</label> ${reply.replyId}</p>
        <p><label>Post:</label> ${reply.postId.description}</p>
        <p><label>Reply:</label> ${reply.description}</p>
        <p><label>Added Date:</label> ${reply.addedDate}</p>
        <p><label>Post ID:</label> ${reply.postId.postId}</p>
        <p><label>Posted By(ID):</label> ${reply.postId.userId.userId}</p>
        <p><label>Posted By(Name):</label> ${reply.postId.userId.firstName} ${reply.postId.userId.lastName}</p>
        <p><label>Replied By(ID):</label> ${reply.userId.userId}</p>
        <p><label>Replied By(Name):</label> ${reply.userId.firstName} ${reply.userId.lastName}</p>
    </table>
    <a href="${SITE_URL}/admin/reply/edit/${reply.replyId}" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span> Edit</a>
    <a href="${SITE_URL}/admin/reply" class="btn btn-danger"><span class="glyphicon glyphicon-circle-arrow-left"></span> Back</a>
</div>
<%@include file="../footer.jsp" %>