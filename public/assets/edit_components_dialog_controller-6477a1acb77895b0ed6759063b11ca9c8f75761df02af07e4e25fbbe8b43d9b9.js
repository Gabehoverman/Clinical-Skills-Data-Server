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
        //console.log($scope.allComponents);
        for (var i = 0; i < $scope.allComponents.length; i++) {
            var component = $scope.allComponents[i];
            //console.log(component);
            var index = indexOfItemWithID(component.id, $scope.components);
            console.log(index);
            if (index == -1) {
                $scope.unusedComponents.push(component);
                //console.log($scope.unusedComponents);
            }
        }
        //for (var i = 0; i < allComponents.length; i++) {
        //    var component = allComponents[i];
        //    var index = indexOfItemWithID(component.id, $scope.components);
        //    if (index == -1) {
        //        $scope.allComponents.push(component);
        //    }
        //}
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
