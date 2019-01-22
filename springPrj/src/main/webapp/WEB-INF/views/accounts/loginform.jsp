<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/views/include/00_head.jsp" %>
<!-- iCheck -->
<link rel="stylesheet" href='<c:url value='/plugins/iCheck/square/blue.css'/>'>
<title>로그인 | todyDev</title>
</head>
<body class="hold-transition login-page">
    <div class="login-box">
        <div class="login-logo">
            <a href="#"><b>tody</b>Dev</a>
        </div>
        <!-- /.login-logo -->
        <div class="login-box-body">
            <p class="login-box-msg">Sign in to start your session</p>

            <form action='<c:url value="/login"/>' method="post">
                <div class="form-group has-feedback">
                    <input type="text" class="form-control" placeholder="ID" name="username" value="${username }">
                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" class="form-control" placeholder="Password" name="password" value="${password }">
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <c:if test="${not empty errormsg }">
                	<font color="red">
                		<p>${errormsg }</p>
                	</font>
                </c:if>
                <div class="row">
                    <div class="col-xs-8">
                        <div class="checkbox icheck">
                            <label>
                                <input type="checkbox"> Remember Me
                            </label>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-xs-4">
                    	<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
                        <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
                    </div>
                    <!-- /.col -->
                </div>
            </form>

            <div class="social-auth-links text-center">
                <p>- OR -</p>
                <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using
                    Facebook</a>
                <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using
                    Google+</a>
            </div>
            <!-- /.social-auth-links -->

            <a href="#">I forgot my password</a><br>
            <a href="#" class="text-center">Register a new membership</a>

        </div>
        <!-- /.login-box-body -->
    </div>
    <!-- /.login-box -->
    
    <%@ include file="/WEB-INF/views/include/01_plugins.jsp" %>
	<script src='<c:url value='/plugins/iCheck/icheck.min.js'/>'></script>
    <script>
        $(function() {
            $('input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });
        });
    </script>
    
</body>
</html>