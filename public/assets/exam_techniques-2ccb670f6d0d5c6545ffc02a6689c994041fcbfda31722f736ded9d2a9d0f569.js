var ExamTechniquesController = Paloma.controller("ExamTechniques");
app.controller("ExamTechniquesController", ["$scope", "$http", "$mdToast", "$mdDialog", "$mdEditDialog", "$mdMedia", 'apiService', function ($scope, $http, $mdToast, $mdDialog, $mdEditDialog, $mdMedia, apiService) {

    $scope.examTechniques = [];

    $scope.editing = false;

    $scope.query = {
        order: 'name',
        limit: 10,
        page: 1,
        filter: ""
    };

    ExamTechniquesController.prototype.index = function () {
        $scope.examTechniquesPromise = $http.get(apiService.exam_techniques_url, { 'params' : { 'format': 'json' } }).then(
            function success(response) {
                for (var i = 0; i < response.data.length; i++) {
                    var exam_technique = response.data[i].exam_technique;
                    $scope.examTechniques.push(exam_technique);
                }
            }, $scope.ajaxFailure
        );

        $scope.$apply();
    };

    $scope.done = function () {
        $scope.editing = !$scope.editing;
    };

    $scope.editName = function (event, examTechniqueToUpdate) {
        if ($scope.editing) {
            $mdEditDialog.large({
                modelValue: examTechniqueToUpdate.name,
                placeholder: "Name",
                clickOutsideToClose: false,
                escToClose: false,
                targetEvent: event,
                title: 'Edit Exam Technique Name',
                validators: {
                    'required': true
                },
                messages: {
                    'required': 'Name is required'
                },
                save: function (input) {
                    var index = indexOfItemWithID(examTechniqueToUpdate.id, $scope.examTechniques);
                    if (index != -1) {
                        var examTechnique = $scope.examTechniques[index];
                        examTechnique.name = input.$modelValue;
                        $http.patch(apiService.exam_techniques_url + examTechnique.id, buildRequest(examTechnique)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                    }
                }
            });
        }
    };

    $scope.editDetails = function (event, examTechniqueToUpdate) {
        if ($scope.editing) {
            $mdEditDialog.large({
                modelValue: examTechniqueToUpdate.details,
                placeholder: "Details",
                clickOutsideToClose: false,
                escToClose: false,
                targetEvent: event,
                title: 'Edit Exam Technique Details',
                save: function (input) {
                    var index = indexOfItemWithID(examTechniqueToUpdate.id, $scope.examTechniques);
                    if (index != -1) {
                        var examTechnique = $scope.examTechniques[index];
                        examTechnique.details = input.$modelValue;
                        $http.patch(apiService.exam_techniques_url + examTechnique.id, buildRequest(examTechnique)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                    }
                }
            });
        }
    };

    //$scope.editExamTechniques = function (event, systemToUpdate) {
    //    $mdDialog.show({
    //        controller: EditExamTechniquesDialogController,
    //        templateUrl: $scope.edit_exam_techniques_dialog_template_url,
    //        parent: angular.element(document.body),
    //        targetEvent: event,
    //        clickOutsideToClose: false,
    //        escapeToClose: false,
    //        locals: {
    //            system: systemToUpdate,
    //            allExamTechniques: $scope.allExamTechniques,
    //            editing: $scope.editing
    //        },
    //        fullscreen: $mdMedia('xs') || $mdMedia('sm')
    //    }).then(function (examTechniques) {
    //        if (examTechniques) {
    //            var index = indexOfItemWithID(systemToUpdate.id, $scope.systems);
    //            if (index != -1) {
    //                $scope.systems[index].exam_techniques = examTechniques;
    //                var system = $scope.systems[index];
    //                $http.patch(apiService.systems_url + system.id, buildRequest(system)).then($scope.ajaxSuccess, $scope.ajaxFailure);
    //            }
    //        }
    //    });
    //};

    $scope.delete = function (examTechniqueToDelete) {
        var index = indexOfItemWithID(examTechniqueToDelete.id, $scope.examTechniques);
        if (index != -1) {
            $scope.examTechniques.splice(index, 1);
            $http.delete(apiService.exam_techniques_url + examTechniqueToDelete.id, { 'params' : { 'format': 'json' } }).then($scope.ajaxSuccess, $scope.ajaxFailure);
        }
    };

    //$scope.newExamTechnique = function (event) {
    //    $mdDialog.show({
    //        controller: NewSystemDialogController,
    //        templateUrl: $scope.new_system_dialog_template_url,
    //        parent: angular.element(document.body),
    //        targetEvent: event,
    //        clickOutsideToClose: false,
    //        escapeToClose: false,
    //        fullscreen: $mdMedia('xs') || $mdMedia('sm')
    //    }).then(function (newSystem) {
    //        $http.post(apiService.systems_url, buildRequest(newSystem)).then(function(response) {
    //            if (response.config.method === 'POST' && response.status === 200) {
    //                $scope.systems.push(response.data.system);
    //            }
    //            $scope.ajaxSuccess(response);
    //        }, $scope.ajaxFailure);
    //    });
    //};

}]);
