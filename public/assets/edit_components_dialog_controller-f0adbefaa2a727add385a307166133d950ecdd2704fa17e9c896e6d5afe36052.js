function EditComponentsController($scope, $mdDialog, $http, system, components , editing) {

    $scope.system = system;
    $scope.exam_techniques = exam_techniques;
    $scope.editing = editing;

    $scope.query = {
        order: 'name',
        limit: 10,
        page: 1,
        filter: ""
    };

    $scope.remove = function(componentToRemove) {
        var index = indexOfItemWithID(componentToRemove.id, $scope.exam_techniques);
        if (index != -1) {
            $scope.exam_techniques.splice(index, 1);
        }
    };

    $scope.save = function() {
        $mdDialog.hide($scope.exam_techniques);
    };

    $scope.cancel = function() {
        $mdDialog.hide(null);
    };

    $scope.hide = function() {
        $mdDialog.hide(null);
    };
}
