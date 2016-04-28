var LandingController = Paloma.controller("Landing");
app.controller("LandingController", ["$scope", function ($scope) {

    LandingController.prototype.index = function () {
        $scope.resources = this.params.resources;
        $scope.$apply()
    };

    $scope.navigate = function (resource) {
        window.location = resource.link;
    };

}]);