<%@include file="../header.jsp" %>
<%@include file="../navbar.jsp" %>
<div class="container">
    <h3>Update Post</h3><br/>
    <form method="post" action="${SITE_URL}/admin/post/save">
        <div class="col-md-12">
            <div class="form-group">
                <label>Post Description</label>
                <textarea name="description" placeholder="Ask any question?"class="form-control" required="required"/>${post.description}</textarea>
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group">
                <label>Posted By (ID)</label><br/>
                <p>${post.userId.userId}</p>
                <input type="hidden" name="userId.userId" value="${post.userId.userId}"/>
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <label>Posted By (Name)</label><br/>
                <p>${post.userId.firstName} ${post.userId.lastName}</p>
            </div>
        </div>
        <div class="col-md-5">
            <div class="form-group">
                <label>Added Date</label><br/>
                <p>${post.addedDate}</p>
            </div>
        </div>
        <div class="col-md-2">
            <input type="hidden" name="postId" value="${post.postId}"/>
            <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-save"></span> Save</button>
            <a href="${SITE_URL}/admin/post" class="btn btn-danger"><span class="glyphicon glyphicon-circle-arrow-left"></span> Back</a>
        </div>
    </form>
</div>
<%@include file="../footer.jsp" %>