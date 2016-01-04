<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Show Product</title>

    <link href="/resources/adminka/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/adminka/css/datepicker3.css" rel="stylesheet">
    <link href="/resources/adminka/css/styles.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="/resources/adminka/js/html5shiv.js"></script>
    <script src="/resources/adminka/js/respond.min.js"></script>
    <![endif]-->
    <script src="/resources/adminka/js/jquery-1.11.1.min.js"></script>
    <script src="/resources/adminka/js/bootstrap.min.js"></script>
    <script src="/resources/adminka/js/chart.min.js"></script>
    <script src="/resources/adminka/js/chart-data.js"></script>
    <script src="/resources/adminka/js/easypiechart.js"></script>
    <script src="/resources/adminka/js/easypiechart-data.js"></script>
    <script src="/resources/adminka/js/bootstrap-datepicker.js"></script>
</head>

<body>

<!--logo-->
<jsp:include page="/resources/adminka/menu/logo.jsp" />
<!--/.logo-->

<!/.sidebar-->
<jsp:include page="/resources/adminka/menu/menu_l.jsp" />
<!--/.sidebar-->

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
            <li class="active">Dashboard</li>
        </ol>
    </div><!--/.row-->


    <div class="row">

        <ul class="nav navbar-nav">
            <li>
                <a href="/adminka/show-all/fary">Фары</a>
            </li>
            <li>
                <a href="/adminka/show-all/protifotumanie-fary">Противотуманные фары</a>
            </li>
            <li>
                <a href="/adminka/show-all/fonari-zadnie">Фонари задние</a>
            </li>
            <li>
                <a href="/adminka/show-all/lamp">Лампы</a>
            </li>
        </ul>

        <table class="table">
            <thead>
            <tr>
                <th data-field="id" data-sortable="true">ID</th>
                <th data-field="state" data-checkbox="true" >NAME</th>
                <th data-field="id" data-sortable="true">PRICE</th>
                <th data-field="name"  data-sortable="true">Manufacturer</th>
                <th data-field="price" data-sortable="true">Availability</th>
                <th data-field="price" data-sortable="true">Update</th>
                <th data-field="price" data-sortable="true">Delete</th>
            </tr>
            <c:forEach items="${products}" var="item">
                <tr>
                    <td data-field="id" data-sortable="true">${item.id}</td>
                    <td data-field="state" data-checkbox="true" ><a href='/admin/product/<c:out value="${item.url}" />'>${item.name}</a></td>
                    <td data-field="id" data-sortable="true">${item.price}</td>
                    <td data-field="name"  data-sortable="true">${item.manufacturer.name}</td>
                    <td data-field="price" data-sortable="true">${item.availability.availability}</td>
                    <td data-field="price" data-sortable="true"><button class="active">UPDATE</button></td>
                    <td data-field="price" data-sortable="true"><button class="active">DELETE</button></td>
                </tr>
            </c:forEach>
            </thead>
        </table>
    </div><!--/.row-->

</div>	<!--/.main-->
</body>

</html>
