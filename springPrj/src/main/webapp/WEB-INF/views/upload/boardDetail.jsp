<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                        
                        <c:choose>
                            <c:when test="${fn:length(list) > 0 }">
	                        <div class="box-footer">
	                            <ul class="mailbox-attachments clearfix">
	                            	<c:forEach items="${list }" var="bList">
			                            <li>
			                               <span class="mailbox-attachment-icon has-img"><!-- <img src="../../dist/img/photo2.png" alt="Attachment"> --></span>
			
			                               <div class="mailbox-attachment-info">
			                                   <a href='<c:url value="/common/downloadFile?IDX=${bList.IDX }"/>' class="mailbox-attachment-name"><i class="fa fa-camera"></i> ${bList.ORG_FILE_NAME }</a>
			                                   <span class="mailbox-attachment-size">
			                                       ${bList.FILE_SIZE }kb
			                                   </span>
			                              </div>
			                           </li>
	                            	</c:forEach>
	                            </ul>
	                        </div>
	                        <!-- /.box-footer -->
                            </c:when>
                        </c:choose>
                        <div class="box-footer">
                        	<a href='<c:url value="/upload/boardList?page=${cri.page }&perPageNum=${cri.perPageNum }"/>' role="button" class="btn btn-default"><i class="fa fa-list"></i> 목록으로</a>
                        	<sec:authorize access="isAuthenticated()">
                        	<sec:authentication property="principal.username" var="crea_id"/>
                        	<c:if test="${detail.CREA_ID eq crea_id }">
                            <div class="pull-right">
                                <a href='<c:url value="/upload/boardModify?IDX=${detail.IDX }&page=${cri.page }&perPageNum=${cri.perPageNum }"/>' role="button" class="btn btn-default"><i class="fa fa-reply"></i> 수정</a>
                                <a href='<c:url value="/upload/boardDelete?IDX=${detail.IDX }&page=${cri.page }&perPageNum=${cri.perPageNum }"/>' role="button" class="btn btn-default"><i class="fa fa-trash-o"></i> 삭제</a>
                            </div>
                        	</c:if>
                            </sec:authorize>
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