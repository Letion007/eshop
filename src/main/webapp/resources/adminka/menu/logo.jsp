﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/adminka"><span>Adminka</span></a>

            <sec:authorize access="!isAuthenticated()">
                    <a href="/login">Login</a>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <c:url value="/logout" var="logoutUrl" />
                <form id="logout" action="${logoutUrl}" method="post" >
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                </form>

                <ul class="user-menu">
                    <li class="dropdown pull-right">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> User <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-cog"></span> Settings</a></li>
                            <li><a href="javascript:document.getElementById('logout').submit()" class="glyphicon glyphicon-log-out">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </sec:authorize>
        </div>

    </div><!-- /.container-fluid -->
</nav>

