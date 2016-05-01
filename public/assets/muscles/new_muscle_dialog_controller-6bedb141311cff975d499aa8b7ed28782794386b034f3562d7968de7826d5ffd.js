function NewMuscleDialogController($scope, $mdDialog, allComponents) {

    $scope.allComponents = allComponents;

    $scope.newMuscle = {
        name: "",
        component: {
            id: -1,
            name: ""
        }
    };

    $scope.close = function() {
        $mdDialog.cancel();
    };

    $scope.create = function() {
        if ($scope.newMuscle.name === "" || $scope.selectedComponent.name === "") {
            $scope.newMuscleForm.$setSubmitted();
        } else {
            $scope.newMuscle.component.id = $scope.selectedComponent.id;
            $scope.newMuscle.component.name = $scope.selectedComponent.name;
            $mdDialog.hide($scope.newMuscle);
        }
    };

    $scope.enterKeyListener = function (event) {
        if (event.keyCode === 13) {
            $scope.create();
        }
    }
}
