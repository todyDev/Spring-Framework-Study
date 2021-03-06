<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
        <aside class="main-sidebar">

            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">

                <!-- Sidebar user panel (optional) -->
                <div class="user-panel">
                    <div class="pull-left image">
                        <img src='<c:url value="/dist/img/user2-160x160.jpg"/>' class="img-circle" alt="User Image">
                    </div>
                    <div class="pull-left info">
                    	<sec:authorize access="isAnonymous()">
                        <p>Unkown</p>
                    	</sec:authorize>
                    	<sec:authorize access="isAuthenticated()">
                        <p><sec:authentication property="principal.username"/></p>
                    	</sec:authorize>
                        <!-- Status -->
                        <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                    </div>
                </div>

                <!-- search form (Optional) -->
                <form action="#" method="get" class="sidebar-form">
                    <div class="input-group">
                        <input type="text" name="q" class="form-control" placeholder="Search...">
                        <span class="input-group-btn">
                            <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                            </button>
                        </span>
                    </div>
                </form>
                <!-- /.search form -->

                <!-- Sidebar Menu -->
                <ul class="sidebar-menu" data-widget="tree">
                    <li class="header">MAIN</li>
                    <li class="active"><a href="#"><i class="fa fa-book"></i> <span>Study</span></a></li>
                    <li class="header">게시판</li>
                    <!-- Optionally, you can add icons to the links -->
                    <li><a href='<c:url value="/board/boardList"/>'><i class="fa fa-th-list"></i> <span>게시판 + 페이징</span></a></li>
                    <li><a href='<c:url value="/search/boardList"/>'><i class="fa fa-th-list"></i> <span>게시판 검색</span></a></li>
                    <li><a href='<c:url value="/reply/boardList"/>'><i class="fa fa-th-list"></i> <span>게시판 댓글</span></a></li>
                    <li><a href='<c:url value="/upload/boardList"/>'><i class="fa fa-th-list"></i> <span>게시판 파일 업로드</span></a></li>
                    <li class="header">회원 관련 (admin)</li>
                    <li><a href='<c:url value="/admin/userlist"/>'><i class="fa fa-folder-open"></i> <span>회원 리스트</span></a></li>
                    <li class="treeview">
                        <a href="#"><i class="fa fa-link"></i> <span>Multilevel</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="#"><i class="fa fa-circle-o"></i>Link in level 2</a></li>
                            <li><a href="#"><i class="fa fa-circle-o"></i>Link in level 2</a></li>
                        </ul>
                    </li>
                </ul>
                <!-- /.sidebar-menu -->
            </section>
            <!-- /.sidebar -->
        </aside>