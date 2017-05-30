<%@include file="header.jsp" %>
<%@include file="navbar.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <div class="col-md-12">
                <form method="post" action="${SITE_URL}/home/post/save">
                    <div class="form-group">
                        <p style="text-align: center"><label>Description</label></p>
                        <hr class="arrow">
                        <textarea class="form-control" name="description" placeholder="Please Reply">${post.description}</textarea>
                        <hr/>
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <input type="hidden" name="postId" value="${post.postId}"/>
                            <input type="hidden" name="userId.userId" value="${loggedUser.userId}"/>
                            <button type="submit" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-arrow-up"></span> Save</button>
                            <a href="${SITE_URL}/home/profile/${loggedUser.userId}" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-circle-arrow-left"></span> Back</a>
                        </div>
                        <div class="col-md-4"></div>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-3"></div>
    </div> <!-- end of row 1 --->
</div>
<%@include file="footer.jsp" %>