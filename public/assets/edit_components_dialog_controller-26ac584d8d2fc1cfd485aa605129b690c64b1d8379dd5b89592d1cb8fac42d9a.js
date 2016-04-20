function EditComponentsController($scope, $mdDialog, system, components, allComponents, editing) {

    $scope.system = system;
    $scope.components = components;
    $scope.allComponents = allComponents;
    $scope.unusedComponents = [];
    $scope.editing = editing;

    $scope.query = {
        order: 'name',
        limit: 10,
        page: 1,
        filter: ""
    };

    $scope.filterComponents = function () {
        for (var i = 0; i < $scope.allComponents.length; i++) {
            var component = $scope.allComponents[i];
            if (indexOfItemWithID(component.id, $scope.components) == -1) {
                if (indexOfItemWithID(component.id, $scope.unusedComponents) == -1) {
                    $scope.unusedComponents.push(component);
                }
            }
        }
    };

    $scope.remove = function(componentToRemove) {
        var index = indexOfItemWithID(componentToRemove.id, $scope.components);
        if (index != -1) {
            $scope.components.splice(index, 1);
            $scope.filterComponents();
        }
    };

    $scope.addComponent = function () {
        if($scope.componentToAdd) {
            $scope.components.push($scope.componentToAdd);
            var index = indexOfItemWithID($scope.componentToAdd.id, $scope.unusedComponents);
            $scope.unusedComponents.splice(index, 1);
            $scope.componentToAdd = null;
            $scope.filterComponents();
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

    $scope.filterComponents();
}
