var LandingController = Paloma.controller("Landing");
app.controller("LandingController", ["$scope", "$http", "apiService", function ($scope, $http, apiService) {

    LandingController.prototype.index = function () {
        $scope.resources = this.params.resources;
        console.log($scope.resources);
        $scope.$apply();
    };

}]);
