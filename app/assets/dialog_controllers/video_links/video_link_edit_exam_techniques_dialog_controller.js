function EditExamTechniquesDialogController($scope, $mdDialog, videoLink, allExamTechniques, editing) {

    $scope.videoLink = videoLink;
    $scope.allExamTechniques = allExamTechniques;
    $scope.usedExamTechniques = [];
    $scope.unusedExamTechniques = [];
    $scope.editing = editing;

    $scope.isInitialFilter = true;

    $scope.query = {
        order: 'name',
        limit: 10,
        page: 1,
        filter: ""
    };

    $scope.filterExamTechniques = function () {
        for (var i = 0; i < $scope.allExamTechniques.length; i++) {
            var examTechnique = $scope.allExamTechniques[i];
            if (($scope.isInitialFilter) ? indexOfItemWithID(examTechnique.id, $scope.videoLink.exam_techniques) == -1 : indexOfItemWithID(examTechnique.id, $scope.usedExamTechniques) == -1) {
                if (indexOfItemWithID(examTechnique.id, $scope.unusedExamTechniques) == -1) {
                    if (!examTechnique.videoLink) {
                        $scope.unusedExamTechniques.push(examTechnique);
                    }
                }
            } else {
                if (indexOfItemWithID(examTechnique.id, $scope.usedExamTechniques) == -1) {
                    $scope.usedExamTechniques.push(examTechnique);
                }
            }
        }
        $scope.isInitialFilter = false;
    };

    $scope.remove = function(examTechniqueToRemove) {
        var index = indexOfItemWithID(examTechniqueToRemove.id, $scope.usedExamTechniques);
        if (index != -1) {
            var allIndex = indexOfItemWithID(examTechniqueToRemove.id, $scope.allExamTechniques);
            if (allIndex != -1) {
                $scope.allExamTechniques[allIndex].videoLink = null;
            }
            $scope.usedExamTechniques.splice(index, 1);
            $scope.filterExamTechniques();
        }
    };

    $scope.addExamTechnique = function() {
        if($scope.examTechniqueToAdd) {
            $scope.usedExamTechniques.push($scope.examTechniqueToAdd);
            var index = indexOfItemWithID($scope.examTechniqueToAdd.id, $scope.unusedExamTechniques);
            $scope.unusedExamTechniques.splice(index, 1);
            var allIndex = indexOfItemWithID($scope.examTechniqueToAdd.id, $scope.allExamTechniques);
            if (allIndex != -1) {
                $scope.allExamTechniques[allIndex].videoLink = { "name": $scope.videoLink.name };
            }
            $scope.examTechniqueToAdd = null;
            $scope.filterExamTechniques();
        }
    };

    $scope.save = function() {
        $mdDialog.hide($scope.usedExamTechniques);
    };

    $scope.cancel = function() {
        $mdDialog.hide(null);
    };

    $scope.hide = function() {
        $mdDialog.hide(null);
    };

    $scope.enterKeyListener = function (event) {
        if (event.keyCode === 13) {
            $scope.save();
        }
    };

    $scope.filterExamTechniques();
}