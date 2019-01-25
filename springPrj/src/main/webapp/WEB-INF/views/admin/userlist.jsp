<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    회원 정보
                    <small>리스트</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-hand-peace-o"></i> 회원</a></li>
                    <li class="active">정보 리스트</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content container-fluid">

                <div class="">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">USER</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body no-padding">
                            <div class="table-responsive mailbox-messages">
                                <table class="table table-hover">
                                    <tbody>
                                        <tr>
                                            <th style="width: 40px">#</th>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>이메일</th>
                                            <th>휴대폰</th>
                                            <th>권한</th>
                                            <th>enabled</th>
                                            <th>credexpi</th>
                                            <th>locked</th>
                                            <th>nonexpi</th>
                                            <th>가입일</th>
                                        </tr>
                                        <c:choose>
                                            <c:when test="${fn:length(list) > 0 }">
                                                <c:forEach items="${list }" var="bList">
                                                    <tr>
                                                        <td class="mailbox-attachment">${bList.IDX }</td>
                                                        <td class="mailbox-subject">${bList.ID }</td>
                                                        <td class="mailbox-attachment">${bList.NAME }</td>
                                                        <td class="mailbox-attachment">${bList.EMAIL }</td>
                                                        <td class="mailbox-attachment">${bList.PHONE }</td>
                                                        <td class="mailbox-attachment">${bList.AUTHORITY }</td>
                                                        <td class="mailbox-attachment">${bList.ENABLED }</td>
                                                        <td class="mailbox-attachment">${bList.CREDEXPI }</td>
                                                        <td class="mailbox-attachment">${bList.LOCKED }</td>
                                                        <td class="mailbox-attachment">${bList.NONEXPI }</td>
                                                        <td class="mailbox-date">${bList.REGDATE }</td>
                                                    </tr>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <tr>
                                                    <td class="mailbox-attachment"></td>
                                                    <td colspan="4">조회된 결과가 없습니다.</td>
                                                </tr>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </table>
                                <!-- /.table -->
                            </div>
                            <!-- /.mail-box-messages -->
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer no-padding">
                            <div class="mailbox-controls">
                                <!-- /.btn-group -->
                                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
                                <!-- /.pull-right -->
                                <div class="pull-right">
	                                <ul class="btn-group pagination" style="margin:0">
	                                    <c:if test="${pageMaker.prev }">
	                                    <li>
	                                        <a href='<c:url value="/board/boardList${pageMaker.makeQuery(pageMaker.startPage-1) }"/>' role="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></a>
	                                    </li>
	                                    </c:if>
	                                    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
	                                    <li <c:out value="${pageMaker.cri.page==idx ? 'class=active' : '' }" />>
	                                        <a href='<c:url value="/board/boardList${pageMaker.makeQuery(idx) }"/>' role="button" class="btn btn-default btn-sm"><i class="fa">${idx }</i></a>
	                                    </li>
	                                    </c:forEach>
	                                    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
	                                    <li>
	                                        <a href='<c:url value="/board/boardList${pageMaker.makeQuery(pageMaker.endPage+1) }"/>' role="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></a>
	                                    </li>
	                                    </c:if>
	                                </ul>
                                    <!-- /.btn-group -->
                                </div>
                                <!-- /.pull-right -->
                            </div>
                        </div>
                    </div>
                    <!-- /. box -->
                </div>
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