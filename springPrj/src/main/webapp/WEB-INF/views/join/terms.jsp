<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/views/include/00_head.jsp" %>
<title>약관 동의 | todyDev 회원 가입</title>
</head>
<body class="hold-transition register-page">
    <div class="register-box" style="width: 430px; margin: 5% auto">
        <div class="register-logo">
            <a href="#"><b>tody</b>Dev</a>
        </div>

        <div class="register-box-body">
            <p class="login-box-msg" style="font-size: 20px">회원 가입 약관 동의</p>
            <p class="login-box-msg">서비스 약관 및 개인정보 수집, 이용에 동의해 주세요.</p>

            <div class="box">
                <div class="box-header">
                    서비스 약관 동의
                </div>
                <div class="box-body" style="height: 150px; overflow: auto; padding: 0 18px; font-size: 12px;">
                </div>
            </div>
            <!-- /.box -->
            <div class="box">
                <div class="box-header">
                    개인정보 수집 및 이용 동의
                </div>
                <div class="box-body" style="height: 150px; overflow: auto; padding: 0 18px; font-size: 12px;">
                </div>
            </div>
            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox iCheck" style="margin-top: 5px; margin-bottom: 5px">
                        <label>
                            <input type="checkbox"> 약관에 모두 동의합니다.
                        </label>
                    </div>
                </div>
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">다음 단계</button>
                </div>
            </div>
        </div>
        <!-- /.form-box -->
    </div>
    <!-- /.register-box -->

	<%@ include file="/WEB-INF/views/include/01_plugins.jsp" %>
    <script>
        $(function() {
            $('input').iCheck({
                checkboxClass: 'iCheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%'
            });
        });
    </script>
</body>
</html>