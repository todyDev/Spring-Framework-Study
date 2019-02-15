<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<%@ include file="/WEB-INF/views/include/00_head.jsp" %>
</head>
<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

        <!-- Main Header -->
		<%@ include file="/WEB-INF/views/include/10_header.jsp" %>
		
        <!-- Left side column. contains the logo and sidebar -->
		<%@ include file="/WEB-INF/views/include/40_leftSideMenu.jsp" %>


        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    게시판
                    <small>게시글 작성</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-hand-peace-o"></i> 게시판</a></li>
                    <li class="active">게시글 작성</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content container-fluid">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Board Write</h3>
                    </div>
                    <!-- /.box-header -->
                    <form action='<c:url value="/reply/boardWrite"/>' method="POST">
	                    <div class="box-body">
	                        <div class="form-group">
	                            <input class="form-control" placeholder="Writer:" name="CREA_ID" value="<sec:authentication property="principal.username"/>" readonly>
	                        </div>
	                        <div class="form-group">
	                            <input class="form-control" placeholder="Subject:" name="TITLE">
	                        </div>
	                        <div class="form-group">
	                            <textarea id="compose-textarea" class="form-control" style="height: 300px" name="CONTENTS"></textarea>
	                        </div>
	                    </div>
	                    <!-- /.box-body -->
	                    <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
	                    <div class="box-footer">
	                        <div class="pull-right">
	                            <button type="submit" class="btn btn-primary"><i class="fa fa-envelope-o"></i> Write</button>
	                            <button type="reset" class="btn btn-default"><i class="fa fa-times"></i> Cancel</button>
	                        </div>
	                    </div>
	                    <!-- /.box-footer -->
                    </form>
                </div>
                <!-- /. box -->
            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->

        <!-- Main Footer -->
		<%@ include file="/WEB-INF/views/include/70_footer.jsp" %>

    </div>
    <!-- ./wrapper -->
    
	<%@ include file="/WEB-INF/views/include/01_plugins.jsp" %>

</body>

</html>