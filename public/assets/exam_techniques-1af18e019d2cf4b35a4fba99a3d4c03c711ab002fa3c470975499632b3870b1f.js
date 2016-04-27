var ExamTechniquesController = Paloma.controller("ExamTechniques");
app.controller("ExamTechniquesController", ["$scope", "$http", "$mdToast", "$mdDialog", "$mdEditDialog", "$mdMedia", 'apiService', function ($scope, $http, $mdToast, $mdDialog, $mdEditDialog, $mdMedia, apiService) {

    $scope.examTechniques = [];

    $scope.editing = false;

    $scope.query = {
        order: 'name',
        limit: 13,
        page: 1,
        filter: ""
    };

    ExamTechniquesController.prototype.index = function () {
        $scope.new_exam_technique_dialog_template_url = this.params.new_exam_technique_dialog_template_url;
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

    $scope.delete = function (examTechniqueToDelete) {
        var index = indexOfItemWithID(examTechniqueToDelete.id, $scope.examTechniques);
        if (index != -1) {
            $scope.examTechniques.splice(index, 1);
            $http.delete(apiService.exam_techniques_url + examTechniqueToDelete.id, { 'params' : { 'format': 'json' } }).then($scope.ajaxSuccess, $scope.ajaxFailure);
        }
    };

    $scope.newExamTechnique = function (event) {
        $mdDialog.show({
            controller: NewExamTechniqueDialogController,
            templateUrl: $scope.new_exam_technique_dialog_template_url,
            parent: angular.element(document.body),
            targetEvent: event,
            clickOutsideToClose: false,
            escapeToClose: false,
            fullscreen: $mdMedia('xs') || $mdMedia('sm')
        }).then(function (newExamTechnique) {
            $http.post(apiService.exam_techniques_url, buildRequest(newExamTechnique)).then(function(response) {
                if (response.config.method === 'POST' && response.status === 200) {
                    $scope.examTechniques.push(response.data.exam_technique);
                }
                $scope.ajaxSuccess(response);
            }, $scope.ajaxFailure);
        });
    };

}]);
