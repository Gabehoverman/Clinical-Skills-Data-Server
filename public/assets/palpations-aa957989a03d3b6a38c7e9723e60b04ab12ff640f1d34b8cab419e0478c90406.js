var PalpationsController = Paloma.controller("Palpations");
app.controller("PalpationsController", ["$scope", "$http", "$mdToast", "$mdDialog", "$mdEditDialog", "$mdMedia", 'apiService', function ($scope, $http, $mdToast, $mdDialog, $mdEditDialog, $mdMedia, apiService) {

    $scope.palpations = [];
    $scope.allComponents = [];

    $scope.editing = false;

    $scope.query = {
        order: 'structure',
        limit: 15,
        page: 1,
        filter: ""
    };

    PalpationsController.prototype.index = function () {
        $scope.new_palpation_dialog_template_url = this.params.new_palpation_dialog_template_url;

        $scope.palpationsPromise = $http.get(apiService.palpations_url, { 'params' : { 'format': 'json' } }).then(
            function success(response) {
                for (var i = 0; i < response.data.length; i++) {
                    var palpation = response.data[i].palpation;
                    if (indexOfItemWithID(palpation.id, $scope.palpations) == -1) {
                        $scope.palpations.push(palpation);
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

    $scope.editStructure = function (event, palpationToUpdate) {
        if ($scope.editing) {
            $mdEditDialog.large({
                modelValue: palpationToUpdate.structure,
                placeholder: "Structure",
                clickOutsideToClose: false,
                escToClose: false,
                targetEvent: event,
                title: 'Edit Palpation Structure',
                validators: {
                    'required': true
                },
                messages: {
                    'required': 'Structure is required'
                },
                save: function (input) {
                    var index = indexOfItemWithID(palpationToUpdate.id, $scope.palpations);
                    if (index != -1) {
                        var palpation = $scope.palpations[index];
                        palpation.structure = input.$modelValue;
                        $http.patch(apiService.palpations_url + palpation.id, buildRequest(palpation)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                    }
                }
            });
        }
    };

    $scope.editComponent = function(palpationToUpdate) {
        $http.patch(apiService.palpations_url + palpationToUpdate.id, buildRequest(palpationToUpdate)).then($scope.ajaxSuccess, $scope.ajaxFailure);
    };

    $scope.editDetails = function (event, palpationToUpdate) {
        if ($scope.editing) {
            $mdEditDialog.large({
                modelValue: palpationToUpdate.details,
                placeholder: "Details",
                clickOutsideToClose: false,
                escToClose: false,
                targetEvent: event,
                title: 'Edit Palpation Details',
                save: function (input) {
                    var index = indexOfItemWithID(palpationToUpdate.id, $scope.palpations);
                    if (index != -1) {
                        var palpation = $scope.palpations[index];
                        palpation.details = input.$modelValue;
                        $http.patch(apiService.palpations_url + palpation.id, buildRequest(palpation)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                    }
                }
            });
        }
    };

    $scope.editNotes = function (event, palpationToUpdate) {
        if ($scope.editing) {
            $mdEditDialog.large({
                modelValue: palpationToUpdate.notes,
                placeholder: "Notes",
                clickOutsideToClose: false,
                escToClose: false,
                targetEvent: event,
                title: 'Edit Palpation Notes',
                save: function (input) {
                    var index = indexOfItemWithID(palpationToUpdate.id, $scope.palpations);
                    if (index != -1) {
                        var palpation = $scope.palpations[index];
                        palpation.notes = input.$modelValue;
                        $http.patch(apiService.palpations_url + palpation.id, buildRequest(palpation)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                    }
                }
            });
        }
    };

    $scope.delete = function (palpationToDelete) {
        var index = indexOfItemWithID(palpationToDelete.id, $scope.palpations);
        if (index != -1) {
            $scope.palpations.splice(index, 1);
            $http.delete(apiService.palpations_url + palpationToDelete.id, { 'params' : { 'format': 'json' } }).then($scope.ajaxSuccess, $scope.ajaxFailure);
        }
    };

    $scope.newPalpation = function (event) {
        $mdDialog.show({
            controller: NewPalpationDialogController,
            templateUrl: $scope.new_palpation_dialog_template_url,
            parent: angular.element(document.body),
            targetEvent: event,
            clickOutsideToClose: false,
            escapeToClose: false,
            fullscreen: $mdMedia('xs') || $mdMedia('sm'),
            locals: {
                allComponents: $scope.allComponents
            }
        }).then(function (newPalpation) {
            $http.post(apiService.palpations_url, buildRequest(newPalpation)).then(function(response) {
                if (response.config.method === 'POST' && response.status === 200) {
                    console.log(response.data.palpation);
                    $scope.palpations.push(response.data.palpation);
                }
                $scope.ajaxSuccess(response);
            }, $scope.ajaxFailure);
        });
    };

    $scope.limitOptions = [10, 15, 20, {
        label: 'All',
        value: $scope.palpations.length
    }];

}]);
