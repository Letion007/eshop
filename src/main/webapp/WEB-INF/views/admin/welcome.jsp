<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>WELCOME ADMIN PANEL</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/resources/adminka/css/bootstrap.css" />" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value="/resources/adminka/css/jumbotron-narrow.css" />" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<div class="container">

    <div class="jumbotron" style="margin-top: 20px;">

        <sec:authorize access="!isAuthenticated()">
            <h1>WELCOME</h1>
            <p><a class="btn btn-lg btn-success" href="<c:url value="/login" />" role="button">Войти</a></p>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <h3>You logged</h3>
            <p><a  href="<c:url value="/admin/dashboard" />">Go to Admin Panel</a></p>
            <c:url value="/logout" var="logoutUrl" />
            <form id="logout" action="${logoutUrl}" method="post" >
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>
            <a class="btn btn-lg btn-success" href="javascript:document.getElementById('logout').submit()">Logout</a>
        </sec:authorize>
    </div>

</div>
</body>
</html>
