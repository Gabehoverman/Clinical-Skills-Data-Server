var ComponentsController = Paloma.controller('Components');
app.controller("ComponentsController", ["$scope", "$http", "$mdToast", "$mdDialog", "$mdEditDialog", "$mdMedia", function ($scope, $http, $mdToast, $mdDialog, $mdEditDialog, $mdMedia) {

    $scope.components = [];

    $scope.editing = false;

    $scope.query = {
        order: 'name',
        limit: 10,
        page: 1,
        filter: ""
    };

    ComponentsController.prototype.index = function () {
        $scope.components_url = this.params.components_url;

        $scope.componentsPromise = $http.get($scope.components_url, {'format': 'json'}).then(
            function success(response) {
                for (var i = 0; i < response.data.length; i++) {
                    var component = response.data[i].component;
                    $scope.components.push(component);
                }
            }, $scope.ajaxFailure
        );

        $scope.$apply();
    };

    $scope.done = function () {
        $scope.editing = !$scope.editing;
    };

}]);