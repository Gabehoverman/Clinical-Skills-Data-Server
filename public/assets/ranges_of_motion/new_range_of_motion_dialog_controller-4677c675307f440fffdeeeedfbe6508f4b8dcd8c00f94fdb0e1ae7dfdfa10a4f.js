function NewPalpationDialogController($scope, $mdDialog, allComponents) {

    $scope.allComponents = allComponents;

    $scope.newRangeOfMotion = {
        motion: "",
        component: {
            id: -1,
            name: ""
        },
        degrees: "",
        notes: ""
    };

    $scope.close = function() {
        $mdDialog.cancel();
    };

    $scope.create = function() {
        if ($scope.newRangeOfMotion.motion === "" || $scope.newRangeOfMotion.degrees === "" || $scope.selectedComponent === "") {
            $scope.newRangeOfMotionForm.$setSubmitted();
        } else {
            $scope.newRangeOfMotion.component.id = $scope.selectedComponent.id;
            $scope.newRangeOfMotion.component.name = $scope.selectedComponent.name;
            $mdDialog.hide($scope.newRangeOfMotion);
        }
    };
}
