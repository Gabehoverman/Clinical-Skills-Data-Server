function EditExamTechniquesDialogController($scope, $mdDialog, system, exam_techniques, allExamTechniques, editing) {

    $scope.system = system;
    $scope.exam_techniques = exam_techniques;
    $scope.allExamTechniques = allExamTechniques;
    $scope.unusedExamTechniques = [];
    $scope.editing = editing;

    $scope.query = {
        order: 'name',
        limit: 10,
        page: 1,
        filter: ""
    };

    $scope.filterExamTechniques = function () {
        for (var i = 0; i < $scope.allExamTechniques.length; i++) {
            var examTechnique = $scope.allExamTechniques[i];
            if (indexOfItemWithID(examTechnique.id, $scope.exam_techniques) == -1) {
                if (indexOfItemWithID(examTechnique.id, $scope.unusedExamTechniques) == -1) {
                    $scope.unusedExamTechniques.push(examTechnique);
                }
            }
        }
    };

    $scope.remove = function(examTechniqueToRemove) {
        var index = indexOfItemWithID(examTechniqueToRemove.id, $scope.exam_techniques);
        if (index != -1) {
            $scope.exam_techniques.splice(index, 1);
            $scope.filterExamTechniques();
        }
    };

    $scope.addExamTechnique = function() {
        if($scope.examTechniqueToAdd) {
            $scope.exam_techniques.push($scope.examTechniqueToAdd);
            var index = indexOfItemWithID($scope.examTechniqueToAdd.id, $scope.unusedExamTechniques);
            $scope.unusedExamTechniques.splice(index, 1);
            $scope.examTechniqueToAdd = null;
            $scope.filterExamTechniques();
        }
    };

    $scope.save = function() {
        $mdDialog.hide($scope.exam_techniques);
    };

    $scope.cancel = function() {
        $mdDialog.hide(null);
    };

    $scope.hide = function() {
        $mdDialog.hide(null);
    };

    $scope.filterExamTechniques();
}
