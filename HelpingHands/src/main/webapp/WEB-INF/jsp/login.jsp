<%@include file="admin/header.jsp"%>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${SITE_URL}" style="font-size: 25px; font-family: cursive">  Helping-Hands</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="${SITE_URL}/"><span class="glyphicon glyphicon-plus-sign"></span> Register</a></li>
        </ul>
    </div>
</nav>
<div class="container">
    <div class="container">
        <h2><p class="text-center">Please Login</p></h2>
    </div>
    <div class="container">
        <c:if test="${param.error!=null}">
            <h4><p class="text-center" style="color: #ff0000"> ${error}</p></h4>
        </c:if>
        <c:if test="${param.logout!=null}">
            <h4><p class="text-center" style="color: #009900"> ${msg}</p></h4>
        </c:if>
    </div>


    <form class="form-horizontal" method="post">
        <div class="form-group">
            <label class="control-label col-sm-2">Email / Username:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="username" placeholder="Enter email or username" required="required">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2">Password:</label>
            <div class="col-sm-10"> 
                <input type="password" class="form-control" name="password" placeholder="Enter password" required="required">
            </div>
        </div>
        <div class="form-group"> 
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">Sign in</button>
            </div>
        </div>
    </form>

</div>
<%@include file="admin/footer.jsp" %>