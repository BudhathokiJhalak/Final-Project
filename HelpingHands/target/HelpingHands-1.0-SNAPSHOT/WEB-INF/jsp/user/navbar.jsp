<nav class="navbar navbar-default navbar-fixed-top" >
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${SITE_URL}/home" style="font-size: 25px; font-family: cursive">Helping-Hands</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <form class="navbar-form navbar-left" method="post" action="${SITE_URL}/home/post/search">
                <div class="input-group">
                    <input type="text" class="form-control" name="keyword" placeholder="Search" required="required">
                    <div class="input-group-btn">
                        <button class="btn btn-default" type="submit">Search</button>
                    </div>
                </div>
            </form>
            <li class = "dropdown">
                <a class = "dropdown-toggle" data-toggle = "dropdown" href = "#menu1">
                    <span class = "glyphicon glyphicon-circle-arrow-down"></span>
                </a>
                <ul class = "dropdown-menu">
                    <li><a href = "${SITE_URL}/home/profile/${loggedUser.userId}" ><span class="glyphicon glyphicon-user"></span> ${loggedUser.username}</a></li>
                    <li class = "divider"></li>
                    <li><a href="${SITE_URL}/home/logout" onclick="return confirm('Are you sure to Logout?')"><span class="glyphicon glyphicon-off"></span> Logout</a></li>
                </ul>
            </li>
        </ul>       
    </div>
</nav>