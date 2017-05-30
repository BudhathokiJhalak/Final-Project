<%@include file="../header.jsp" %>
<%@include file="../navbar.jsp" %>
<div class="container">
    <h3>Edit Reply</h3><br/>
    <form method="post" action="${SITE_URL}/admin/reply/save">
        <div class="col-md-12">
            <div class="form-group">
                <label>Post Description</label><br/>
                <p>${reply.postId.description}</p>
            </div>
        </div>
        <div class="col-md-12">
            <div class="form-group">
                <label>Reply Description</label>
                <textarea name="description" placeholder="Answer the question?"class="form-control" required="required"/>${reply.description}</textarea>
            </div>
        </div>
        <div class="col-md-12">
            <div class="form-group">
                <p><label>Post ID:</label> ${reply.postId.postId}</p>
                <input type="hidden" class="form-control" name="postId.postId" value="${reply.postId.postId}"/>
                <p><label>Posted By(ID)</label> ${reply.postId.userId.userId}</p>
                <p><label>Posted By(Name)</label> ${reply.postId.userId.firstName} ${reply.postId.userId.lastName}</p>
                <p><label>Replied By(ID)</label> ${reply.userId.userId}</p>
                <input type="hidden" class="form-control" name="userId.userId" value="${reply.userId.userId}"/>
                <p><label>Replied By(Name)</label> ${reply.userId.firstName} ${reply.userId.lastName}</p>
                <p><label>Added Date</label> ${reply.addedDate}</p>
            </div>
        </div>
        <div class="col-md-2">
            <input type="hidden" name="replyId" value="${reply.replyId}"/>
            <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-save"></span> Save</button>
            <a href="${SITE_URL}/admin/reply" class="btn btn-danger"><span class="glyphicon glyphicon-circle-arrow-left"></span> Back</a>
        </div>
    </form>
</div>
<%@include file="../footer.jsp" %>