<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="SITE_URL" value="${pageContext.request.contextPath}"/>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <title>Home | Helping-Hands</title>
        <script type="text/javascript">
            var check = function () {
                if (document.getElementById('password1').value === document.getElementById('password').value)
                {
                    document.getElementById('password1').style.color = 'green';
                    document.getElementById('password').style.color = 'green';
                } else {
                    document.getElementById('password1').style.color = 'red';
                    document.getElementById('password').style.color = 'red';
                }
            }
        </script>
    </head>
    <body>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="${SITE_URL}" style="font-size: 30px; font-family: cursive"> Helping-Hands</a>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="${SITE_URL}/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                </ul>
            </div>
        </nav>
        <br/><br/>
        <div class="container">
            <div class="row">
                <c:if test="${param.error==null}">
                    <h4><p class="text-center" style="color: #009900"> ${msg}</p></h4>
                </c:if>
                <br/>
                <div class="col-md-6">
                    <br/><br/><br/>
                    <p style="font-size: 18px; font-family: cursive">“You have not lived today until you have done something for someone who can never repay you.” 
                        ― John Bunyan</p>
                    <br/><br/>
                    <p style="font-size: 18px; font-family: cursive">“He has a right to criticize, who has a heart to help. ”    
                        ― Abraham Lincoln</p>
                    <br/><br/>
                    <p style="font-size: 18px; font-family: cursive">“Stand up for someone who is in need 
                        so that it will build confidence in you 
                        to stand up for yourself at times when required...” 
                        ― Adil Adam Memon</p>
                    <br/><br/>
                    <p style="font-size: 18px; font-family: cursive">“Feel the ecstasy of giving. Not many have got the ability to enjoy and embrace the beauty and satisfaction of giving. Because people are too busy in earning and owning. You know...!” 
                        ― Lukhman Pambra</p>
                </div>
                <div class="col-md-6">
                    <h2>Sign Up </h2>
                    <hr class="colorgraph">
                    <form name="register" method="post" action="${SITE_URL}/user/register" onsubmit="return matchpass();">
                        <div class="row">
                            <div class="col-xs-12 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <input type="text" name="firstName" id="firstName" class="form-control input-lg" placeholder="First Name" required="required">
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <input type="text" name="lastName" id="last_name" class="form-control input-lg" placeholder="Last Name" required="required">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="email" name="email" id="email" class="form-control input-lg" placeholder="Email Address" required="required" >
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-5 col-md-5">
                                <div class="form-group">
                                    <input type="text" name="mobileNo" id="mobileNo" class="form-control input-lg" placeholder="Contact No" required="required">
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-7 col-md-7">
                                <div class="form-group">
                                    <input type="text" name="currentAddress" id="currentAddress" class="form-control input-lg" placeholder="Current Address" required="required">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-5 col-md-12">
                                <div class="form-group">
                                    <input type="text" name="username" id="username" class="form-control input-lg" placeholder="Username" required="required">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-4 col-md-6">
                                <div class="form-group">
                                    <input type="password" name="passwordTest" id="password1" class="form-control input-lg" placeholder="Password" onkeyup='check();' required="required">
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-5 col-md-6">
                                <div class="form-group">
                                    <input type="password" name="password" id="password" class="form-control input-lg" placeholder="Confirm Password" onkeyup='check();' required="required">
                                </div>
                                <span id='message'></span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <select class="form-control" name="bloodGroup" required> 
                                        <option value="">Select Blood-Group</option>
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
                            <div class="col-xs-12 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <select class="form-control" name="gender" required>
                                        <option value="">Select Gender</option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                        <option value="Other">Other</option>
                                    </select> 
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-4 col-sm-3 col-md-3">
                                <input type="checkbox" name="t_and_c" id="t_and_c"  value="1" required="required"> Agree
                            </div>
                            <div class="col-xs-8 col-sm-9 col-md-9">
                                By clicking <strong class="label label-primary">Register</strong>, you agree to the <a href="#" data-toggle="modal" data-target="#t_and_c_m">Terms and Conditions</a> set out by this site, including our Cookie Use.
                            </div>
                        </div>

                        <hr class="colorgraph">
                        <div class="row">
                            <input type="hidden" name="role" value="ROLE_USER"/>
                            <input type="hidden" name="status" value="1"/>
                            <div class="col-xs-12 col-md-6"><input type="submit" value="Register" class="btn btn-primary btn-block btn-lg" tabindex="7"></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>  
    </body>
</html>