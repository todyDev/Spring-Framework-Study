<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="/WEB-INF/views/include/00_head.jsp" %>
<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">
    
        <!-- Main Header -->
		<%@ include file="/WEB-INF/views/include/10_header.jsp" %>
		
        <!-- Left side column. contains the logo and sidebar -->
		<%@ include file="/WEB-INF/views/include/40_leftSideMenu.jsp" %>
    
            <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    Access Denied Page
                </h1>
                <ol class="breadcrumb">
                    <li class="active"><a href="#"><i class="fa fa-dashboard"></i> 403 error</a></li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="error-page">
                    <h2 class="headline text-yellow"> 403</h2>

                    <div class="error-content">
                        <h3><i class="fa fa-warning text-yellow"></i> 앗! 접근 불가한 페이지입니다!</h3>

                        <p>
                            회원님의 등급으로는 접근할 수 없는 페이지입니다.
                            등급을 올리시거나 <a href="#">회원 가입</a>을 해주세요. 감사합니다.
                        </p>

                        <form class="search-form">
                            <div class="input-group">
                                <input type="text" name="search" class="form-control" placeholder="Search">

                                <div class="input-group-btn">
                                    <button type="submit" name="submit" class="btn btn-warning btn-flat"><i class="fa fa-search"></i>
                                    </button>
                                </div>
                            </div>
                            <!-- /.input-group -->
                        </form>
                    </div>
                    <!-- /.error-content -->
                </div>
                <!-- /.error-page -->
            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->
        
        <!-- Main Footer -->
		<%@ include file="/WEB-INF/views/include/70_footer.jsp" %>
    </div>
    
	<%@ include file="/WEB-INF/views/include/01_plugins.jsp" %>
	
</body>
</html>