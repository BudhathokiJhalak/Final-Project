<%@include file="../header.jsp" %>
<%@include file="../navbar.jsp" %>
<div class="container">
    <form method="post" action="${SITE_URL}/admin/mail-address/save">
        <h3>Add Mail Address</h3>
        <div class="form-group col-md-6">
            <label>Mail Address</label>
            <input type="email" class="form-control" name="email" placeholder="Enter Mail Address" required="required"/>
            <br/>
            <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-save"></span> Save</button>
            <a href="${SITE_URL}/admin/mail-address" class="btn btn-danger"><span class="glyphicon glyphicon-circle-arrow-left"></span> Back</a>
        </div>
        <div class="col-md-6">
        </div>
    </form>
</div>
<%@include file="../footer.jsp" %>