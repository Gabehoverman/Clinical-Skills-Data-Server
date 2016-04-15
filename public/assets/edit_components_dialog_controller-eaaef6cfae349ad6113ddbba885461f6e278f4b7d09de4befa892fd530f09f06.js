function EditComponentsController($scope, $mdDialog, $http, system, components , editing) {

    $scope.system = system;
    $scope.exam_techniques = exam_techniques;
    $scope.editing = editing;

    $scope.hide = function() {
        $mdDialog.hide("Done");
    };
}
