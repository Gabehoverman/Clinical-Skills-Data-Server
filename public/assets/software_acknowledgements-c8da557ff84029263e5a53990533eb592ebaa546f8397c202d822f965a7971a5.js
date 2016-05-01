var SoftwareAcknowledgementsController = Paloma.controller("SoftwareAcknowledgements");
app.controller("SoftwareAcknowledgementsController", ["$scope", "$http", "$mdToast", "$mdDialog", "$mdEditDialog", "$mdMedia", 'apiService', function ($scope, $http, $mdToast, $mdDialog, $mdEditDialog, $mdMedia, apiService) {

    $scope.softwareAcknowledgements = [];

    $scope.editing = false;

    $scope.query = {
        order: 'id',
        limit: 15,
        page: 1,
        filter: ""
    };

    SoftwareAcknowledgementsController.prototype.index = function () {
        $scope.new_software_acknowledgement_dialog_template_url = this.params.new_software_acknowledgement_dialog_template_url;

        $scope.softwareAcknowledgementsPromise = $http.get(apiService.software_acknowledgements_url, { 'params' : { 'format': 'json' } }).then(
            function success(response) {
                for (var i = 0; i < response.data.length; i++) {
                    var softwareAcknowledgement = response.data[i].software_acknowledgement;
                    if (indexOfItemWithID(softwareAcknowledgement.id, $scope.softwareAcknowledgements) == -1) {
                        $scope.softwareAcknowledgements.push(softwareAcknowledgement);
                    }
                }
            }, $scope.ajaxFailure
        );

        $scope.$apply();
    };

    $scope.done = function () {
        $scope.editing = !$scope.editing;
    };

    $scope.editName = function (event, softwareAcknowledgementToUpdate) {
        if ($scope.editing) {
            $mdEditDialog.large({
                modelValue: softwareAcknowledgementToUpdate.name,
                placeholder: "Name",
                clickOutsideToClose: false,
                escToClose: false,
                targetEvent: event,
                title: 'Edit Software Acknowledgement Name',
                validators: {
                    'required': true
                },
                messages: {
                    'required': 'Name is required'
                },
                save: function (input) {
                    var index = indexOfItemWithID(softwareAcknowledgementToUpdate.id, $scope.softwareAcknowledgements);
                    if (index != -1) {
                        var softwareAcknowledgement = $scope.softwareAcknowledgements[index];
                        softwareAcknowledgement.name = input.$modelValue;
                        $http.patch(apiService.software_acknowledgements_url + softwareAcknowledgement.id, buildRequest(softwareAcknowledgement)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                    }
                }
            });
        }
    };

    $scope.editLink = function (event, softwareAcknowledgementToUpdate) {
        if ($scope.editing) {
            $mdEditDialog.large({
                modelValue: softwareAcknowledgementToUpdate.link,
                placeholder: "Link",
                clickOutsideToClose: false,
                escToClose: false,
                targetEvent: event,
                title: 'Edit Software Acknowledgement Link',
                save: function (input) {
                    var index = indexOfItemWithID(softwareAcknowledgementToUpdate.id, $scope.softwareAcknowledgements);
                    if (index != -1) {
                        var softwareAcknowledgement = $scope.softwareAcknowledgements[index];
                        softwareAcknowledgement.link = input.$modelValue;
                        $http.patch(apiService.software_acknowledgements_url + softwareAcknowledgement.id, buildRequest(softwareAcknowledgement)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                    }
                }
            });
        }
    };

    $scope.delete = function (softwareAcknowledgementToDelete) {
        var index = indexOfItemWithID(softwareAcknowledgementToDelete.id, $scope.softwareAcknowledgements);
        if (index != -1) {
            $scope.softwareAcknowledgements.splice(index, 1);
            $http.delete(apiService.software_acknowledgements_url + softwareAcknowledgementToDelete.id, { 'params' : { 'format': 'json' } }).then($scope.ajaxSuccess, $scope.ajaxFailure);
        }
    };

    $scope.newSoftwareAcknowledgement = function (event) {
        $mdDialog.show({
            controller: NewSoftwareAcknowledgementController,
            templateUrl: $scope.new_software_acknowledgement_dialog_template_url,
            parent: angular.element(document.body),
            targetEvent: event,
            clickOutsideToClose: false,
            escapeToClose: false,
            fullscreen: $mdMedia('xs') || $mdMedia('sm')
        }).then(function (newSoftwareAcknowledgement) {
            $http.post(apiService.software_acknowledgements_url, buildRequest(newSoftwareAcknowledgement)).then(function(response) {
                if (response.config.method === 'POST' && response.status === 200) {
                    $scope.softwareAcknowledgements.push(response.data.software_acknowledgement);
                }
                $scope.ajaxSuccess(response);
            }, $scope.ajaxFailure);
        });
    };

    $scope.limitOptions = [10, 15, 20, {
        label: 'All',
        value: $scope.softwareAcknowledgements.length
    }];

}]);
