var MusclesController = Paloma.controller("Muscles");
app.controller("MusclesController", ["$scope", "$http", "$mdToast", "$mdDialog", "$mdEditDialog", "$mdMedia", 'apiService', function ($scope, $http, $mdToast, $mdDialog, $mdEditDialog, $mdMedia, apiService) {

    $scope.muscles = [];
    $scope.allComponents = [];

    $scope.editing = false;

    $scope.query = {
        order: 'name',
        limit: 15,
        page: 1,
        filter: ""
    };

    MusclesController.prototype.index = function () {
        $scope.new_muscle_dialog_template_url = this.params.new_muscle_dialog_template_url;

        $scope.musclesPromise = $http.get(apiService.muscles_url, { 'params' : { 'format': 'json' } }).then(
            function success(response) {
                for (var i = 0; i < response.data.length; i++) {
                    var muscle = response.data[i].muscle;
                    if (indexOfItemWithID(muscle.id, $scope.muscles) == -1) {
                        $scope.muscles.push(muscle);
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

    $scope.editName = function (event, muscleToUpdate) {
        if ($scope.editing) {
            $mdEditDialog.large({
                modelValue: muscleToUpdate.name,
                placeholder: "Name",
                clickOutsideToClose: false,
                escToClose: false,
                targetEvent: event,
                title: 'Edit Muscle Name',
                validators: {
                    'required': true
                },
                messages: {
                    'required': 'Name is required'
                },
                save: function (input) {
                    var index = indexOfItemWithID(muscleToUpdate.id, $scope.muscles);
                    if (index != -1) {
                        var muscle = $scope.muscles[index];
                        muscle.name = input.$modelValue;
                        $http.patch(apiService.muscles_url + muscle.id, buildRequest(muscle)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                    }
                }
            });
        }
    };

    $scope.delete = function (muscleToDelete) {
        var index = indexOfItemWithID(muscleToDelete.id, $scope.muscles);
        if (index != -1) {
            $scope.muscles.splice(index, 1);
            $http.delete(apiService.muscles_url + muscleToDelete.id, { 'params' : { 'format': 'json' } }).then($scope.ajaxSuccess, $scope.ajaxFailure);
        }
    };

    $scope.newMuscle = function (event) {
        $mdDialog.show({
            controller: NewMuscleDialogController,
            templateUrl: $scope.new_muscle_dialog_template_url,
            parent: angular.element(document.body),
            targetEvent: event,
            clickOutsideToClose: false,
            escapeToClose: false,
            fullscreen: $mdMedia('xs') || $mdMedia('sm'),
            locals: {
                allComponents: $scope.allComponents
            }
        }).then(function (newMuscle) {
            $http.post(apiService.muscles_url, buildRequest(newMuscle)).then(function(response) {
                if (response.config.method === 'POST' && response.status === 200) {
                    $scope.muscles.push(response.data.muscle);
                }
                $scope.ajaxSuccess(response);
            }, $scope.ajaxFailure);
        });
    };

    $scope.limitOptions = [10, 15, 20, {
        label: 'All',
        value: $scope.muscles.length
    }];

}]);
