var DashboardController = Paloma.controller("Dashboard");
app.controller("DashboardController", ["$scope", function ($scope) {

    DashboardController.prototype.index = function () {
        $scope.resources = this.params.resources;
        $scope.$apply()
    };

    $scope.navigate = function (resource) {
        window.location = resource.link;
    };

}]);
