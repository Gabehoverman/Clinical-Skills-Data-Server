var ComponentsController = Paloma.controller('Components');
app.controller("ComponentsController", ["$scope", "$http", "$mdToast", "$mdDialog", "$mdEditDialog", "$mdMedia", 'apiService', function ($scope, $http, $mdToast, $mdDialog, $mdEditDialog, $mdMedia, apiService) {

    $scope.components = [];

    $scope.editing = false;

    $scope.query = {
        order: 'name',
        limit: 10,
        page: 1,
        filter: ""
    };

    ComponentsController.prototype.index = function () {
        $scope.componentsPromise = $http.get(apiService.components_url, { 'params' : { 'format': 'json' } }).then(
            function success(response) {
                for (var i = 0; i < response.data.length; i++) {
                    var component = response.data[i].component;
                    console.log(component);
                    $scope.components.push(component);
                }
            }, $scope.ajaxFailure
        );

        $scope.$apply();
    };

    $scope.done = function () {
        $scope.editing = !$scope.editing;
    };

    $scope.delete = function (componentToDelete) {
        var index = indexOfItemWithID(componentToDelete.id, $scope.components);
        if (index != -1) {
            $scope.components.splice(index, 1);
            $http.delete(apiService.components_url + componentToDelete.id, { 'params' : { 'format': 'json' } }).then($scope.ajaxSuccess, $scope.ajaxFailure);
        }
    };

}]);
