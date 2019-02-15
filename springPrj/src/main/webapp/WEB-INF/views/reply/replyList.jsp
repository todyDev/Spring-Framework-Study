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
                <div class='box-comment'>
                
                	<c:choose>
                    <c:when test="${comments.SECRET eq 1 }">
                    	
                    	<sec:authorize access="isAnonymous()">
                    	<img class='img-circle img-sm' src='../dist/img/user3-128x128.jpg' alt='User Image'>
	                    <div class='comment-text'>
	                        <span class='username'>익명
	                            <span class='text-muted pull-right'>${comments.REG_DATE }
	                                <span data-toggle='modal' data-target='#modal-default-${comments.REPLY_NO }'>
	                                    <a href='#this'><i class='fa fa-fw fa-ellipsis-v'></i></a>
	                                </span></span>
	                        </span>
	                        비밀 댓글입니다.
	                    </div>
                    	</sec:authorize>
                    	
                    	<sec:authorize access="isAuthenticated()">
                    	<sec:authentication property="principal.username" var="username" />
                    	
                    	<c:choose>
                    		<c:when test="${comments.WRITER eq username || comments.CREA_ID eq username }">
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
                    		
                    		</c:when>
                    		<c:otherwise>
                    		                    	<img class='img-circle img-sm' src='../dist/img/user3-128x128.jpg' alt='User Image'>
	                    <div class='comment-text'>
	                        <span class='username'>익명 <i class="fa fa-fw fa-lock" style="color:red"></i>
	                            <span class='text-muted pull-right'>${comments.REG_DATE }
	                                <span data-toggle='modal' data-target='#modal-default-${comments.REPLY_NO }'>
	                                    <a href='#this'><i class='fa fa-fw fa-ellipsis-v'></i></a>
	                                </span></span>
	                        </span>
	                        비밀 댓글입니다.
	                    </div>
                    		</c:otherwise>
                    	</c:choose>
                    	
                    	</sec:authorize>
                    
                    </c:when>
                    <c:otherwise>
                    
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
                    
                    </c:otherwise>
                    </c:choose>

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

                                                    <form method="post" id="commentEditForm-${comments.REPLY_NO }">
                                                        <div style="margin-top: 30px">
                                                            <textarea name="comment" rows="9" class="form-control input-sm">${comments.COMMENT }</textarea>
                                                        </div>
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

        $("#commentdel").click(function() {
            commentDeleteSubmit();
        })
    });

    function commentEditSubmit(num) {
    	var commentForm = $("#commentEditForm-"+num);
    	var formMethod = commentForm.attr('method');
    	var formData = commentForm.serialize();
    	var modalId = $("#modal-default-"+num);
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
        var commentForm = $("#commentEditForm-"+num);
        var modalId = $("#modal-default-"+num);
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

</script>
