<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

            <form:form action="${pageContext.request.contextPath}/join/signup" method="post" commandName="registerRequest">
                <div class="form-group has-feedback">
                    <form:input type="text" class="form-control" placeholder="ID" path="ID"/>
                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    <form:errors path="ID" style="color:red"/>
                </div>
                <div class="form-group has-feedback">
                    <form:input type="password" class="form-control" placeholder="PASSWORD" path="PASSWORD"/>
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    <form:errors path="PASSWORD" style="color:red"/>
                </div>
                <div class="form-group has-feedback">
                    <form:input type="password" class="form-control" placeholder="Retype PASSWORD" path="chkPASSWORD"/>
                    <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
                    <form:errors path="chkPASSWORD" style="color:red"/>
                </div>
                <div class="text-center">
                	<p>-<p>
                </div>
                <div class="form-group has-feedback">
                    <form:input type="text" class="form-control" placeholder="NAME" path="NAME"/>
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                    <form:errors path="NAME" style="color:red"/>
                </div>
                <div class="form-group has-feedback">
                    <form:input type="text" class="form-control" placeholder="PHONE" path="PHONE"/>
                    <span class="glyphicon glyphicon-th form-control-feedback"></span>
                    <form:errors path="PHONE" style="color:red"/>
                </div>
                <div class="form-group has-feedback">
                    <form:input type="text" class="form-control" placeholder="EMAIL" path="EMAIL"/>
                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    <form:errors path="EMAIL" style="color:red"/>
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
            </form:form>
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