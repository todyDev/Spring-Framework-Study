<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
    <c:when test="${fn:length(list) > 0 }">
        <div class="box-footer box-comments">

            <c:forEach items="${list }" var="comments">
                <!-- -comment -->
                <div class="box-comment">

                    <c:choose>
                        <c:when test="${comments.SECRET eq 1 }">
                            <!-- 비밀 댓글 -->

                            <!-- 로그인 안한 경우 -->
                            <sec:authorize access="isAnonymous()">

                                <!-- 댓글 -->
                                <c:if test="${comments.GROUP_DEP eq 1 }">
                                    <img class="img-circle img-sm" src="../dist/img/user3-128x128.jpg" alt="User Image">

                                    <!-- comment -->
                                    <div class="comment-text">
                                        <span class="username">
                                            익명 <i class="fa fa-fw fa-lock" style="color:red"></i>
                                            <span class="text-muted pull-right">${comments.REG_DATE }
                                                <span data-toggle="modal" data-target="#modal-default-${comments.REPLY_NO }">
                                                    <a href="#this"><i class="fa fa-fw fa-ellipsis-v"></i></a>
                                                </span>
                                            </span>
                                        </span>
                                        비밀 댓글입니다.

                                    </div>
                                </c:if>

                                <!-- 답글 -->
                                <c:if test="${comments.GROUP_DEP eq 2 }">
                                    <div class="comment-text no-padding" style="padding: 8px">
                                        <img class="img-circle img-sm" src="../dist/img/user3-128x128.jpg" alt="User Image">

                                        <!-- comment -->
                                        <div class="comment-text">
                                            <span class="username">
                                                익명 <i class="fa fa-fw fa-lock" style="color:red"></i>
                                                <span class="text-muted pull-right">${comments.REG_DATE }
                                                    <span data-toggle="modal" data-target="#modal-default-${comments.REPLY_NO }">
                                                        <a href="#this"><i class="fa fa-fw fa-ellipsis-v"></i></a>
                                                    </span>
                                                </span>
                                            </span>
                                            비밀 댓글입니다.

                                        </div>
                                    </div>
                                </c:if>

                            </sec:authorize>


                            <!-- 로그인한 경우 -->
                            <sec:authorize access="isAuthenticated()">
                                <sec:authentication property="principal.username" var="username" />

                                <c:choose>
                                    <c:when test="${comments.WRITER eq username || comments.CREA_ID eq username }">
                                        <!-- 댓글 작성자 이거나 글 작성자일때 -->

                                        <!-- 댓글 -->
                                        <c:if test="${comments.GROUP_DEP eq 1 }">
                                            <img class="img-circle img-sm" src="../dist/img/user3-128x128.jpg" alt="User Image">

                                            <div class="comment-text">

                                                <!-- comment -->
                                                <span class="username">
                                                    ${comments.WRITER }
                                                    <span class="text-muted pull-right">${comments.REG_DATE }
                                                        <span data-toggle="modal" data-target="#modal-default-${comments.REPLY_NO }">
                                                            <a href="#this"><i class="fa fa-fw fa-ellipsis-v"></i></a>
                                                        </span>
                                                    </span>
                                                </span>
                                                ${comments.COMMENT }


                                                <!-- want recomment -->
                                                <div class="" style="padding-top: 5px; font-size: 13px">
                                                    <span><a href="#this" onclick="addReComment(${comments.REPLY_NO })">
                                                            <i class="fa fa-fw fa-commenting-o"></i> 답글달기</a>
                                                    </span>
                                                </div>

                                                <!-- write comment -->
                                                <div class="" id="recomment-${comments.REPLY_NO }" style="display: none;padding: 8px">
                                                    <form action="#" method="post" id="commentForm-${comments.REPLY_NO }" onsubmit="return false;">
                                                        <img class="img-responsive img-circle img-sm" src="../dist/img/user3-128x128.jpg" alt="Alt Text">

                                                        <sec:authorize access="isAnonymous()">
                                                            <div class="img-push">
                                                                <input type="text" class="form-control input-sm" placeholder="로그인 후 이용해주세요." disabled>
                                                            </div>
                                                        </sec:authorize>

                                                        <sec:authorize access="isAuthenticated()">
                                                            <sec:authentication property="principal.username" var="username" />
                                                            <div class="img-push">
                                                                <input type="hidden" name="writer" value="${username }">
                                                                <input type="hidden" name="articleNo" value="${comments.ARTICLE_NO }">
                                                                <input type="hidden" name="replyNo" value="${comments.REPLY_NO }">
                                                                <input type="text" name="comments" id="comments-${comments.REPLY_NO }" class="form-control input-sm form-edit" placeholder="Press enter to post comment" onkeypress="reCommentSubmit(${comments.REPLY_NO });">
                                                                <a href="#this" class="secretColor secret-${comments.REPLY_NO }" onclick="setSecretComment(${comments.REPLY_NO })"><i id="secret-fa-${comments.REPLY_NO }" class="fa fa-fw fa-unlock"></i></a>
                                                                <input type="hidden" name="secret" id="secretComment-${comments.REPLY_NO }" value="0">
                                                            </div>
                                                        </sec:authorize>
                                                    </form>
                                                </div>

                                            </div>
                                        </c:if>

                                        <!-- 답글-->
                                        <c:if test="${comments.GROUP_DEP eq 2 }">
                                            <div class="comment-text no-padding" style="padding: 8px">
                                                <img class="img-circle img-sm" src="../dist/img/user3-128x128.jpg" alt="User Image">

                                                <!-- comment -->
                                                <div class="comment-text">
                                                    <span class="username">
                                                        ${comments.WRITER }
                                                        <span class="text-muted pull-right">${comments.REG_DATE }
                                                            <span data-toggle="modal" data-target="#modal-default-${comments.REPLY_NO }">
                                                                <a href="#this"><i class="fa fa-fw fa-ellipsis-v"></i></a>
                                                            </span>
                                                        </span>
                                                    </span>
                                                    ${comments.COMMENT }

                                                </div>
                                            </div>
                                        </c:if>

                                    </c:when>


                                    <c:otherwise>
                                        <!-- 댓글 작성자도 글 작성자도 아닐 경우 -->

                                        <!-- 댓글 -->
                                        <c:if test="${comments.GROUP_DEP eq 1 }">
                                            <img class="img-circle img-sm" src="../dist/img/user3-128x128.jpg" alt="User Image">

                                            <!-- comment -->
                                            <div class="comment-text">
                                                <span class="username">
                                                    익명 <i class="fa fa-fw fa-lock" style="color:red"></i>
                                                    <span class="text-muted pull-right">${comments.REG_DATE }
                                                        <span data-toggle="modal" data-target="#modal-default-${comments.REPLY_NO }">
                                                            <a href="#this"><i class="fa fa-fw fa-ellipsis-v"></i></a>
                                                        </span>
                                                    </span>
                                                </span>
                                                비밀 댓글입니다.

                                            </div>
                                        </c:if>

                                        <!-- 답글 -->
                                        <c:if test="${comments.GROUP_DEP eq 2 }">
                                            <div class="comment-text no-padding" style="padding: 8px">
                                                <img class="img-circle img-sm" src="../dist/img/user3-128x128.jpg" alt="User Image">

                                                <!-- comment -->
                                                <div class="comment-text">
                                                    <span class="username">
                                                        익명 <i class="fa fa-fw fa-lock" style="color:red"></i>
                                                        <span class="text-muted pull-right">${comments.REG_DATE }
                                                            <span data-toggle="modal" data-target="#modal-default-${comments.REPLY_NO }">
                                                                <a href="#this"><i class="fa fa-fw fa-ellipsis-v"></i></a>
                                                            </span>
                                                        </span>
                                                    </span>
                                                    비밀 댓글입니다.

                                                </div>
                                            </div>
                                        </c:if>

                                    </c:otherwise>
                                </c:choose>
                            </sec:authorize>

                        </c:when>


                        <c:otherwise>
                            <!-- 공개 댓글 -->

                            <!-- 댓글 -->
                            <c:if test="${comments.GROUP_DEP eq 1 }">
                                <img class="img-circle img-sm" src="../dist/img/user3-128x128.jpg" alt="User Image">

                                <div class="comment-text">

                                    <!-- comment -->
                                    <span class="username">
                                        ${comments.WRITER }
                                        <span class="text-muted pull-right">${comments.REG_DATE }
                                            <span data-toggle="modal" data-target="#modal-default-${comments.REPLY_NO }">
                                                <a href="#this"><i class="fa fa-fw fa-ellipsis-v"></i></a>
                                            </span>
                                        </span>
                                    </span>
                                    ${comments.COMMENT }


                                    <!-- want recomment -->
                                    <div class="" style="padding-top: 5px; font-size: 13px">
                                        <span><a href="#this" onclick="addReComment(${comments.REPLY_NO })">
                                                <i class="fa fa-fw fa-commenting-o"></i> 답글달기</a>
                                        </span>
                                    </div>

                                    <!-- write comment -->
                                    <div class="" id="recomment-${comments.REPLY_NO }" style="display: none;padding: 8px">
                                        <form action="#" method="post" id="commentForm-${comments.REPLY_NO }" onsubmit="return false;">
                                            <img class="img-responsive img-circle img-sm" src="../dist/img/user3-128x128.jpg" alt="Alt Text">

                                            <sec:authorize access="isAnonymous()">
                                                <div class="img-push">
                                                    <input type="text" class="form-control input-sm" placeholder="로그인 후 이용해주세요." disabled>
                                                </div>
                                            </sec:authorize>

                                            <sec:authorize access="isAuthenticated()">
                                                <sec:authentication property="principal.username" var="username" />
                                                <div class="img-push">
                                                    <input type="hidden" name="writer" value="${username }">
                                                    <input type="hidden" name="articleNo" value="${comments.ARTICLE_NO }">
                                                    <input type="hidden" name="replyNo" value="${comments.REPLY_NO }">
                                                    <input type="text" name="comments" id="comments-${comments.REPLY_NO }" class="form-control input-sm form-edit" placeholder="Press enter to post comment" onkeypress="reCommentSubmit(${comments.REPLY_NO });">
                                                    <a href="#this" class="secretColor secret-${comments.REPLY_NO }" onclick="setSecretComment(${comments.REPLY_NO })"><i id="secret-fa-${comments.REPLY_NO }" class="fa fa-fw fa-unlock"></i></a>
                                                    <input type="hidden" name="secret" id="secretComment-${comments.REPLY_NO }" value="0">
                                                </div>
                                            </sec:authorize>
                                        </form>
                                    </div>

                                </div>
                            </c:if>

                            <!-- 답글 -->
                            <c:if test="${comments.GROUP_DEP eq 2 }">
                                <div class="comment-text no-padding" style="padding: 8px">

                                    <img class="img-circle img-sm" src="../dist/img/user3-128x128.jpg" alt="User Image">

                                    <div class="comment-text">
                                        <span class="username">
                                            ${comments.WRITER }
                                            <span class="text-muted pull-right">${comments.REG_DATE }
                                                <span data-toggle="modal" data-target="#modal-default-${comments.REPLY_NO }">
                                                    <a href="#this"><i class="fa fa-fw fa-ellipsis-v"></i></a>
                                                </span>
                                            </span>
                                        </span>
                                        ${comments.COMMENT }
                                    </div>
                                </div>
                            </c:if>

                        </c:otherwise>
                    </c:choose>


                    <!-- modify/delete MODAL -->
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
                                                    <img class="img-circle img-sm" src="../dist/img/user3-128x128.jpg" alt="User Image">
                                                    <span style="margin-left: 40px;display: block;font-weight: 600;">
                                                        ${comments.WRITER }
                                                    </span>

                                                    <form method="post" id="commentEditForm-${comments.REPLY_NO }">
                                                        <div style="margin-top: 30px">
                                                            <textarea name="comment" rows="9" class="form-control input-sm">${comments.COMMENT }</textarea>
                                                        </div>
                                                        <c:if test="${comments.SECRET eq 1 }">
                                                            <div style="margin-top: 10px;">
                                                                <label>
                                                                    <input type="checkbox" class="minimal" id="secret" name="secret" value="1" checked>
                                                                    비밀 댓글
                                                                </label>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${comments.SECRET eq 0 }">
                                                            <div style="margin-top: 10px;">
                                                                <label>
                                                                    <input type="checkbox" class="minimal" id="secret" name="secret" value="1">
                                                                    비밀 댓글
                                                                </label>
                                                            </div>
                                                        </c:if>
                                                        <div style="margin-top: 30px; text-align: center">
                                                            <input type="hidden" name="replyno" value="${comments.REPLY_NO }">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                                                            <button type="button" class="btn btn-primary" onclick="commentEditSubmit(${comments.REPLY_NO })">수정</button>
                                                            <button type="button" class="btn btn-danger pull-right" onclick="commentDeleteSubmit(${comments.REPLY_NO })">삭제</button>
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
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </c:forEach>

            <!-- more comments -->
            <c:if test="${moreMaker.next }">
                <div class="" style="font-size: 13px;text-align: center; padding-top: 8px">
                    <a href="#this" onclick="morecomments()"><i class="fa fa-fw fa-plus-square-o"></i> 댓글 더 보기</a>
                </div>
            </c:if>

        </div>
    </c:when>
    <c:otherwise>

        <div class="box-footer box-comments">
            <span>등록된 댓글이 없습니다.</span>
        </div>

    </c:otherwise>
</c:choose>


<script type="text/javascript">
    $(document).ready(function() {

        $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
            checkboxClass: 'icheckbox_minimal-blue',
            radioClass: 'iradio_minimal-blue'
        });
    });

    function reCommentSubmit(num) {
        if (event.keyCode == 13) {
            var commentForm = $("#commentForm-" + num);
            var commentsId = $("#comments-" + num);
            $.ajax({
                async: true,
                url: "${pageContext.request.contextPath}/comment/registerRe",
                type: commentForm.attr('method'),
                data: commentForm.serialize(),
                beforeSend: function(xhr) {
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
                },
                success: function(result) {
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

    function commentEditSubmit(num) {
        var commentForm = $("#commentEditForm-" + num);
        var formMethod = commentForm.attr('method');
        var formData = commentForm.serialize();
        var modalId = $("#modal-default-" + num);
        $.ajax({
            async: true,
            url: "${pageContext.request.contextPath}/comment/edit",
            type: formMethod,
            data: formData,
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
            },
            success: function(result) {
                alert("수정되었습니다.");
                modalId.modal('hide');
                setTimeout(function() {
                    replyList()
                }, 500);

            },
            error: function(request, status, error) {
                alert('code:' + request.status + '\n' + 'message:' + request.responseText + '\n' + 'error:' + error);
            }
        })
    }

    function commentDeleteSubmit(num) {
        var commentForm = $("#commentEditForm-" + num);
        var modalId = $("#modal-default-" + num);
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
                modalId.modal('hide');
                setTimeout(function() {
                    replyList()
                }, 1000);

            },
            error: function(request, status, error) {
                alert('code:' + request.status + '\n' + 'message:' + request.responseText + '\n' + 'error:' + error);
            }
        })
    }

    function morecomments() {
        $.ajax({
            type: 'GET',
            url: "${pageContext.request.contextPath}/comment/list${moreMaker.makeMore(moreMaker.page+1) }",
            success: function(data) {
                console.log(data);
                $("#comments-table").html(data);
            },
            error: function(request, status, error) {
                alert('code:' + request.status + '\n' + 'message:' + request.responseText + '\n' + 'error:' + error);
            }
        })
    }

    function addReComment(num) {
        var recomment = $("#recomment-" + num);
        if (recomment.css('display') == 'none') {
            recomment.show();
        } else {
            recomment.hide();
        }
    }

</script>
