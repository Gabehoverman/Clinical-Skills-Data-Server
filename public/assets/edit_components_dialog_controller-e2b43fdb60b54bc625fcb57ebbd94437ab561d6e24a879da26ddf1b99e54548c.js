function EditComponentsController($scope, $mdDialog, system, components , editing) {

    $scope.system = system;
    $scope.components = components;
    $scope.editing = editing;

    $scope.query = {
        order: 'name',
        limit: 10,
        page: 1,
        filter: ""
    };

    $scope.remove = function(componentToRemove) {
        var index = indexOfItemWithID(componentToRemove.id, $scope.components);
        if (index != -1) {
            $scope.components.splice(index, 1);
        }
    };

    $scope.save = function() {
        $mdDialog.hide($scope.components);
    };

    $scope.cancel = function() {
        $mdDialog.hide(null);
    };

    $scope.hide = function() {
        $mdDialog.hide(null);
    };
}
