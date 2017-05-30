<%@include file="../header.jsp" %>
<%@include file="../navbar.jsp" %>
<div class="container">
    <form method="post" action="${SITE_URL}/admin/mail/send">
        <h2>Send Email</h2>
        <div class="col-md-12">
            <div class="col-md-3">
                <div class="form-group" > 
                    <label>To</label>
                    <input type="text" value="${user.email}" class="form-control"  name="to"/>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group" > 
                    <label>From</label>
                    <select class="form-control" name="from"> 
                        <option>Select Mail Address</option>
                        <c:forEach var="ma" items="${mailAddress}">
                            <option value="${ma.email}">${ma.email}</option>
                        </c:forEach>
                    </select> 
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group" > 
                    <label>ISP</label>
                    <select class="form-control" name="hostName"> 
                        <option>Select ISP</option>
                        <c:forEach var="isp" items="${isps}">
                            <option value="${isp.value}">${isp.ispName}</option>
                        </c:forEach>
                    </select> 
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="col-md-9">
                <div class="form-group">
                    <label>Subject</label>
                    <input type="text" name="subject" class="form-control" required="required"/>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="col-md-12">
                <div class="form-group">
                    <label>Message</label>
                    <textarea name="message" class="form-control" required="required"/></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Send</button>
                <a href="${SITE_URL}/admin/user" class="btn btn-danger">Discard</a>
            </div>
        </div>

    </form>
</div>
<%@include file="../footer.jsp" %>