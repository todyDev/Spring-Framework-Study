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
                                <a href='<c:url value="/reply/boardModify?IDX=${detail.IDX }&page=${cri.page }&perPageNum=${cri.perPageNum }"/>' role="button" class="btn btn-default"><i class="fa fa-reply"></i> 수정</a>
                                <a href='<c:url value="/reply/boardDelete?IDX=${detail.IDX }&page=${cri.page }&perPageNum=${cri.perPageNum }"/>' role="button" class="btn btn-default"><i class="fa fa-trash-o"></i> 삭제</a>
                            </div>
                            </c:if>
                            </sec:authorize>
                        </div>
                        <!-- /.box-footer -->
                        <div class="box-footer box-comments">
                            <c:forEach items="" var="">
                            <div class="box-comment">
                                <!-- User image -->
                                <img class="img-circle img-sm" src="../dist/img/user3-128x128.jpg" alt="User Image">

                                <div class="comment-text">
                                    <span class="username">
                                        Maria Gonzales
                                        <span class="text-muted pull-right">8:03 PM Today</span>
                                    </span><!-- /.username -->
                                    It is a long established fact that a reader will be distracted
                                    by the readable content of a page when looking at its layout.
                                </div>
                                <!-- /.comment-text -->
                            </div>
                            <!-- /.box-comment -->
                            </c:forEach>
                        </div>
                        <!-- /.box-footer -->
                        <div class="box-footer">
                            <form action="#" method="post">
                                <img class="img-responsive img-circle img-sm" src="../dist/img/user4-128x128.jpg" alt="Alt Text">
                                <!-- .img-push is used to add margin to elements next to floating images -->
                                <div class="img-push">
                                    <input type="text" class="form-control input-sm" placeholder="Press enter to post comment">
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

</body>

</html>