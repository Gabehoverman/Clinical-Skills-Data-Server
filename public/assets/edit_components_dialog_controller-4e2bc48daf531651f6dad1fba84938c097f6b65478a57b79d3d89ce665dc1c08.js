function EditComponentsController($scope, $mdDialog, system, components, allComponents, editing) {

    $scope.system = system;
    $scope.allComponents = allComponents;
    $scope.usedComponents = [];
    $scope.unusedComponents = [];
    $scope.editing = editing;

    $scope.isInitial = true;

    $scope.query = {
        order: 'name',
        limit: 10,
        page: 1,
        filter: ""
    };

    $scope.filterComponents = function () {
        for (var i = 0; i < $scope.allComponents.length; i++) {
            var component = $scope.allComponents[i];
            if (($scope.isInitial) ? indexOfItemWithID(component.id, $scope.system.components) == -1 : indexOfItemWithID(component.id, $scope.usedComponents) == -1) {
                if (indexOfItemWithID(component.id, $scope.unusedComponents) == -1) {
                    $scope.unusedComponents.push(component);
                }
            } else {
                if (indexOfItemWithID(component.id, $scope.usedComponents) == -1) {
                    $scope.usedComponents.push(component);
                }
            }
        }
        $scope.isInitial = false;
    };

    $scope.remove = function(componentToRemove) {
        var index = indexOfItemWithID(componentToRemove.id, $scope.usedComponents);
        console.log(index);
        if (index != -1) {
            $scope.usedComponents.splice(index, 1);
            $scope.filterComponents();
        }
    };

    $scope.addComponent = function () {
        if($scope.componentToAdd) {
            $scope.usedComponents.push($scope.componentToAdd);
            var index = indexOfItemWithID($scope.componentToAdd.id, $scope.unusedComponents);
            $scope.unusedComponents.splice(index, 1);
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
