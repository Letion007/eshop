'use strict'

var cartApp = angular.module('cartApp', ['customService', 'ngAnimate']);

cartApp.controller('mainCtrl', ['$window', '$http', 'cartService', '$scope', function ($window, $http, cart, $scope) {

    cart.init();
    $scope.listProduct1 = cart.getAllJSON();

    $scope.getDetailsProduct = function () {
        var data = {};
        data.idProduct = angular.element(document.querySelector('#idProduct')).val();
        data.name = angular.element(document.querySelector('#h1')).text();
        data.imageSmall = angular.element(document.querySelector('#imageSmall')).val();
        data.price = angular.element(document.querySelector('#priceProduct')).text();
        return data;
    };

    $scope.getDetailsCustomer = function () {
        var data = {
            name: angular.element(document.querySelector('#nameCustomer')).val(),
            surname: angular.element(document.querySelector('#surnameCustomer')).val(),
            telCustomer: angular.element(document.querySelector('#telCustomer')).val()
        };
        var result = angular.toJson(data);
        return data;
    };

    $scope.addCart = function () {
        var data = $scope.getDetailsProduct();
        cart.addItem(data);
        $scope.updateDataCart();
    };

    $scope.sendOrder = function () {

        var dataObj = $scope.listProduct1;
        var res = $http.post('/product/checkout', dataObj);
        res.success(function (data, status, headers, config) {
            $window.location.href = '/checkout/success';
            cart.clear();

        });
        res.error(function (data, status, headers, config) {
            alert("failure message: " + JSON.stringify({data: data}));
        });
    }
}]);

cartApp.controller('cartCtrl', ['cartService', '$scope', function (cart, $scope) {
    cart.init();
    $scope.listProduct = cart.getAll();
    $scope.cartInfoDetails = true;
    $scope.infoCustomer = false;
    $scope.cartInfo = false;

    $scope.checkout = function () {
        $scope.cartInfoDetails = false;
        $scope.infoCustomer = true;
        $scope.cartInfo = true;
    }
    $scope.orderDetails = function () {
        $scope.cartInfoDetails = true;
        $scope.infoCustomer = false;
        $scope.cartInfo = false;
    }

    $scope.add = function () {
        $scope.cartCurrent = "add";
        $scope.updateDataCart();
    };
    $scope.remove = function (index) {
        cart.removeItem(index);
        $scope.listProduct.splice(index, 1);
        $scope.updateDataCart();
    };
    $scope.totalSum = cart.priceTotal();

    $scope.updateDataCart = function () {
        $scope.totalSum = cart.priceTotal();
        $scope.sizeCart = cart.sizeCart();
    };
    $scope.changeQuantity = function (index) {
        cart.updateQuantity(index, $scope.listProduct[index].quantity);
        $scope.updateDataCart();
    };

    $scope.clear = function () {
        cart.clear();
        window.location.reload();
    };
    $scope.sizeCart = cart.sizeCart();
}]);
