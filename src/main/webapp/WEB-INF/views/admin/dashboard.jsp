<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard</title>

    <link href="/resources/adminka/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/adminka/css/datepicker3.css" rel="stylesheet">
    <link href="/resources/adminka/css/styles.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="/resources/adminka/js/html5shiv.js"></script>
    <script src="/resources/adminka/js/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<!--logo-->
<jsp:include page="/resources/adminka/menu/logo.jsp" />
<!--/.logo-->

<!--sidebar-->
<jsp:include page="/resources/adminka/menu/menu_l.jsp" />
<!--/.sidebar-->
<sec:authorize access="hasRole('ROLE_ADMIN')">
TOP SECRET
    </sec:authorize>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="/adminka/dashboard"><span class="glyphicon glyphicon-home"></span></a></li>
            <li class="active">Dashboard</li>
        </ol>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Dashboard</h1>
        </div>
    </div><!--/.row-->



</div>	<!--/.main-->

<script src="/resources/adminka/js/jquery-1.11.1.min.js"></script>
<script src="/resources/adminka/js/bootstrap.min.js"></script>
<script src="/resources/adminka/js/chart.min.js"></script>
<script src="/resources/adminka/js/chart-data.js"></script>
<script src="/resources/adminka/js/easypiechart.js"></script>
<script src="/resources/adminka/js/easypiechart-data.js"></script>
<script src="/resources/adminka/js/bootstrap-datepicker.js"></script>

</body>

</html>
