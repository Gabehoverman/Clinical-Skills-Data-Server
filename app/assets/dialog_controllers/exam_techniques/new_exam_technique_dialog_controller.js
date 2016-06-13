function NewExamTechniqueDialogController($scope, $mdDialog, allSystems) {

    $scope.allSystems = allSystems;

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

    $scope.enterKeyListener = function (event) {
        if (event.keyCode === 13) {
            $scope.create();
        }
    };
}
NewExamTechniqueDialogController.$inject = ["$scope", "$mdDialog", "allSystems"];