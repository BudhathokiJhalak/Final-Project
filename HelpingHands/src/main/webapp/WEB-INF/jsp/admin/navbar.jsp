<nav class="navbar navbar-inverse" >
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${SITE_URL}/admin" style="font-size: 25px; font-family: cursive">Helping-Hands</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="${SITE_URL}/admin/user" <span class="glyphicon glyphicon-user"></span> User</a></li>
            <li><a href="${SITE_URL}/admin/post" <span class="glyphicon glyphicon-book"></span> Post</a></li>
            <li><a href="${SITE_URL}/admin/reply" <span class="glyphicon glyphicon-book"></span> Reply</a></li>
            <li class = "dropdown">
                <a class = "dropdown-toggle" data-toggle = "dropdown" href = "#menu1">
                    <span class = "glyphicon glyphicon-circle-arrow-down"></span>
                </a>
                <ul class = "dropdown-menu">
                    <li><a href = "${SITE_URL}/admin/profile/${loggedUser.userId}"><span class="glyphicon glyphicon-user"></span> ${loggedUser.username}</a></li>
                    <li><a href = "${SITE_URL}/admin/mail-address"><span class="glyphicon glyphicon-envelope"></span> Mail Address</a></li>
                    <li class = "divider"></li>
                    <li><a href="${SITE_URL}/admin/logout" onclick="return confirm('Are you sure to Logout?')"><span class="glyphicon glyphicon-off"></span> Logout</a></li>
                </ul>
            </li>
        </ul>       
    </div>
</nav>
        