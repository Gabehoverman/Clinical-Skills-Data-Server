function EditComponentsController($scope, $mdDialog, system, components, allComponents, editing) {

    $scope.system = system;
    $scope.components = components;
    $scope.allComponents = allComponents;
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

    $scope.addComponent = function () {
        if($scope.componentToAdd) {
            $scope.components.push($scope.componentToAdd);
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
