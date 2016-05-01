var PersonnelAcknowledgementsController = Paloma.controller("PersonnelAcknowledgements");
app.controller("PersonnelAcknowledgementsController", ["$scope", "$http", "$mdToast", "$mdDialog", "$mdEditDialog", "$mdMedia", 'apiService', function ($scope, $http, $mdToast, $mdDialog, $mdEditDialog, $mdMedia, apiService) {

    $scope.personnelAcknowledgements = [];

    $scope.editing = false;

    $scope.query = {
        order: 'id',
        limit: 15,
        page: 1,
        filter: ""
    };

    PersonnelAcknowledgementsController.prototype.index = function () {
        $scope.new_personnel_acknowledgement_dialog_template_url = this.params.new_personnel_acknowledgement_dialog_template_url;

        $scope.personnelAcknowledgementsPromise = $http.get(apiService.personnel_acknowledgements_url, { 'params' : { 'format': 'json' } }).then(
            function success(response) {
                for (var i = 0; i < response.data.length; i++) {
                    var personnelAcknowledgement = response.data[i].personnel_acknowledgement;
                    if (indexOfItemWithID(personnelAcknowledgement.id, $scope.personnelAcknowledgements) == -1) {
                        $scope.personnelAcknowledgements.push(personnelAcknowledgement);
                    }
                }
            }, $scope.ajaxFailure
        );

        $scope.$apply();
    };

    $scope.done = function () {
        $scope.editing = !$scope.editing;
    };

    $scope.editName = function (event, personnelAcknowledgementToUpdate) {
        if ($scope.editing) {
            $mdEditDialog.large({
                modelValue: personnelAcknowledgementToUpdate.name,
                placeholder: "Name",
                clickOutsideToClose: false,
                escToClose: false,
                targetEvent: event,
                title: 'Edit Personnel Acknowledgement Name',
                validators: {
                    'required': true
                },
                messages: {
                    'required': 'Name is required'
                },
                save: function (input) {
                    var index = indexOfItemWithID(personnelAcknowledgementToUpdate.id, $scope.personnelAcknowledgements);
                    if (index != -1) {
                        var personnelAcknowledgement = $scope.personnelAcknowledgements[index];
                        personnelAcknowledgement.name = input.$modelValue;
                        $http.patch(apiService.personnel_acknowledgements_url + personnelAcknowledgement.id, buildRequest(personnelAcknowledgement)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                    }
                }
            });
        }
    };

    $scope.editRole = function (event, personnelAcknowledgementToUpdate) {
        if ($scope.editing) {
            $mdEditDialog.large({
                modelValue: personnelAcknowledgementToUpdate.role,
                placeholder: "Role",
                clickOutsideToClose: false,
                escToClose: false,
                targetEvent: event,
                title: 'Edit Personnel Acknowledgement Role',
                save: function (input) {
                    var index = indexOfItemWithID(personnelAcknowledgementToUpdate.id, $scope.personnelAcknowledgements);
                    if (index != -1) {
                        var personnelAcknowledgement = $scope.personnelAcknowledgements[index];
                        personnelAcknowledgement.role = input.$modelValue;
                        $http.patch(apiService.personnel_acknowledgements_url + personnelAcknowledgement.id, buildRequest(personnelAcknowledgement)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                    }
                }
            });
        }
    };

    $scope.editNotes = function (event, personnelAcknowledgementToUpdate) {
        if ($scope.editing) {
            $mdEditDialog.large({
                modelValue: personnelAcknowledgementToUpdate.notes,
                placeholder: "Notes",
                clickOutsideToClose: false,
                escToClose: false,
                targetEvent: event,
                title: 'Edit Personnel Acknowledgement Notes',
                save: function (input) {
                    var index = indexOfItemWithID(personnelAcknowledgementToUpdate.id, $scope.personnelAcknowledgements);
                    if (index != -1) {
                        var personnelAcknowledgement = $scope.personnelAcknowledgements[index];
                        personnelAcknowledgement.notes = input.$modelValue;
                        $http.patch(apiService.personnel_acknowledgements_url + personnelAcknowledgement.id, buildRequest(personnelAcknowledgement)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                    }
                }
            });
        }
    };

    $scope.delete = function (personnelAcknowledgementToDelete) {
        var index = indexOfItemWithID(personnelAcknowledgementToDelete.id, $scope.personnelAcknowledgements);
        if (index != -1) {
            $scope.personnelAcknowledgements.splice(index, 1);
            $http.delete(apiService.personnel_acknowledgements_url + personnelAcknowledgementToDelete.id, { 'params' : { 'format': 'json' } }).then($scope.ajaxSuccess, $scope.ajaxFailure);
        }
    };

    $scope.newPersonnelAcknowledgement = function (event) {
        $mdDialog.show({
            controller: NewPersonnelAcknowledgementController,
            templateUrl: $scope.new_personnel_acknowledgement_dialog_template_url,
            parent: angular.element(document.body),
            targetEvent: event,
            clickOutsideToClose: false,
            escapeToClose: false,
            fullscreen: $mdMedia('xs') || $mdMedia('sm')
        }).then(function (newPersonnelAcknowledgement) {
            $http.post(apiService.personnel_acknowledgements_url, buildRequest(newPersonnelAcknowledgement)).then(function(response) {
                if (response.config.method === 'POST' && response.status === 200) {
                    $scope.personnelAcknowledgements.push(response.data.personnel_acknowledgement);
                }
                $scope.ajaxSuccess(response);
            }, $scope.ajaxFailure);
        });
    };

    $scope.limitOptions = [10, 15, 20, {
        label: 'All',
        value: $scope.personnelAcknowledgements.length
    }];

}]);