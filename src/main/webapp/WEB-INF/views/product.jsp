<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.letion.model.Product" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html ng-app="cartApp" lang="ru">

<head>
    <title>${product.name} купить по выгодной цене, доставка по Украине</title>
    <meta charset="utf-8">
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
<div ng-controller="mainCtrl">
    <!-- Navigation -->
    <jsp:include page="/resources/menu/logo.jsp"/>
    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="row" itemscope itemtype="http://schema.org/Product">
                    <h1 id="h1" itemprop="name" class="h1_main">${product.name}</h1>

                    <div class='col-sm-5 col-lg-5 col-md-5'>
                        <div class='thumbnail1'>
                            <div class="big_image_size">
                                <img id="img_main" itemprop="image" class="big_image"
                                     src="/resources/img/${product.images.get(0).name}">
                            </div>
                        </div>
                    </div>

                    <div class='col-sm-7 col-lg-7 col-md-7'>
                        <table border="0" class="table">
                            <tr>
                                <td>Производитель:</td>
                                <td class="opisanie2">${product.manufacturer.name}</td>
                            </tr>
                            <tr>
                                <td>Артикул:</td>
                                <td class="opisanie1">${product.artical}</td>
                            </tr>
                            <tr>
                                <td>Применим к:</td>
                                <td class="opisanie1">${product.suitableModel}</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="opisanie2">
                                    <link itemprop="availability" href="http://schema.org/InStock"/>
                                </td>
                            </tr>
                        </table>

                        <div class="row">
                            <div class="col-md-6">
                            <span class="product_zena">
                                <span id="priceProduct" itemprop="price">${product.price}</span> грн
                            </span>
                            </div>
                            <div class="col-md-6">
                                <form action='/order' method='get'>
                                    <input name='id_url' type='hidden' value='${product.url}'/>
                                    <input id='idProduct' type='hidden' value='${product.id}'/>
                                    <input id='imageSmall' type='hidden' value='${product.images.get(0).name}'/>
                                </form>
                                <button ng-click="addCart()" class='btn_big'>Добавить в корзину</button>
                            </div>
                        </div>

                    </div>

                    <div class='col-sm-12 col-lg-12 col-md-12'>
                        <div class='thumbnail1'>
                            <hr>
                            <span itemprop="description">${product.description}</span>
                        </div>
                    </div>
                </div>
                <div id="clear"></div>

            </div>
            <jsp:include page="/resources/menu/menu_r_fary.jsp"/>
        </div>
        <!-- /.container -->
        <!-- Footer -->
        <jsp:include page="/resources/menu/footer.jsp"/>
    </div>
</div>

</body>
</html>