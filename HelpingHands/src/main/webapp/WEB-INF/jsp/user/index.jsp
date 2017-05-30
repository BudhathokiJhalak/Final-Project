<%@include file="header.jsp" %>
<%@include file="navbar.jsp" %><br/><br/><br/>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">            
            <form method="post" action="${SITE_URL}/home/post/save">
                <div class="col-sm-10">
                    <div class="form-group">
                        <textarea name="description" class="form-control" placeholder="Ask any Question??" required="required"></textarea>
                        <hr class="colorgraph"/>
                    </div> 
                </div>
                <div class="col-md-2">
                    <input type="hidden" name="userId.userId" value="${loggedUser.userId}"/>
                    <button type="submit" class="btn btn-primary">Post</button>
                </div>
            </form>
        </div>
        <div class="col-md-2"></div>
    </div><!-- end of row 1 -->

    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="col-md-12">
                <c:forEach var="post" items="${posts}">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label style="font-size: 17px ;font-family: Magneto">${post.userId.firstName} ${post.userId.lastName}</label> 
                            <p style="font-size: 17px; font-family: Consolas">${post.description}</p>
                            <p style="font-size: 17px; font-family: Microsoft Uighur">${post.addedDate}</p>
                            <a href="${SITE_URL}/home/post/view/${post.postId}">View all replies</a><hr/>
                            <form method="post" action="${SITE_URL}/home/reply/save">
                                <div class="col-md-12">
                                    <div class="form-group col-md-6">
                                        <input class="form-control" type="text" name="description" required="required" placeholder="Please reply ..."/><hr/>
                                        <input type="hidden" name="postId.postId" value="${post.postId}"/>
                                        <input type="hidden" name="userId.userId" value="${loggedUser.userId}"/>
                                        <button type="submit" class="btn btn-primary btn-sm"> Reply</button>
                                        <a href="${SITE_URL}/home" class="btn btn-danger btn-sm">Discard</a>
                                    </div>
                                </div>
                            </form><hr/>
                        </div>
                    </div>
                    <hr/>
                </c:forEach>
            </div>
        </div>
        <div class="col-md-2"></div>
    </div><!--end of row 2-->
    <hr/>
</div>
<%@include file="footer.jsp" %>