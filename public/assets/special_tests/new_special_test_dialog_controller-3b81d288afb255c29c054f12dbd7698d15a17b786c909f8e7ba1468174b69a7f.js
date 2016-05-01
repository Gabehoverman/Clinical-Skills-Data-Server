function NewSpecialTestDialogController($scope, $mdDialog, allComponents) {

    $scope.allComponents = allComponents;

    $scope.newSpecialTest = {
        name: "",
        component: {
            id: -1,
            name: ""
        },
        positive_sign: "",
        indication: "",
        notes: ""
    };

    $scope.close = function() {
        $mdDialog.cancel();
    };

    $scope.create = function() {
        if ($scope.newSpecialTest.name === "" || $scope.selectedComponent.name !== "") {
            $scope.newSpecialTestForm.$setSubmitted();
        } else {
            $scope.newSpecialTest.component.id = $scope.selectedComponent.id;
            $scope.newSpecialTest.component.name = $scope.selectedComponent.name;
            $mdDialog.hide($scope.newSpecialTest);
        }
    };
}
