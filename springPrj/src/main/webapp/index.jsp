<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<%@ include file="WEB-INF/views/include/00_head.jsp" %>
</head>
<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

        <!-- Main Header -->
		<%@ include file="WEB-INF/views/include/10_header.jsp" %>
		
        <!-- Left side column. contains the logo and sidebar -->
		<%@ include file="WEB-INF/views/include/40_leftSideMenu.jsp" %>


        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    Main Index
                    <small>메인페이지 입니다. :)</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-hand-peace-o"></i> Main</a></li>
                    <li class="active">index</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content container-fluid">



            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->

        <!-- Main Footer -->
		<%@ include file="WEB-INF/views/include/70_footer.jsp" %>

    </div>
    <!-- ./wrapper -->
    
	<%@ include file="WEB-INF/views/include/01_plugins.jsp" %>

</body>

</html>