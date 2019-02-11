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
                        <div class="box-footer box-comments" id="comments-table">
                        </div>
                        <div class="modal fade" id="modal-default">
                              <div class="modal-dialog">
                                  <div class="modal-content">
                                      <div class="modal-header">
                                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                              <span aria-hidden="true">&times;</span></button>
                                          <h4 class="modal-title">댓글 수정/삭제</h4>
                                      </div>
                                      <div class="modal-body">
                                              <div class="tab-content">
                                                  <sec:authorize access="isAnonymous()">
                                                  	<span>권한이 없습니다.</span>
                                                    <div style="margin-top: 30px; text-align: center">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                                                    </div>
                                                  </sec:authorize>
                                                  <sec:authorize access="isAuthenticated()">
                                                  <sec:authentication property="principal.username" var="username"/>
                                                      <img class="img-circle img-sm" src="../dist/img/user4-128x128.jpg" alt="User Image">
                                                      <span class="username" style="margin-left: 40px;display: block;font-weight: 600;">
                                                          Username
                                                      </span>
                                                      <div style="margin-top: 30px">
                                                          <form>
                                                              <textarea rows="9" class="form-control input-sm editComment"></textarea>
                                                          </form>
                                                      </div>
                                                      <div style="margin-top: 30px; text-align: center">
                                                      	<input type="hidden" id="replyId" class="replyId" value="">
                                                          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                                                          <button type="button" class="btn btn-primary">수정</button>
                                                          <button type="button" class="btn btn-danger pull-right">삭제</button>
                                                      </div>
                                                   </sec:authorize>
                                              </div>
                                              <!-- /.tab-content -->
                                      </div>
                                  </div>
                                  <!-- /.modal-content -->
                              </div>
                              <!-- /.modal-dialog -->
                          </div>
                          <!-- /.modal -->
                        <!-- /.box-footer -->
                        <sec:authorize access="isAnonymous()">
                        <div class="box-footer">
                            <form action="#" method="post" id="commentForm" onsubmit="return false;">
                                <img class="img-responsive img-circle img-sm" src="../dist/img/user4-128x128.jpg" alt="Alt Text">
                                <!-- .img-push is used to add margin to elements next to floating images -->
                                <div class="img-push">
                                    <input type="text" class="form-control input-sm" placeholder="로그인 후 이용해주세요." disabled>
                                </div>
                            </form>
                        </div>
                        <!-- /.box-footer -->
                        </sec:authorize>
                        <sec:authorize access="isAuthenticated()">
                        <div class="box-footer">
                            <form action="#" method="post" id="commentForm" onsubmit="return false;">
                                <img class="img-responsive img-circle img-sm" src="../dist/img/user4-128x128.jpg" alt="Alt Text">
                                <!-- .img-push is used to add margin to elements next to floating images -->
                                <div class="img-push">
                                	<input type="hidden" name="writer" value="commentTester">
                                	<input type="hidden" name="articleNo" value="${detail.ARTICLE_NO }">
                                    <input type="text" name="comments" id="comments" class="form-control input-sm" placeholder="Press enter to post comment" onkeypress="commentSubmit();">
                                </div>
                            </form>
                        </div>
                        <!-- /.box-footer -->
                        </sec:authorize>
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
			
            $('#modal-default').on('show.bs.modal', function(event) {
                var button = $(event.relatedTarget);
                var username = button.data('writer');
                var comment = button.data('comment');
                var modal = $(this);
                modal.find('.username').text(username);
                modal.find('.replyId').val(username);
                modal.find('.editComment').text(comment);
            });
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
								+ "<span data-toggle='modal' data-target='#modal-default' data-writer='" + data[i].WRITER
								+ "' data-comment='" + data[i].COMMENT
								+ "'><a href='#this'><i class='fa fa-fw fa-ellipsis-v'></i></a></span>"
								+ "</span></span>" + data[i].COMMENT + "</div></div>";
						}
					} else {
						commentTable += "<span>등록된 댓글이 없습니다.</span>";
					}
					$("#comments-table").html(commentTable);
				},
				error: function(request,status,error) {
					alert('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
				}
			})
		}
		function commentSubmit() {
			if(event.keyCode==13) {
				var commentForm = $("#commentForm");
				var commentsId = $("#comments");
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
						commentsId.val('');
						replyList();
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