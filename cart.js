var app = angular.module("cartApp", []);

app.controller("CartController", function ($scope, $http) {
    // Load cart items from JSON file
    $http.get("cart.json").then(function (response) {
        $scope.cartItems = response.data;
        $scope.updateTotal();
    });

    // Calculate Grand Total
    $scope.updateTotal = function () {
        $scope.grandTotal = $scope.cartItems.reduce(function (sum, item) {
            return sum + item.price * item.quantity;
        }, 0);
    };

    // Remove an item from cart
    $scope.removeItem = function (index) {
        $scope.cartItems.splice(index, 1);
        $scope.updateTotal();
    };

    // Highlight input field on focus
    $scope.highlightInput = function (event) {
        event.target.style.backgroundColor = "#f8f9fa";
    };

    // Checkout function (just an alert for now)
    $scope.checkout = function () {
        alert("Proceeding to Checkout - Total: $" + $scope.grandTotal.toFixed(2));
    };
});
