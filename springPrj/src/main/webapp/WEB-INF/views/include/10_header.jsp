<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
        <header class="main-header">

            <!-- Logo -->
            <a href="#" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini"><b>D</b>ev</span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg"><b>tody</b>Dev</span>
            </a>

            <!-- Header Navbar -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                    <span class="sr-only">Toggle navigation</span>
                </a>
                <!-- Navbar Right Menu -->
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                    	<sec:authorize access="isAnonymous()">
                    	<!-- sign in -->
                    	<li>
                            <a href='<c:url value='/accounts/loginform'/>'>Sign in</a>
                        </li>
                        <!-- sign up -->
                        <li>
                            <a href='<c:url value='/join/terms'/>'>Sign up</a>
                        </li>
                        <!-- User Account Menu -->
                        <li class="dropdown user user-menu">
                            <!-- Menu Toggle Button -->
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <!-- The user image in the navbar-->
                                <img src='<c:url value="/dist/img/user2-160x160.jpg"/>' class="user-image" alt="User Image">
                                <!-- hidden-xs hides the username on small devices so only the image appears. -->
                                <span class="hidden-xs">Unkown</span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- The user image in the menu -->
                                <li class="user-header">
                                    <img src='<c:url value="/dist/img/user2-160x160.jpg"/>' class="img-circle" alt="User Image">

                                    <p>
                                        Anonymous - sign up now!
                                        <small>로그인이 필요합니다.</small>
                                    </p>
                                </li>
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href='<c:url value='/accounts/loginform'/>' class="btn btn-default btn-flat">Sign in</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href='<c:url value='/join/terms'/>'class="btn btn-default btn-flat">Sign up</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        </sec:authorize>
                    	<sec:authorize access="isAuthenticated()">
                        <!-- logout -->
                        <li>
                            <a href="#" onclick="document.getElementById('logout-form').submit();">Sign out</a>
                            <form id="logout-form" action='<c:url value='/accounts/logout'/>' method="POST">
                            	<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
                            </form>
                        </li>
                        <!-- User Account Menu -->
                        <li class="dropdown user user-menu">
                            <!-- Menu Toggle Button -->
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <!-- The user image in the navbar-->
                                <img src='<c:url value="/dist/img/user2-160x160.jpg"/>' class="user-image" alt="User Image">
                                <!-- hidden-xs hides the username on small devices so only the image appears. -->
                                <span class="hidden-xs"><sec:authentication property="principal.username"/></span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- The user image in the menu -->
                                <li class="user-header">
                                    <img src='<c:url value="/dist/img/user2-160x160.jpg"/>' class="img-circle" alt="User Image">

                                    <p>
                                        <sec:authentication property="principal.NAME"/>님, 반갑습니다.
                                        <small><sec:authentication property="principal.EMAIL"/></small>
                                    </p>
                                </li>
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="#" class="btn btn-default btn-flat">Profile</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="#" onclick="document.getElementById('logout-form').submit();" class="btn btn-default btn-flat">Sign out</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        </sec:authorize>
                    </ul>
                </div>
            </nav>
        </header>
