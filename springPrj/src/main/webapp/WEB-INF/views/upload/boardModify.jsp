<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<%@ include file="/WEB-INF/views/include/00_head.jsp" %>
<style type="text/css">
.file_input {float:left}
.file_name {float:left; padding-right:5px}
</style>
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
                    <small>게시글 수정</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-hand-peace-o"></i> 게시판</a></li>
                    <li class="active">게시글 수정</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content container-fluid">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Board Modify</h3>
                    </div>
                    <!-- /.box-header -->
                    <form action='<c:url value="/upload/boardModify?${_csrf.parameterName}=${_csrf.token}"/>' method="POST" enctype="multipart/form-data">
	                    <div class="box-body">
	                        <div class="form-group">
	                            <input class="form-control" placeholder="Writer:" name="CREA_ID" value="${detail.CREA_ID }" readonly>
	                        </div>
	                        <div class="form-group">
	                            <input class="form-control" placeholder="Subject:" name="TITLE" value="${detail.TITLE }">
	                        </div>
	                        <div class="form-group">
	                            <textarea id="compose-textarea" class="form-control" style="height: 300px" name="CONTENTS">${detail.CONTENTS }</textarea>
	                        </div>
	                        <div class="box-footer" id="fileDiv">
	                            <a href="#this" class="btn btn-default file_add" onclick="addFile()">파일추가</a><br/><br/>
	                            <c:forEach items="${list }" var="bList" varStatus="var">
	                            	<p>
	                            	<input type="hidden" name="IDX_${var.index }" value="${bList.IDX }"/>
	                            	<a href="#this" class="file_name" name="file_${var.index }">${bList.ORG_FILE_NAME }</a>
	                            	<input type="file" name="file" class="file_input">
	                            	<a href="#this" class="btn" name="delete">삭제</a>
	                            	</p>
	                           </c:forEach>
	                        </div>
	                    </div>
	                    <!-- /.box-body -->
	                    <input type="hidden" name="IDX" value="${detail.IDX }">
	                    <input type="hidden" name="page" value="${cri.page }">
	                    <input type="hidden" name="perPageNum" value="${cri.perPageNum }">
	                    <div class="box-footer">
	                        <div class="pull-right">
	                            <button type="submit" class="btn btn-primary"><i class="fa fa-envelope-o"></i> 수정하기</button>
	                            <a href="#" role="button" class="btn btn-default"><i class="fa fa-times"></i> 취소하기</a>
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
	<script type="text/javascript">
		var gfv_count = 1;
		$(document).ready(function(){
            $("a[name='delete']").on("click", function(e){
                e.preventDefault();
                deleteFile($(this));
            });
		})
		function addFile() {
			var str = "<p><input type='file' name='file' class='file_input'><a href='#this' class='btn' name='delete'>삭제</a></p>";
			$("#fileDiv").append(str);
			 $("a[name='delete']").on("click", function(e){
	                e.preventDefault();
	                deleteFile($(this));
	            });
		}
		function deleteFile(obj) {
			obj.parent().remove();
		}
	</script>
	
</body>

</html>