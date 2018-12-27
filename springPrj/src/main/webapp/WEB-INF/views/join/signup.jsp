<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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

            <form action="${pageContext.request.contextPath}/join/signup" method="post">
                <div class="form-group has-feedback">
                    <input type="text" class="form-control" placeholder="ID" name="id" id="id"/>
                    <span class="glyphicon glyphicon-envelope form-control-feedback" style="top: -0px"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" class="form-control" placeholder="PASSWORD" name="pw" id="pw"/>
                    <span class="glyphicon glyphicon-lock form-control-feedback" style="top: -0px"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" class="form-control" placeholder="Retype PASSWORD" name="pwRe" id="pwRe"/>
                    <span class="glyphicon glyphicon-log-in form-control-feedback" style="top: -0px"></span>
                </div>
                <div class="text-center">
                	<p>-<p>
                </div>
                <div class="form-group has-feedback">
                    <input type="text" class="form-control" placeholder="NAME" name="name" id="name"/>
                    <span class="glyphicon glyphicon-user form-control-feedback" style="top: -0px"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="text" class="form-control" placeholder="PHONE" name="phone" id="phone"/>
                    <span class="glyphicon glyphicon-th form-control-feedback" style="top: -0px"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="text" class="form-control" placeholder="EMAIL" name="email" id="email"/>
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
    <script>
    	var dupidck; //true: 중복, false: 가능
    	var dupemailck; //true: 중복, false: 가능
    	$(function(){
    		$("#id").blur(function(){
    			var id = $("#id").val();
    			if(!id) return false;
    			$.ajax({
    				async: true,
    				type: 'POST',
    				data: id,
    				url: "${pageContext.request.contextPath}/join/chkidinfo",
    				dataType: "json",
    				contentType: "application/json; charset=UTF-8",
    				success: function(data) {
    					if(data) {
    						dupidck=true;
    					    alert('중복된 아이디입니다.');
    					} else dupidck=false;
    				},
    				error: function(request,status,error) {
    					alert('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
    				}
    			});
    		});
    		$("form").validate({
    			submitHandler: function() {
    				if(dupidck || dupemailck) return false;
    				else return true;
    			},
    			rules: {
    				id: {
    					required: true,
    					idChk: true,
    					minlength: 3,
    					maxlength: 13
    					
    				},
    				pw: {
    					required: true,
    					pwChk: true,
    					minlength: 9,
    					maxlength: 12
    					
    				},
    				pwRe: {
    					required: true,
    					pwEqualChk: pw
    					
    				},
    				name: {
    					required: true,
    					nameChk: true
    				},
    				email: {
    					email: true
    					
    				},
    				phone: {
    					phoneChk: true
    					
    				}
    			}
    		});
    		$("#email").blur(function(){
    			var email = $("#email").val();
    			if(!email) return false;
    			$.ajax({
    				async: true,
    				type: 'POST',
    				data: email,
    				url: "${pageContext.request.contextPath}/join/chkemailinfo",
    				dataType: "json",
    				contentType: "application/json; charset=UTF-8",
    				success: function(data) {
    					if(data) {
    						dupemailck=true;
    					    alert('중복된 이메일입니다.');
    					} else dupemailck=false;
    				},
    				error: function(request,status,error) {
    					alert('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
    				}
    			});
    		});
    	});
    </script>
    
</body>
</html>