<%@include file="../header.jsp" %>
<%@include file="../navbar.jsp" %>
<div class="container">
    <h3>Update User Profile</h3>
    <br/>
    <form method="post" action="${SITE_URL}/admin/user/save">
        <div>
            <div class="col-md-4">
                <div class="form-group">                      
                    <label>First Name</label>
                    <input type="text" class="form-control" placeholder="Please enter your first name." name="firstName" value="${user.firstName}"/>
                </div>
                <div class="form-group">  
                    <label>Last Name</label>
                    <input type="text" class="form-control" placeholder="Please enter your last name." name="lastName" value="${user.lastName}"/>
                </div>
                <div class="form-group">
                    <label>Gender</label>
                    <select class="form-control" name="gender">
                        <option value="${user.gender}">${user.gender}</option>
                        <option>Select Gender</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select> 
                </div>
                <div class="form-group">
                    <label>Email</label> 
                    <input type="email" class="form-control" placeholder="Please enter your email." name="email" value="${user.email}"/>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label>Contact No</label> 
                    <input type="text" class="form-control" placeholder="Please enter your Contact number." name="mobileNo" value="${user.mobileNo}"/>
                </div>
                <div class="form-group">  
                    <label>Current Address</label>
                    <input type="text" class="form-control" placeholder="Please enter your current address." name="currentAddress" value="${user.currentAddress}"/>
                </div>
                <div class="form-group">  
                    <label>Permanent Address</label>
                    <input type="text" class="form-control" placeholder="Please enter your permanent address." name="permanentAddress" value="${user.permanentAddress}"/>
                </div>
                <div class="form-group">
                    <label>Blood Group</label> 
                    <select class="form-control" name="bloodGroup" > 
                        <option value="${user.bloodGroup}">${user.bloodGroup}</option>
                        <option>Select Blood-Group</option>
                        <option value="A+">A+ (A Positive)</option>
                        <option value="A-">A- (A Negative)</option>
                        <option value="B+">B+ (B Positive)</option>
                        <option value="B-">B- (B Negative)</option>
                        <option value="AB+">AB+ (AB Positive)</option>
                        <option value="AB-">AB- (AB Negative)</option>
                        <option value="O+">O+ (O Positive)</option>
                        <option value="O-">O- (O Negative)</option>
                    </select> 
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">                      
                    <label>Username</label>
                    <input type="text" class="form-control" placeholder="Please enter unique username." name="username" value="${user.username}"/>
                </div>
                <div class="form-group">  
                    <label>Password</label>
                    <input type="text" class="form-control" placeholder="Please enter password." name="password" value="${user.password}"/>
                </div>
                <div class="form-group">  
                    <label>Added Date</label>
                    <p>${user.addedDate}</p>
                </div>
                <div class="form-group">
                    <label>Select Role</label>
                    <select class="form-control" name="role"> 
                        <option value="${user.role}">${user.role}</option>
                        <option>Select Role</option>
                        <option value="ROLE_USER">ROLE_USER</option>
                        <option value="ROLE_ADMIN">ROLE_ADMIN</option>
                    </select> 
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-group">                      
                    <label>Interest</label>
                    <textarea name="interest" placeholder="Anything you are interested on."class="form-control" required="required"/>${user.interest}</textarea>
                </div>
                <div class="checkbox">
                    <label>Status</label>
                    <label><input type="checkbox" name="status" <c:if test="${user.status}">checked="checked"</c:if>>Active</label>
                    </div>
                    <input type="hidden" name="userId" value="${user.userId}"/>
                <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-save"></span> Save</button>
                <a href="${SITE_URL}/admin/user" class="btn btn-danger"><span class="glyphicon glyphicon-circle-arrow-left"></span> Back</a>
            </div>
        </div>
    </form>
</div>

<%@include file="../footer.jsp" %>