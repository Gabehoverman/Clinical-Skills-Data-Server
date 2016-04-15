var SystemsController = Paloma.controller("Systems");
app.controller("SystemsController", ["$scope", "$http", "$mdToast", "$mdDialog", "$mdEditDialog", "$mdMedia", function ($scope, $http, $mdToast, $mdDialog, $mdEditDialog, $mdMedia) {

    $scope.systems = [];
    $scope.allComponents = [];
    $scope.allExamTechniques = [];

    $scope.editing = false;

    $scope.query = {
        order: 'name',
        limit: 10,
        page: 1,
        filter: ""
    };

    SystemsController.prototype.index = function () {
        $scope.systems_url = this.params.systems_url;
        $scope.system_patch_url = this.params.system_patch_url;
        $scope.system_post_url = this.params.system_post_url;
        $scope.components_url = this.params.components_url;
        $scope.exam_techniques_url = this.params.exam_techniques_url;
        $scope.new_system_dialog_template_url = this.params.new_system_dialog_template_url;
        $scope.edit_components_dialog_template_url = this.params.edit_components_dialog_template_url;
        $scope.edit_exam_techniques_dialog_template_url = this.params.edit_exam_techniques_dialog_template_url;

        $scope.systemsPromise = $http.get($scope.systems_url, {'format': 'json'}).then(
            function success(response) {
                for (var i = 0; i < response.data.length; i++) {
                    var system = response.data[i].system;
                    $scope.systems.push(system);
                }
            }, $scope.ajaxFailure
        );

        $scope.componentsPromise = $http.get($scope.components_url, {'format': 'json'}).then(
            function success(response) {
                for (var i = 0; i < response.data.length; i++) {
                    var component = response.data[i].component;
                    $scope.allComponents.push(component);
                }
            }, $scope.ajaxFailure
        );

        $scope.examTechniquesPromise = $http.get($scope.exam_techniques_url, {'format': 'json'}).then(
            function success(response) {
                for (var i = 0; i < response.data.length; i++) {
                    var exam_technique = response.data[i].exam_technique;
                    $scope.allExamTechniques.push(exam_technique);
                }
            }, $scope.ajaxFailure
        );

        $scope.$apply();
    };

    $scope.done = function () {
        $scope.editing = !$scope.editing;
    };

    $scope.editName = function (event, systemToUpdate) {
        if ($scope.editing) {
            $mdEditDialog.small({
                modelValue: systemToUpdate.name,
                placeholder: "Name",
                targetEvent: event,
                save: function (input) {
                    var index = indexOfItemWithID(systemToUpdate.id, $scope.systems);
                    if (index != -1) {
                        var system = $scope.systems[index];
                        system.name = input.$modelValue;
                        $http.patch($scope.system_patch_url + "/" + system.id, buildRequest(system)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                    }
                }
            });
        }
    };

    $scope.editDetails = function (event, systemToUpdate) {
        if ($scope.editing) {
            $mdEditDialog.small({
                modelValue: systemToUpdate.details,
                placeholder: "Details",
                targetEvent: event,
                save: function (input) {
                    var index = indexOfItemWithID(systemToUpdate.id, $scope.systems);
                    if (index != -1) {
                        var system = $scope.systems[index];
                        system.details = input.$modelValue;
                        $http.patch($scope.system_patch_url + "/" + system.id, buildRequest(system)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                    }
                }
            });
        }
    };

    $scope.editComponents = function (event, systemToUpdate) {
        $mdDialog.show({
            controller: EditComponentsController,
            templateUrl: $scope.edit_components_dialog_template_url,
            parent: angular.element(document.body),
            targetEvent: event,
            clickOutsideToClose: false,
            escapeToClose: false,
            locals: {
                system: systemToUpdate,
                components: systemToUpdate.components,
                allComponents: $scope.allComponents,
                editing: $scope.editing
            },
            fullscreen: $mdMedia('xs') || $mdMedia('sm')
        }).then(function (components) {
            if (components) {
                var index = indexOfItemWithID(systemToUpdate.id, $scope.systems);
                if (index != -1) {
                    $scope.systems[index].components = components;
                    var system = $scope.systems[index];
                    $http.patch($scope.system_patch_url + "/" + system.id, buildRequest(system)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                }
            }
        });
    };

    $scope.editExamTechniques = function (event, systemToUpdate) {
        $mdDialog.show({
            controller: EditExamTechniquesDialogController,
            templateUrl: $scope.edit_exam_techniques_dialog_template_url,
            parent: angular.element(document.body),
            targetEvent: event,
            clickOutsideToClose: false,
            escapeToClose: false,
            locals: {
                system: systemToUpdate,
                exam_techniques: systemToUpdate.exam_techniques,
                allExamTechniques: $scope.allExamTechniques,
                editing: $scope.editing
            },
            fullscreen: $mdMedia('xs') || $mdMedia('sm')
        }).then(function (examTechniques) {
            if (examTechniques) {
                var index = indexOfItemWithID(systemToUpdate.id, $scope.systems);
                if (index != -1) {
                    $scope.systems[index].exam_techniques = examTechniques;
                    var system = $scope.systems[index];
                    $http.patch($scope.system_patch_url + "/" + system.id, buildRequest(system)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                }
            }
        });
    };

    $scope.delete = function (systemToDelete) {
        var index = indexOfItemWithID(systemToDelete.id, $scope.systems);
        if (index != -1) {
            $scope.systems.splice(index, 1);
            $http.delete($scope.system_patch_url + "/" + systemToDelete.id + ".json").then($scope.ajaxSuccess, $scope.ajaxFailure);
        }
    };

    $scope.newSystem = function (event) {
        $mdDialog.show({
            controller: NewSystemDialogController,
            templateUrl: $scope.new_system_dialog_template_url,
            parent: angular.element(document.body),
            targetEvent: event,
            clickOutsideToClose: false,
            escapeToClose: false,
            fullscreen: $mdMedia('xs') || $mdMedia('sm')
        }).then(function (newSystem) {
            $http.post($scope.system_post_url, buildRequest(newSystem)).then($scope.ajaxSuccess, $scope.ajaxFailure);
        });
    };

    $scope.ajaxSuccess = function (response) {
        var text = "";
        if (response.config.method === 'POST' && response.status === 200) {
            $scope.systems.push(response.data.system);
        }

        if (response.status === 200) {
            text = "Success!";
        } else {
            text = response.status + ": " + response.statusText;
        }

        $mdToast.show($mdToast.simple().textContent(text).capsule(true).hideDelay(2000).position('top right'));
    };

    $scope.ajaxFailure = function (response) {
        var text = response.status + ": " + response.statusText;
        $mdToast.show($mdToast.simple().textContent(text).capsule(true).hideDelay(2000).position('top right'));
    };

}]);
