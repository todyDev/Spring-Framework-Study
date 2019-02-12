<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
    <c:when test="${fn:length(list) > 0 }">
        <c:forEach items="${list }" var="comments">
            <div class="box-footer box-comments">
                <div class='box-comment'>
                    <img class='img-circle img-sm' src='../dist/img/user3-128x128.jpg' alt='User Image'>
                    <div class='comment-text'>
                        <span class='username'>${comments.WRITER }
                            <span class='text-muted pull-right'>${comments.REG_DATE }
                                <span data-toggle='modal' data-target='#modal-default-${comments.REPLY_NO }'>
                                    <a href='#this'><i class='fa fa-fw fa-ellipsis-v'></i></a>
                                </span></span>
                        </span>
                        ${comments.COMMENT }
                    </div>
                    <div class="modal fade" id="modal-default-${comments.REPLY_NO }">
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
                                            <sec:authentication property="principal.username" var="username" />
                                            <c:choose>
                                                <c:when test="${username eq comments.WRITER }">
                                                    <img class="img-circle img-sm" src="../dist/img/user4-128x128.jpg" alt="User Image">
                                                    <span style="margin-left: 40px;display: block;font-weight: 600;">
                                                        ${comments.WRITER }
                                                    </span>

                                                    <form method="post" id="commentEditForm">
                                                        <div style="margin-top: 30px">
                                                            <textarea name="comment" rows="9" class="form-control input-sm">${comments.COMMENT }</textarea>
                                                        </div>
                                                        <div style="margin-top: 30px; text-align: center">
                                                            <input type="hidden" name="replyno" value="${comments.REPLY_NO }">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                                                            <button type="button" class="btn btn-primary" id="commentedit">수정</button>
                                                            <button type="button" class="btn btn-danger pull-right" id="commentdel">삭제</button>
                                                        </div>
                                                    </form>
                                                </c:when>
                                                <c:otherwise>
                                                    <span>권한이 없습니다.</span>
                                                    <div style="margin-top: 30px; text-align: center">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
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
                </div>
            </div>
        </c:forEach>
    </c:when>
    <c:otherwise>
        <div class="box-footer box-comments">
            <span>등록된 댓글이 없습니다.</span>
        </div>
    </c:otherwise>
</c:choose>

<!-- /.box-footer -->

<script type="text/javascript">
    $(document).ready(function() {

        $("#commentedit").click(function() {
            commentEditSubmit();
        })

        $("#commentdel").click(function() {
            commentDeleteSubmit();
        })
    });

    function commentEditSubmit() {
        var commentForm = $("#commentEditForm");
        var modaltest = $(".modal-dialog").parents("div")
        $.ajax({
            async: true,
            url: "${pageContext.request.contextPath}/comment/edit",
            type: commentForm.attr('method'),
            data: commentForm.serialize(),
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
            },
            success: function(result) {
                alert("수정되었습니다.");
                modaltest.modal('hide');
                setTimeout(function() {
                    replyList()
                }, 1000);

            },
            error: function(request, status, error) {
                alert('code:' + request.status + '\n' + 'message:' + request.responseText + '\n' + 'error:' + error);
            }
        })
    }

    function commentDeleteSubmit() {
        var commentForm = $("#commentEditForm");
        var modaltest = $(".modal-dialog").parents("div")
        $.ajax({
            async: true,
            url: "${pageContext.request.contextPath}/comment/delete",
            type: commentForm.attr('method'),
            data: commentForm.serialize(),
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
            },
            success: function(result) {
                alert("삭제되었습니다.");
                modaltest.modal('hide');
                setTimeout(function() {
                    replyList()
                }, 1000);

            },
            error: function(request, status, error) {
                alert('code:' + request.status + '\n' + 'message:' + request.responseText + '\n' + 'error:' + error);
            }
        })
    }

</script>
