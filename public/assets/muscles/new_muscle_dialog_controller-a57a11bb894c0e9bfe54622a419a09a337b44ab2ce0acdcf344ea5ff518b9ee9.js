function NewMuscleDialogController($scope, $mdDialog, allComponents) {

    $scope.allComponents = allComponents;

    $scope.newMuscle = {
        name: "",
        component: {
            name: ""
        }
    };

    $scope.close = function() {
        $mdDialog.cancel();
    };

    $scope.create = function() {
        if ($scope.newMuscle.name === "") {
            $scope.newMuscleForm.$setSubmitted();
        } else {
            $mdDialog.hide($scope.newMuscle);
        }
    };
}
