function EditComponentsController($scope, $mdDialog, system, allComponents, editing) {

    $scope.system = system;
    $scope.allComponents = allComponents;
    $scope.usedComponents = [];
    $scope.unusedComponents = [];
    $scope.editing = editing;

    $scope.isInitialFilter = true;

    $scope.query = {
        order: 'name',
        limit: 10,
        page: 1,
        filter: ""
    };

    $scope.filterComponents = function () {
        for (var i = 0; i < $scope.allComponents.length; i++) {
            var component = $scope.allComponents[i];
            if (($scope.isInitialFilter) ? indexOfItemWithID(component.id, $scope.system.components) == -1 : indexOfItemWithID(component.id, $scope.usedComponents) == -1) {
                if (indexOfItemWithID(component.id, $scope.unusedComponents) == -1) {
                    if (!component.system) {
                        $scope.unusedComponents.push(component);
                    }
                }
            } else {
                if (indexOfItemWithID(component.id, $scope.usedComponents) == -1) {
                    $scope.usedComponents.push(component);
                }
            }
        }
        $scope.isInitialFilter = false;
    };

    $scope.remove = function(componentToRemove) {
        var index = indexOfItemWithID(componentToRemove.id, $scope.usedComponents);
        if (index != -1) {
            var allIndex = indexOfItemWithID(componentToRemove.id, $scope.allComponents);
            if (allIndex != -1) {
                $scope.allComponents[allIndex].system = null;
            }
            $scope.usedComponents.splice(index, 1);
            $scope.filterComponents();
        }
    };

    $scope.addComponent = function () {
        if($scope.componentToAdd) {
            $scope.usedComponents.push($scope.componentToAdd);
            var index = indexOfItemWithID($scope.componentToAdd.id, $scope.unusedComponents);
            $scope.unusedComponents.splice(index, 1);
            var allIndex = indexOfItemWithID($scope.componentToAdd.id, $scope.allComponents);
            if (allIndex != -1) {
                $scope.allComponents[allIndex].system = { "name": $scope.system.name };
            }
            $scope.componentToAdd = null;
            $scope.filterComponents();
        }
    };

    $scope.save = function() {
        $mdDialog.hide($scope.usedComponents);
    };

    $scope.cancel = function() {
        $mdDialog.hide(null);
    };

    $scope.hide = function() {
        $mdDialog.hide(null);
    };

    $scope.filterComponents();
}
