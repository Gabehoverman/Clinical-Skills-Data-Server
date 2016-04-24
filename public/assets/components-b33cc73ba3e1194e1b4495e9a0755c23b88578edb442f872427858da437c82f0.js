var ComponentsController = Paloma.controller('Components');
app.controller("ComponentsController", ["$scope", "$http", "$mdToast", "$mdDialog", "$mdEditDialog", "$mdMedia", 'apiService', function ($scope, $http, $mdToast, $mdDialog, $mdEditDialog, $mdMedia, apiService) {

    $scope.components = [];
    $scope.allSystems = [];
    $scope.allMuscles = [];
    $scope.allPalpations = [];
    $scope.allRangesOfMotion = [];
    $scope.allSpecialTests = [];

    $scope.editing = false;

    $scope.query = {
        order: 'name',
        limit: 10,
        page: 1,
        filter: ""
    };

    ComponentsController.prototype.index = function () {
        $scope.new_component_dialog_template_url = this.params.new_component_dialog_template_url;
        $scope.edit_muscles_dialog_template_url = this.params.edit_muscles_dialog_template_url;
        $scope.edit_palpations_dialog_template_url = this.params.edit_palpations_dialog_template_url;
        $scope.edit_ranges_of_motion_dialog_template_url = this.params.edit_ranges_of_motion_dialog_template_url;
        $scope.edit_special_tests_dialog_template_url = this.params.edit_special_tests_dialog_template_url;
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

        $scope.musclesPromise = $http.get(apiService.muscles_url, { 'params' : { 'format': 'json' } }).then(
            function success(response) {
                for (var i = 0; i < response.data.length; i++) {
                    var muscle = response.data[i].muscle;
                    if (indexOfItemWithID(muscle.id, $scope.allMuscles) == -1) {
                        $scope.allMuscles.push(muscle);
                    }
                }
            }, $scope.ajaxFailure
        );

        $scope.palpationsPromise = $http.get(apiService.palpations_url, { 'params' : { 'format': 'json' } }).then(
            function success(response) {
                for (var i = 0; i < response.data.length; i++) {
                    var palpation = response.data[i].palpation;
                    if (indexOfItemWithID(palpation.id, $scope.allPalpations) == -1) {
                        $scope.allPalpations.push(palpation);
                    }
                }
            }, $scope.ajaxFailure
        );

        $scope.rangesOfMotionPromise = $http.get(apiService.ranges_of_motion_url, { 'params' : { 'format': 'json' } }).then(
            function success(response) {
                for (var i = 0; i < response.data.length; i++) {
                    var range_of_motion = response.data[i].range_of_motion;
                    if (indexOfItemWithID(range_of_motion.id, $scope.allRangesOfMotion) == -1) {
                        $scope.allRangesOfMotion.push(range_of_motion);
                    }
                }
            }, $scope.ajaxFailure
        );

        $scope.specialTestsPromise = $http.get(apiService.special_tests_url, { 'params' : { 'format': 'json' } }).then(
            function success(response) {
                for (var i = 0; i < response.data.length; i++) {
                    var specialTest = response.data[i].special_test;
                    if (indexOfItemWithID(specialTest.id, $scope.allSpecialTests) == -1) {
                        $scope.allSpecialTests.push(specialTest);
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

    $scope.editMuscles = function(event, componentToUpdate) {
        $mdDialog.show({
            controller: EditMusclesController,
            templateUrl: $scope.edit_muscles_dialog_template_url,
            parent: angular.element(document.body),
            targetEvent: event,
            clickOutsideToClose: false,
            escapeToClose: false,
            locals: {
                component: componentToUpdate,
                allMuscles: $scope.allMuscles,
                editing: $scope.editing
            },
            fullscreen: $mdMedia('xs') || $mdMedia('sm')
        }).then(function (muscles) {
            if (muscles) {
                var index = indexOfItemWithID(componentToUpdate.id, $scope.components);
                if (index != -1) {
                    $scope.components[index].muscles = muscles;
                    var component = $scope.components[index];
                    $http.patch(apiService.components_url + component.id, buildRequest(component)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                }
            }
        });
    };

    $scope.editPalpations = function(event, componentToUpdate) {
        $mdDialog.show({
            controller: EditPalpationsController,
            templateUrl: $scope.edit_palpations_dialog_template_url,
            parent: angular.element(document.body),
            targetEvent: event,
            clickOutsideToClose: false,
            escapeToClose: false,
            locals: {
                component: componentToUpdate,
                allPalpations: $scope.allPalpations,
                editing: $scope.editing
            },
            fullscreen: $mdMedia('xs') || $mdMedia('sm')
        }).then(function (palpations) {
            if (palpations) {
                var index = indexOfItemWithID(componentToUpdate.id, $scope.components);
                if (index != -1) {
                    $scope.components[index].palpations = palpations;
                    var component = $scope.components[index];
                    $http.patch(apiService.components_url + component.id, buildRequest(component)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                }
            }
        });
    };

    $scope.editRangesOfMotion = function(event, componentToUpdate) {
        $mdDialog.show({
            controller: EditRangeOfMotionsController,
            templateUrl: $scope.edit_ranges_of_motion_dialog_template_url,
            parent: angular.element(document.body),
            targetEvent: event,
            clickOutsideToClose: false,
            escapeToClose: false,
            locals: {
                component: componentToUpdate,
                allRangesOfMotion: $scope.allRangesOfMotion,
                editing: $scope.editing
            },
            fullscreen: $mdMedia('xs') || $mdMedia('sm')
        }).then(function (rangesOfMotion) {
            if (rangesOfMotion) {
                var index = indexOfItemWithID(componentToUpdate.id, $scope.components);
                if (index != -1) {
                    $scope.components[index].range_of_motions = rangesOfMotion;
                    var component = $scope.components[index];
                    $http.patch(apiService.components_url + component.id, buildRequest(component)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                }
            }
        });
    };

    $scope.editSpecialTests = function(event, componentToUpdate) {
        $mdDialog.show({
            controller: EditSpecialTestsController,
            templateUrl: $scope.edit_special_tests_dialog_template_url,
            parent: angular.element(document.body),
            targetEvent: event,
            clickOutsideToClose: false,
            escapeToClose: false,
            locals: {
                component: componentToUpdate,
                allSpecialTests: $scope.allSpecialTests,
                editing: $scope.editing
            },
            fullscreen: $mdMedia('xs') || $mdMedia('sm')
        }).then(function (specialTests) {
            if (specialTests) {
                var index = indexOfItemWithID(componentToUpdate.id, $scope.components);
                if (index != -1) {
                    $scope.components[index].special_tests = specialTests;
                    var component = $scope.components[index];
                    $http.patch(apiService.components_url + component.id, buildRequest(component)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                }
            }
        });
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
