<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/views/include/00_head.jsp" %>
<title>가입 정보 입력 | todyDev 회원 가입</title>
</head>
<body class="hold-transition register-page">
    <div class="register-box" style="width: 430px; margin: 5% auto">
        <div class="register-logo">
            <a href="#"><b>tody</b>Dev</a>
        </div>

        <div class="register-box-body">
            <p class="login-box-msg" style="font-size: 20px">가입 정보 입력</p>
            <p class="login-box-msg">로그인 정보 및 가입 정보를 입력하세요.</p>

            <form action='<c:url value='/join/signup'/>' method="post">
                <div class="form-group has-feedback">
                    <input type="text" class="form-control" placeholder="ID">
                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" class="form-control" placeholder="PASSWORD">
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" class="form-control" placeholder="Retype PASSWORD">
                    <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
                </div>
                <div class="text-center">
                	<p>-<p>
                </div>
                <div class="form-group has-feedback">
                    <input type="text" class="form-control" placeholder="NAME">
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="text" class="form-control" placeholder="PHONE">
                    <span class="glyphicon glyphicon-th form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="text" class="form-control" placeholder="EMAIL">
                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                </div>
                <div class="row">
                    <div class="col-xs-4">
                    </div>
                    <!-- /.col -->
                    <div class="col-xs-4">
                        <button type="submit" class="btn btn-primary btn-block btn-flat">Register</button>
                    </div>
                    <!-- /.col -->
                </div>
            </form>
            <div class="social-auth-links text-center">
                <p>- OR -<p>
            </div>
            <a href="#">I already have a membership</a>
        </div>
        <!-- /.form-box -->
    </div>
    <!-- /.register-box -->

    <%@ include file="/WEB-INF/views/include/01_plugins.jsp" %>
    
</body>
</html>