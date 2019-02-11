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
                    <small>게시글 상세</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-hand-peace-o"></i> 게시판</a></li>
                    <li class="active">게시글 상세</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content container-fluid">
                <div class="col-md-9">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Board Detail</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body no-padding">
                            <div class="mailbox-read-info">
                                <h3>${detail.TITLE }</h3>
                                <h5 class="mailbox-read-time">${detail.CREA_ID } · 조회수 ${detail.HIT_CNT } · ${detail.CREA_DATE }</h5>
                            </div>
                            <!-- /.mailbox-controls -->
                            <div class="mailbox-read-message">
                                <p>${detail.CONTENTS }</p>
                            </div>
                            <!-- /.mailbox-read-message -->
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                        	<a href='<c:url value="/reply/boardList?page=${cri.page }&perPageNum=${cri.perPageNum }"/>' role="button" class="btn btn-default"><i class="fa fa-list"></i> 목록으로</a>
                        	<sec:authorize access="isAuthenticated()">
                        	<sec:authentication property="principal.username" var="crea_id"/>
                        	<c:if test="${detail.CREA_ID eq crea_id }">
                            <div class="pull-right">
                                <a href='<c:url value="/reply/boardModify?IDX=${detail.ARTICLE_NO }&page=${cri.page }&perPageNum=${cri.perPageNum }"/>' role="button" class="btn btn-default"><i class="fa fa-reply"></i> 수정</a>
                                <a href='<c:url value="/reply/boardDelete?IDX=${detail.ARTICLE_NO }&page=${cri.page }&perPageNum=${cri.perPageNum }"/>' role="button" class="btn btn-default"><i class="fa fa-trash-o"></i> 삭제</a>
                            </div>
                            </c:if>
                            </sec:authorize>
                        </div>
                        <!-- /.box-footer -->
                        <div class="box-footer box-comments" id="comments">
                        </div>
                        <!-- /.box-footer -->
                        <div class="box-footer">
                            <form action="#" method="post" id="commentForm" onsubmit="return false;">
                                <img class="img-responsive img-circle img-sm" src="../dist/img/user4-128x128.jpg" alt="Alt Text">
                                <!-- .img-push is used to add margin to elements next to floating images -->
                                <div class="img-push">
                                    <input type="text" name="comments" class="form-control input-sm" placeholder="Press enter to post comment" onkeypress="commentSubmit();">
                                </div>
                            </form>
                        </div>
                        <!-- /.box-footer -->
                    </div>
                    <!-- /. box -->
                </div>
                <!-- /.col -->
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
		$(document).ready(function(){
			replyList();
		});
		function replyList() {
			var articleNo = ${detail.ARTICLE_NO}
			$.ajax({
				async: true,
				type: 'GET',
				url: "${pageContext.request.contextPath}/comment/list?articleNo=${detail.ARTICLE_NO }",
				dataType: "JSON",
				success: function(data) {
					console.log(data);
					console.log(data.length);
					var ln = data.length;
					var commentTable = "";
					if(data.length != 0) {
						for(var i in data) {
							commentTable +="<div class='box-comment'>"
								+ "<img class='img-circle img-sm' src="+"'../dist/img/user3-128x128.jpg'"+"alt='User Image'>"
								+ "<div class='comment-text'><span class='username'>" + data[i].WRITER
								+ "<span class='text-muted pull-right'>" + data[i].REG_DATE
								+ "</span></span>" + data[i].COMMENT + "</div></div>";
						}
					} else {
						commentTable += "<span>등록된 댓글이 없습니다.</span>";
					}
					$("#comments").html(commentTable);
				},
				error: function(request,status,error) {
					alert('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
				}
			})
		}
		function commentSubmit() {
			if(event.keyCode==13) {
				var commentForm = $("#commentForm");
				var dataParams = commentForm.serialize();
				alert(dataParams);
				$.ajax({
					async: true,
					url: "${pageContext.request.contextPath}/comment/register",
					type: commentForm.attr('method'),
					data: dataParams,
    				beforeSend: function(xhr) {
    					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}")
    				},
					success: function(result) {
						alert("성공");
					},
					error: function(request,status,error) {
						alert('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
					}
				})
			} else {
				return false;
			}
		}
	</script>

</body>

</html>