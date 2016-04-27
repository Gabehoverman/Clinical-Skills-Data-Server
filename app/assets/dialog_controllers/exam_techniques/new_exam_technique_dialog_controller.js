function NewExamTechniqueDialogController($scope, $mdDialog) {

    $scope.newExamTechnique = {
        name: "",
        details: ""
    };

    $scope.close = function() {
        $mdDialog.cancel();
    };

    $scope.create = function() {
        if ($scope.newExamTechnique.name === "") {
            $scope.newExamTechniqueForm.$setSubmitted();
        } else {
            $mdDialog.hide($scope.newExamTechnique);
        }
    };
}