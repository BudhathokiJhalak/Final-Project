<%@include file="header.jsp" %>
<%@include file="navbar.jsp" %>
<div class="container">
    <br/><br/><br/>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="form-group">
                <p><label style="font-size: 17px ;font-family: Magneto">${post.userId.firstName} ${post.userId.lastName}</label></p>
                <p style="font-size: 17px; font-family: Consolas">${post.description}</p>
                <p style="font-size: 17px; font-family: Microsoft Uighur">${post.addedDate}</p>
                <hr/>
                
                    <div class="col-md-12">

                        <div class="col-md-12">
                            <c:forEach var="reply" items="${replies}">
                            <p style="font-size: 17px; font-family: Consolas"><label style="font-size: 17px ;font-family: Magneto">${reply.userId.firstName} ${reply.userId.lastName}:</label> ${reply.description}</p>
                            <p style="font-size: 17px; font-family: Microsoft Uighur">${reply.addedDate}</p>
                            <hr/>
                        </c:forEach>
                        <form method="post" action="${SITE_URL}/home/reply/save">
                            <div class="form-group col-md-6">
                                <input class="form-control" type="text" name="description" required="required" placeholder="Please reply ..."/>
                                <input type="hidden" name="postId.postId" value="${post.postId}"/>
                                <input type="hidden" name="userId.userId" value="${loggedUser.userId}"/>
                            </div>
                            <div class="form-group col-md-6">
                                <button type="submit" class="btn btn-primary btn-sm"> Reply</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-2"></div>
    </div> <!-- end of row 1 -->
</div>  <!-- end of div class container -->
<%@include file="footer.jsp" %>