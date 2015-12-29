<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html ng-app="cartApp" lang="ru">

<head>
    <title>ФАРА-АВТО Интернет магазин></title>
    <meta charset="UTF-8">
    <!-- Bootstrap Core CSS -->
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/css/custom-style.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/resources/css/shop-homepage.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-cookies.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-animate.js"></script>

    <script src="/resources/js/service.js"></script>
    <script src="/resources/js/controllers.js"></script>

</head>

<body ng-controller="cartCtrl">
<div ng-controller="mainCtrl"></div>
<!-- Navigation -->
<jsp:include page="/resources/menu/logo.jsp"/>

<!-- Page Content -->

<div class="container">

    <div class="row">
        <jsp:include page="/resources/menu/menu_l_fary.jsp"/>

        <div class="col-md-6">

            <%--<jsp:useBean id="listProducts" class="java.util.ArrayList" scope="request"/>--%>

            <div class="row">
                <h1>Инернет магазин ФАРА-АВТО</h1>
                <c:forEach items="${product}" var="item">
                    <div class='col-sm-6 col-lg-6 col-md-6'>
                        <div class='thumbnail'>
                            <a href='/product/<c:out value="${item.url}" />'><img
                                    src='/resources/img/<c:out value="${item.images.get(0).name}" />'></a>

                            <div class='caption'>
                                <h4 class='price'><span><c:out value="${item.price}"/></span> грн</h4>
                                <h4><a href='/product/<c:out value="${item.url}" />'><c:out value="${item.name}"/></a>
                                </h4>

                                <p>Производитель: <c:out value="${item.manufacturer.name}"/></p>
                                <a href='/product/<c:out value="${item.url}" />'>
                                    <button class='btn_small'>Детальнее</button>
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div id="clear"></div>

        </div>
        <jsp:include page="/resources/menu/menu_r_fary.jsp"/>

    </div>
    <!-- /.container -->
    <!-- Footer -->
    <jsp:include page="/resources/menu/footer.jsp"/>
</div>
</body>
</html>


