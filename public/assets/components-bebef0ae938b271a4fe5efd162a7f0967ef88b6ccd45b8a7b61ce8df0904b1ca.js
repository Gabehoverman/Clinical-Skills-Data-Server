var ComponentsController = Paloma.controller('Components');
app.controller("ComponentsController", ["$scope", "$http", "$mdToast", "$mdDialog", "$mdEditDialog", "$mdMedia", 'apiService', function ($scope, $http, $mdToast, $mdDialog, $mdEditDialog, $mdMedia, apiService) {

    $scope.components = [];
    $scope.allSystems = [];

    $scope.editing = false;

    $scope.query = {
        order: 'name',
        limit: 10,
        page: 1,
        filter: ""
    };

    ComponentsController.prototype.index = function () {
        $scope.new_component_dialog_template_url = this.params.new_component_dialog_template_url;
        $scope.componentsPromise = $http.get(apiService.components_url, { 'params' : { 'format': 'json' } }).then(
            function success(response) {
                for (var i = 0; i < response.data.length; i++) {
                    var component = response.data[i].component;
                    $scope.components.push(component);
                }
            }, $scope.ajaxFailure
        );

        $scope.systemsPromise = $http.get(apiService.systems_url, { 'params' : { 'format': 'json' } }).then(
            function success(response) {
                for (var i = 0; i < response.data.length; i++) {
                    var system = response.data[i].system;
                    if (indexOfItemWithID(system.id, $scope.allSystems) == -1) {
                        $scope.allSystems.push(system);
                    }
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

    $scope.editSystem = function(componentToUpdate) {
        $http.patch(apiService.components_url + componentToUpdate.id, buildRequest(componentToUpdate)).then($scope.ajaxSuccess, $scope.ajaxFailure);
    };

    $scope.newComponent = function(event) {
        $mdDialog.show({
            controller: NewComponentDialogController,
            templateUrl: $scope.new_component_dialog_template_url,
            parent: angular.element(document.body),
            targetEvent: event,
            clickOutsideToClose: false,
            escapeToClose: false,
            fullscreen: $mdMedia('xs') || $mdMedia('sm'),
            locals: {
                allSystems: $scope.allSystems
            }
        }).then(function (newComponent) {
            $http.post(apiService.components_url, buildRequest(newComponent)).then(function(response) {
                if (response.config.method === 'POST' && response.status === 200) {
                    $scope.components.push(response.data.component);
                }
                $scope.ajaxSuccess(response);
            }, $scope.ajaxFailure);
        });
    };

    $scope.delete = function (componentToDelete) {
        var index = indexOfItemWithID(componentToDelete.id, $scope.components);
        if (index != -1) {
            $scope.components.splice(index, 1);
            $http.delete(apiService.components_url + componentToDelete.id, { 'params' : { 'format': 'json' } }).then($scope.ajaxSuccess, $scope.ajaxFailure);
        }
    };

}]);
