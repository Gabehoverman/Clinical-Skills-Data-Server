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
                    $scope.components.push(component);
                }
            }, $scope.ajaxFailure
        );

        $scope.$apply();
    };

    $scope.done = function () {
        $scope.editing = !$scope.editing;
    };

    $scope.editName = function(event, componentToUpdate) {
        if ($scope.editing) {
            $mdEditDialog.large({
                modelValue: componentToUpdate.name,
                placeholder: "Name",
                clickOutsideToClose: false,
                escToClose: false,
                targetEvent: event,
                title: 'Edit Component Name',
                validators: {
                    'required': true
                },
                messages: {
                    'required': 'Name is required'
                },
                save: function (input) {
                    var index = indexOfItemWithID(componentToUpdate.id, $scope.components);
                    if (index != -1) {
                        var component = $scope.components[index];
                        component.name = input.$modelValue;
                        $http.patch(apiService.components_url + component.id, buildRequest(component)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                    }
                }
            });
        }
    };

    $scope.editInspection = function (event, componentToUpdate) {
        if ($scope.editing) {
            $mdEditDialog.large({
                modelValue: componentToUpdate.inspection,
                placeholder: "Inspection",
                clickOutsideToClose: false,
                escToClose: false,
                targetEvent: event,
                title: 'Edit Component Inspection',
                save: function (input) {
                    var index = indexOfItemWithID(componentToUpdate.id, $scope.components);
                    if (index != -1) {
                        var component = $scope.components[index];
                        component.inspection = input.$modelValue;
                        $http.patch(apiService.components_url + component.id, buildRequest(component)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                    }
                }
            });
        }
    };

    $scope.editNotes = function (event, componentToUpdate) {
        if ($scope.editing) {
            $mdEditDialog.large({
                modelValue: componentToUpdate.notes,
                placeholder: "Notes",
                clickOutsideToClose: false,
                escToClose: false,
                targetEvent: event,
                title: 'Edit Component Notes',
                save: function (input) {
                    var index = indexOfItemWithID(componentToUpdate.id, $scope.components);
                    if (index != -1) {
                        var component = $scope.components[index];
                        component.notes = input.$modelValue;
                        $http.patch(apiService.components_url + component.id, buildRequest(component)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                    }
                }
            });
        }
    };

    $scope.delete = function (componentToDelete) {
        var index = indexOfItemWithID(componentToDelete.id, $scope.components);
        if (index != -1) {
            $scope.components.splice(index, 1);
            $http.delete(apiService.components_url + componentToDelete.id, { 'params' : { 'format': 'json' } }).then($scope.ajaxSuccess, $scope.ajaxFailure);
        }
    };

}]);