function NewPalpationDialogController($scope, $mdDialog, allComponents) {

    $scope.allComponents = allComponents;

    $scope.newPalpation = {
        structure: "",
        component: {
            id: -1,
            name: ""
        },
        details: "",
        notes: ""
    };

    $scope.close = function() {
        $mdDialog.cancel();
    };

    $scope.create = function() {
        if ($scope.newPalpation.structure === "" || $scope.selectedComponent.name !== "") {
            $scope.newPalpationForm.$setSubmitted();
        } else {
            $scope.newPalpation.component.id = $scope.selectedComponent.id;
            $scope.newPalpation.component.name = $scope.selectedComponent.name;
            $mdDialog.hide($scope.newPalpation);
        }
    };

    $scope.enterKeyListener = function (event) {
        if (event.keyCode === 13) {
            $scope.create();
        }
    }
}
