<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <%@ include file="/WEB-INF/views/include/00_head.jsp" %>
    <style>
        .form-edit {
            float: left;
            width: 97%;
        }

        .secretColor {
            border-radius: 3px;
            position: relative;
            top: 5px;
            padding-left: 8px;
        }
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
                                <sec:authentication property="principal.username" var="crea_id" />
                                <c:if test="${detail.CREA_ID eq crea_id }">
                                    <div class="pull-right">
                                        <a href='<c:url value="/reply/boardModify?IDX=${detail.ARTICLE_NO }&page=${cri.page }&perPageNum=${cri.perPageNum }"/>' role="button" class="btn btn-default"><i class="fa fa-reply"></i> 수정</a>
                                        <a href='<c:url value="/reply/boardDelete?IDX=${detail.ARTICLE_NO }&page=${cri.page }&perPageNum=${cri.perPageNum }"/>' role="button" class="btn btn-default"><i class="fa fa-trash-o"></i> 삭제</a>
                                    </div>
                                </c:if>
                            </sec:authorize>
                        </div>
                        <!-- /.box-footer -->
                        <div id="comments-table">
                        </div>
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
                            <sec:authentication property="principal.username" var="username" />
                            <div class="box-footer">
                                <form action="#" method="post" id="commentForm" onsubmit="return false;">
                                    <img class="img-responsive img-circle img-sm" src="../dist/img/user4-128x128.jpg" alt="Alt Text">
                                    <!-- .img-push is used to add margin to elements next to floating images -->
                                    <div class="img-push">
                                        <input type="hidden" name="writer" value="${username }">
                                        <input type="hidden" name="articleNo" value="${detail.ARTICLE_NO }">
                                        <input type="text" name="comments" id="comments" class="form-control input-sm form-edit" placeholder="Press enter to post comment" onkeypress="commentSubmit();">
                                        <a href="#this" class="secretColor secret-0" onclick="setSecretComment(0)"><i id="secret-fa-0" class="fa fa-fw fa-unlock"></i></a>
                                        <input type="hidden" name="secret" id="secretComment-0" value="0">
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
        $(document).ready(function() {
            replyList();

        });

        function replyList() {
            $.ajax({
                type: 'GET',
                url: "${pageContext.request.contextPath}/comment/list?articleNo=${detail.ARTICLE_NO }",
                success: function(data) {
                    console.log(data);
                    $("#comments-table").html(data);
                },
                error: function(request, status, error) {
                    alert('code:' + request.status + '\n' + 'message:' + request.responseText + '\n' + 'error:' + error);
                }
            })
        }

        function commentSubmit() {
            if (event.keyCode == 13) {
                var commentForm = $("#commentForm");
                var commentsId = $("#comments");
                $.ajax({
                    async: true,
                    url: "${pageContext.request.contextPath}/comment/register",
                    type: commentForm.attr('method'),
                    data: commentForm.serialize(),
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
                    },
                    success: function(result) {
                        commentsId.val('');
                        resetSecretComment();
                        replyList();
                    },
                    error: function(request, status, error) {
                        alert('code:' + request.status + '\n' + 'message:' + request.responseText + '\n' + 'error:' + error);
                    }
                })
            } else {
                return false;
            }
        }
        
        function setSecretComment(num) {
            var secretComment = $("#secretComment-" + num);
            var secretColor = $(".secret-" + num);
            var chg_fa = $("#secret-fa-" + num);
            var org_fa = chg_fa.attr("class");
            if (org_fa == 'fa fa-fw fa-lock') {
                chg_fa.attr("class", "fa fa-fw fa-unlock");
                secretComment.val("0");
                secretColor.css('color', '');
            } else {
                chg_fa.attr("class", "fa fa-fw fa-lock");
                secretComment.val("1");
                secretColor.css('color', 'red');
            }
        }
        
        function resetSecretComment() {
            $("#secret-fa-0").attr("class", "fa fa-fw fa-unlock");
            $("#secretComment-0").val("0");
            $(".secret-0").css('color', '');
            
        }

    </script>

</body>

</html>