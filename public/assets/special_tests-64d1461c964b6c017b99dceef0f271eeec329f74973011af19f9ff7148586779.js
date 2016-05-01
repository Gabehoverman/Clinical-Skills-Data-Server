var SpecialTestsController = Paloma.controller("SpecialTests");
app.controller("SpecialTestsController", ["$scope", "$http", "$mdToast", "$mdDialog", "$mdEditDialog", "$mdMedia", 'apiService', function ($scope, $http, $mdToast, $mdDialog, $mdEditDialog, $mdMedia, apiService) {

    $scope.specialTests = [];
    $scope.allComponents = [];

    $scope.editing = false;

    $scope.query = {
        order: 'name',
        limit: 15,
        page: 1,
        filter: ""
    };

    SpecialTestsController.prototype.index = function () {
        $scope.new_special_test_dialog_template_url = this.params.new_special_test_dialog_template_url;

        $scope.specialTestsPromise = $http.get(apiService.special_tests_url, { 'params' : { 'format': 'json' } }).then(
            function success(response) {
                for (var i = 0; i < response.data.length; i++) {
                    var specialTest = response.data[i].special_test;
                    if (indexOfItemWithID(specialTest.id, $scope.specialTests) == -1) {
                        $scope.specialTests.push(specialTest);
                    }
                }
            }, $scope.ajaxFailure
        );

        $scope.componentsPromise = $http.get(apiService.components_url, { 'params' : { 'format': 'json' } }).then(
            function success(response) {
                for (var i = 0; i < response.data.length; i++) {
                    var component = response.data[i].component;
                    $scope.allComponents.push(component);
                }
            }, $scope.ajaxFailure
        );

        $scope.$apply();
    };

    $scope.done = function () {
        $scope.editing = !$scope.editing;
    };

    $scope.editName = function (event, specialTestToUpdate) {
        if ($scope.editing) {
            $mdEditDialog.large({
                modelValue: specialTestToUpdate.name,
                placeholder: "Name",
                clickOutsideToClose: false,
                escToClose: false,
                targetEvent: event,
                title: 'Edit SpecialTest Name',
                validators: {
                    'required': true
                },
                messages: {
                    'required': 'Name is required'
                },
                save: function (input) {
                    var index = indexOfItemWithID(specialTestToUpdate.id, $scope.specialTests);
                    if (index != -1) {
                        var specialTest = $scope.specialTests[index];
                        specialTest.name = input.$modelValue;
                        $http.patch(apiService.special_tests_url + specialTest.id, buildRequest(specialTest)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                    }
                }
            });
        }
    };

    $scope.editComponent = function(specialTestToUpdate) {
        $http.patch(apiService.special_tests_url + specialTestToUpdate.id, buildRequest(specialTestToUpdate)).then($scope.ajaxSuccess, $scope.ajaxFailure);
    };

    $scope.editPositiveSign = function (event, specialTestToUpdate) {
        if ($scope.editing) {
            $mdEditDialog.large({
                modelValue: specialTestToUpdate.positive_sign,
                placeholder: "Positive Sign",
                clickOutsideToClose: false,
                escToClose: false,
                targetEvent: event,
                title: 'Edit Special Test Positive Sign',
                validators: {
                    'required': true
                },
                messages: {
                    'required': 'Positive Sign is required'
                },
                save: function (input) {
                    var index = indexOfItemWithID(specialTestToUpdate.id, $scope.specialTests);
                    if (index != -1) {
                        var specialTest = $scope.specialTests[index];
                        specialTest.positive_sign = input.$modelValue;
                        $http.patch(apiService.special_tests_url + specialTest.id, buildRequest(specialTest)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                    }
                }
            });
        }
    };

    $scope.editIndication = function (event, specialTestToUpdate) {
        if ($scope.editing) {
            $mdEditDialog.large({
                modelValue: specialTestToUpdate.indication,
                placeholder: "Indication",
                clickOutsideToClose: false,
                escToClose: false,
                targetEvent: event,
                title: 'Edit Special Test Indication',
                validators: {
                    'required': true
                },
                messages: {
                    'required': 'Indication is required'
                },
                save: function (input) {
                    var index = indexOfItemWithID(specialTestToUpdate.id, $scope.specialTests);
                    if (index != -1) {
                        var specialTest = $scope.specialTests[index];
                        specialTest.indication = input.$modelValue;
                        $http.patch(apiService.special_tests_url + specialTest.id, buildRequest(specialTest)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                    }
                }
            });
        }
    };

    $scope.editNotes = function (event, specialTestToUpdate) {
        if ($scope.editing) {
            $mdEditDialog.large({
                modelValue: specialTestToUpdate.notes,
                placeholder: "Notes",
                clickOutsideToClose: false,
                escToClose: false,
                targetEvent: event,
                title: 'Edit Special Test Notes',
                save: function (input) {
                    var index = indexOfItemWithID(specialTestToUpdate.id, $scope.specialTests);
                    if (index != -1) {
                        var specialTest = $scope.specialTests[index];
                        specialTest.notes = input.$modelValue;
                        $http.patch(apiService.special_tests_url + specialTest.id, buildRequest(specialTest)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                    }
                }
            });
        }
    };

    $scope.delete = function (specialTestToDelete) {
        var index = indexOfItemWithID(specialTestToDelete.id, $scope.specialTests);
        if (index != -1) {
            $scope.specialTests.splice(index, 1);
            $http.delete(apiService.special_tests_url + specialTestToDelete.id, { 'params' : { 'format': 'json' } }).then($scope.ajaxSuccess, $scope.ajaxFailure);
        }
    };

    $scope.newSpecialTest = function (event) {
        $mdDialog.show({
            controller: NewSpecialTestDialogController,
            templateUrl: $scope.new_special_test_dialog_template_url,
            parent: angular.element(document.body),
            targetEvent: event,
            clickOutsideToClose: false,
            escapeToClose: false,
            fullscreen: $mdMedia('xs') || $mdMedia('sm'),
            locals: {
                allComponents: $scope.allComponents
            }
        }).then(function (newSpecialTest) {
            $http.post(apiService.special_tests_url, buildRequest(newSpecialTest)).then(function(response) {
                if (response.config.method === 'POST' && response.status === 200) {
                    $scope.specialTests.push(response.data.special_test);
                }
                $scope.ajaxSuccess(response);
            }, $scope.ajaxFailure);
        });
    };

    $scope.limitOptions = [10, 15, 20, {
        label: 'All',
        value: $scope.specialTests.length
    }];

}]);
