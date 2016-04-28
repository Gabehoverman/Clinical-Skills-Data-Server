var LandingController = Paloma.controller("Landing");
app.controller("LandingController", ["$scope", "$http", "$mdMedia", "apiService", function ($scope, $http, $mdMedia, apiService) {

    LandingController.prototype.index = function () {
        $scope.resources = this.params.resources;
        $scope.$apply()
    };

}]);
