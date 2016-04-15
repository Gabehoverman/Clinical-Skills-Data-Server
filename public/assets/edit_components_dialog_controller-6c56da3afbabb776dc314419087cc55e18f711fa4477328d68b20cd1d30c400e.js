function EditComponentsController($scope, $mdDialog, $http, system, components , editing) {

    $scope.system = system;
    $scope.exam_techniques = exam_techniques;
    $scope.editing = editing;

    $scope.remove = function(componentToRemove) {
        var index = indexOfItemWithID(componentToRemove, $scope.exam_techniques);
        if (index > 1) {
            $scope.exam_techniques.splice(index, 1);
        }
    };

    $scope.hide = function() {
        $mdDialog.hide($scope.exam_techniques);
    };
}
