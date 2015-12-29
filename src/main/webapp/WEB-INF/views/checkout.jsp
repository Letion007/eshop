<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html ng-app="cartApp" lang="ru">

<head>
    <title>Заказ оформлен</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <META name="description" content="Заказ успешно оформлен">
    <meta name="author" content="">
    <link rel="publisher" href="https://plus.google.com/+FaraavtoUa4b/about"/>
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <!-- Bootstrap Core CSS -->
    <link href="<c:url value='/resources/css/bootstrap.css' />" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<c:url value='/resources/css/shop-homepage.css' />" rel="stylesheet">
    <link href="/resources/css/custom-style.css" rel="stylesheet">
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

<!-- Navigation -->
<jsp:include page="/resources/menu/logo.jsp"/>

<!-- Page Content -->

<div class="container">

    <div class="row">

        <div class="col-md-10">

            <div ng-show="cartInfoDetails" class="row check-element animate-show">
                <div class="col-lg-12">

                    <h2 class="page-header">Ваш заказ оформлен успешно</h2>

                </div>
            </div>
            <!--/.row-->

            <div id="clear"></div>

        </div>

    </div>
    <!-- /.container -->
    <!-- Footer -->
    <jsp:include page="/resources/menu/footer.jsp"/>
</div>
</body>
</html>


