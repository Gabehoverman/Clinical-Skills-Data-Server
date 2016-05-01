var RangesOfMotionController = Paloma.controller("RangesOfMotion");
app.controller("RangesOfMotionController", ["$scope", "$http", "$mdToast", "$mdDialog", "$mdEditDialog", "$mdMedia", 'apiService', function ($scope, $http, $mdToast, $mdDialog, $mdEditDialog, $mdMedia, apiService) {

    $scope.rangesOfMotion = [];
    $scope.allComponents = [];

    $scope.editing = false;

    $scope.query = {
        order: 'motion',
        limit: 15,
        page: 1,
        filter: ""
    };

    RangesOfMotionController.prototype.index = function () {
        $scope.new_rangeOfMotion_dialog_template_url = this.params.new_rangeOfMotion_dialog_template_url;

        $scope.rangesOfMotionPromise = $http.get(apiService.rangesOfMotion_url, { 'params' : { 'format': 'json' } }).then(
            function success(response) {
                for (var i = 0; i < response.data.length; i++) {
                    var rangeOfMotion = response.data[i].rangeOfMotion;
                    if (indexOfItemWithID(rangeOfMotion.id, $scope.rangesOfMotion) == -1) {
                        $scope.rangesOfMotion.push(rangeOfMotion);
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

    $scope.editMotion = function (event, rangeOfMotionToUpdate) {
        if ($scope.editing) {
            $mdEditDialog.large({
                modelValue: rangeOfMotionToUpdate.motion,
                placeholder: "Motion",
                clickOutsideToClose: false,
                escToClose: false,
                targetEvent: event,
                title: 'Edit Range Of Motion Motion',
                validators: {
                    'required': true
                },
                messages: {
                    'required': 'Motion is required'
                },
                save: function (input) {
                    var index = indexOfItemWithID(rangeOfMotionToUpdate.id, $scope.ranges_of_motion);
                    if (index != -1) {
                        var rangeOfMotion = $scope.ranges_of_motion[index];
                        rangeOfMotion.motion = input.$modelValue;
                        $http.patch(apiService.ranges_of_motion_url + rangeOfMotion.id, buildRequest(rangeOfMotion)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                    }
                }
            });
        }
    };

    $scope.editComponent = function(rangeOfMotionToUpdate) {
        $http.patch(apiService.ranges_of_motion_url + rangeOfMotionToUpdate.id, buildRequest(rangeOfMotionToUpdate)).then($scope.ajaxSuccess, $scope.ajaxFailure);
    };

    $scope.editDegrees = function (event, rangeOfMotionToUpdate) {
        if ($scope.editing) {
            $mdEditDialog.large({
                modelValue: rangeOfMotionToUpdate.degrees,
                placeholder: "Degrees",
                clickOutsideToClose: false,
                escToClose: false,
                targetEvent: event,
                title: 'Edit Range Of Motion Degrees',
                save: function (input) {
                    var index = indexOfItemWithID(rangeOfMotionToUpdate.id, $scope.rangesOfMotion);
                    if (index != -1) {
                        var rangeOfMotion = $scope.rangesOfMotion[index];
                        rangeOfMotion.degrees = input.$modelValue;
                        $http.patch(apiService.ranges_of_motion_url + rangeOfMotion.id, buildRequest(rangeOfMotion)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                    }
                }
            });
        }
    };

    $scope.editNotes = function (event, rangeOfMotionToUpdate) {
        if ($scope.editing) {
            $mdEditDialog.large({
                modelValue: rangeOfMotionToUpdate.notes,
                placeholder: "Notes",
                clickOutsideToClose: false,
                escToClose: false,
                targetEvent: event,
                title: 'Edit RangeOfMotion Notes',
                save: function (input) {
                    var index = indexOfItemWithID(rangeOfMotionToUpdate.id, $scope.rangesOfMotion);
                    if (index != -1) {
                        var rangeOfMotion = $scope.rangesOfMotion[index];
                        rangeOfMotion.notes = input.$modelValue;
                        $http.patch(apiService.ranges_of_motion_url + rangeOfMotion.id, buildRequest(rangeOfMotion)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                    }
                }
            });
        }
    };

    $scope.delete = function (rangeOfMotionToDelete) {
        var index = indexOfItemWithID(rangeOfMotionToDelete.id, $scope.rangesOfMotion);
        if (index != -1) {
            $scope.rangesOfMotion.splice(index, 1);
            $http.delete(apiService.ranges_of_motion_url + rangeOfMotionToDelete.id, { 'params' : { 'format': 'json' } }).then($scope.ajaxSuccess, $scope.ajaxFailure);
        }
    };

    $scope.newRangeOfMotion = function (event) {
        $mdDialog.show({
            controller: NewRangeOfMotionDialogController,
            templateUrl: $scope.new_rangeOfMotion_dialog_template_url,
            parent: angular.element(document.body),
            targetEvent: event,
            clickOutsideToClose: false,
            escapeToClose: false,
            fullscreen: $mdMedia('xs') || $mdMedia('sm'),
            locals: {
                allComponents: $scope.allComponents
            }
        }).then(function (newRangeOfMotion) {
            $http.post(apiService.rangesOfMotion_url, buildRequest(newRangeOfMotion)).then(function(response) {
                if (response.config.method === 'POST' && response.status === 200) {
                    console.log(response.data.rangeOfMotion);
                    $scope.rangesOfMotion.push(response.data.rangeOfMotion);
                }
                $scope.ajaxSuccess(response);
            }, $scope.ajaxFailure);
        });
    };

    $scope.limitOptions = [10, 15, 20, {
        label: 'All',
        value: $scope.rangesOfMotion.length
    }];

}]);
