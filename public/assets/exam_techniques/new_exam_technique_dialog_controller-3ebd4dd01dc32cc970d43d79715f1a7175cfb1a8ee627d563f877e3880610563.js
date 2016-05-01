function NewExamTechniqueDialogController($scope, $mdDialog) {

    $scope.newExamTechnique = {
        name: "",
        details: "",
        system: {
            id: -1,
            name: ""
        }
    };

    $scope.close = function() {
        $mdDialog.cancel();
    };

    $scope.create = function() {
        if ($scope.newExamTechnique.name === "" || $scope.selectedSystem.name === "") {
            $scope.newExamTechniqueForm.$setSubmitted();
        } else {
            $scope.newExamTechnique.system.id = $scope.selectedSystem.id;
            $scope.newExamTechnique.system.name = $scope.selectedSystem.name;
            $mdDialog.hide($scope.newExamTechnique);
        }
    };
}
