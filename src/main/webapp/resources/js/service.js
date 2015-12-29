'use strict'

angular.module('customService', ['ngCookies']).

    factory('cartService', ['$cookies', function ($cookies) {

        var cart = {

            nameCookie: 'products',
            tempArray: [],

            init: function () {
                if ($cookies.get(this.nameCookie) == "" || $cookies.get(this.nameCookie) == undefined)
                    $cookies.put(this.nameCookie, '', {path: '/'});
            },

            clear: function () {
                $cookies.put(this.nameCookie, '', {path: '/'});
            },

            getAll: function () {
                if ($cookies.get(this.nameCookie) != "") {
                    var result = JSON.parse($cookies.get(this.nameCookie));
                } else {
                    var result = [];
                }
                return result;
            },

            getAllJSON: function () {
                if ($cookies.get(this.nameCookie) != "") {
                    var result = $cookies.get(this.nameCookie);
                } else {
                    var result = [];
                }
                return result;
            },

            addItem: function (item) {
                var quantity = 1;
                var isItem = -1;

                if ($cookies.get(this.nameCookie) != "")
                    this.tempArray = JSON.parse($cookies.get(this.nameCookie));

                for (var i = 0; i < this.tempArray.length; i++) {
                    if (this.tempArray[i].idProduct == item.idProduct) {
                        isItem = i;
                        break;
                    }
                }
                if (isItem >= 0) {
                    this.tempArray[isItem].quantity++;
                }
                else {
                    this.tempArray.push({
                        idProduct: item.idProduct,
                        quantity: quantity,
                        price: item.price,
                        imageSmall: item.imageSmall,
                        name: item.name
                    });
                }

                $cookies.put(this.nameCookie, JSON.stringify(this.tempArray), {path: '/'});
            },

            getItemByIndex: function (index) {
                if ($cookies.get(this.nameCookie) != "") {
                    var result = JSON.parse($cookies.get(this.nameCookie));
                } else {
                    var result = [];
                }
                return result;
            },

            updateQuantity: function (index, quantity) {
                var items = JSON.parse($cookies.get(this.nameCookie));
                items[index].quantity = quantity;
                $cookies.put(this.nameCookie, JSON.stringify(items), {path: '/'})
            },

            removeItem: function (index) {
                var items = JSON.parse($cookies.get(this.nameCookie));
                items.splice(index, 1);
                $cookies.put(this.nameCookie, JSON.stringify(items), {path: '/'});
            },

            totalItems: function (index) {
                var quantity = 0;
                if ($cookies.get(this.nameCookie) != "") {
                    var items = JSON.parse($cookies.get(this.nameCookie));
                } else {
                    var items = [];
                }
                for (var i = 0; i < items.length; i++) {
                    quantity += items[i].quantity;
                }
                return quantity;

            },

            sizeCart: function () {
                if ($cookies.get(this.nameCookie) != "") {
                    var items = JSON.parse($cookies.get(this.nameCookie));
                } else {
                    var items = [];
                }
                var quantityTotal = Number(0);
                for (var i = 0; i < items.length; i++) {
                    quantityTotal += Number(items[i].quantity);
                }
                return quantityTotal;
            },

            priceTotal: function () {
                var total = 0;
                if ($cookies.get(this.nameCookie) != "") {
                    var items = JSON.parse($cookies.get(this.nameCookie));
                } else {
                    var items = [];
                }
                for (var i = 0; i < items.length; i++) {
                    total += this.subTotal(items[i]);
                }
                return total;
            },

            subTotal: function (item) {
                return item.price * item.quantity;
            }

        };
        return cart;

    }]);