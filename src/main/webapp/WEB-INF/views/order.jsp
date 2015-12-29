<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html ng-app="cartApp" lang="ru">

<head>
    <title>ЗАКАЗ ТОВАРА</title>
    <meta charset="UTF-8">
    <!-- Bootstrap Core CSS -->
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/resources/css/shop-homepage.css" rel="stylesheet">
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

<div ng-controller="mainCtrl" class="container">

    <div class="row">

        <div class="col-md-10">

            <div ng-show="cartInfoDetails" class="row check-element animate-show">
                <div class="col-lg-12">
                    <h2 class="page-header">Ваш заказ</h2>

                    <table class="table">
                        <tr>
                            <td>Артикул</td>
                            <td>Фото</td>
                            <td>Имя</td>
                            <td>Количество</td>
                            <td>Цена</td>
                            <td>Сумма</td>
                            <td></td>
                        </tr>
                        <tr ng-repeat="product in listProduct">
                            <td>{{ product.id}}</td>
                            <td><img class="cartImgSmall" src="/resources/img/{{product.imageSmall}}"></td>
                            <td>{{ product.name }}</td>
                            <td><input ng-model="product.quantity" ng-change="changeQuantity($index)"></td>
                            <td>{{ product.price }}</td>
                            <td>{{ product.price * product.quantity }}</td>
                            <td><a ng-click="remove($index)">Х</a></td>
                        </tr>
                        <tr class="warning">
                            <td colspan="5">Общая сумма</td>
                            <td>{{totalSum}}</td>
                            <td></td>
                        </tr>
                    </table>
                    <button ng-click="checkout()" type="button" class="btn_big">ОФОРМИТЬ ЗАКАЗ</button>
                </div>
            </div>
            <!--/.row-->

            <div ng-show="cartInfo" class="row check-element animate-show">
                <table class="table">
                    <tr class="warning">
                        <td>Ваша корзина: <img src="/resources/images/cart.png"> <em>{{sizeCart}}</em></td>
                        <td> На сумму -</td>
                        <td>{{totalSum}} грн</td>
                        <td><a href="" ng-click="orderDetails()">редактировать</a></td>
                    </tr>
                </table>
            </div>

            <div ng-show="infoCustomer" class="row check-element animate-show">
                <div class="col-lg-12">
                    <h2 class="page-header">Контактные данные</h2>

                    <label>Имя</label>
                    <input id='nameCustomer' type="text">
                    <label>Фамилия</label>
                    <input id='surnameCustomer' type="text">
                    <label>Телефон</label>
                    <input id='telCustomer' type="tel">
                    <label></label>
                    <button ng-click="sendOrder()" class="btn_big btn-info">Подтвердить заказ</button>

                </div>
            </div>
            <div id="clear"></div>

        </div>

    </div>
    <!-- /.container -->
    <!-- Footer -->
    <jsp:include page="/resources/menu/footer.jsp"/>
</div>
</body>
</html>


