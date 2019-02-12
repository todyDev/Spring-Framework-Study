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
                                                <span class="username" style="margin-left: 40px;display: block;font-weight: 600;">
                                                    ${comments.WRITER }
                                                </span>
                                                <div style="margin-top: 30px">
                                                    <form>
                                                        <textarea rows="9" class="form-control input-sm editComment">${comments.COMMENT }</textarea>
                                                    </form>
                                                </div>
                                                <div style="margin-top: 30px; text-align: center">
                                                    <input type="hidden" id="replyId" class="replyId" value="${comments.WRITER }">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                                                    <button type="button" class="btn btn-primary">수정</button>
                                                    <button type="button" class="btn btn-danger pull-right">삭제</button>
                                                </div>
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
        </c:forEach>
    </c:when>
    <c:otherwise>
        <div class="box-footer box-comments">
            <span>등록된 댓글이 없습니다.</span>
        </div>
    </c:otherwise>
</c:choose>

<!-- /.box-footer -->
