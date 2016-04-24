function EditMusclesController($scope, $mdDialog, component, allMuscles, editing) {

    $scope.component = component;
    $scope.allMuscles = allMuscles;
    $scope.usedMuscles = [];
    $scope.unusedMuscles = [];
    $scope.editing = editing;

    $scope.isInitialFilter = true;

    $scope.query = {
        order: 'name',
        limit: 10,
        page: 1,
        filter: ""
    };

    $scope.filterMuscles = function () {
        for (var i = 0; i < $scope.allMuscles.length; i++) {
            var muscle = $scope.allMuscles[i];
            if (($scope.isInitialFilter) ? indexOfItemWithID(muscle.id, $scope.component.muscles) == -1 : indexOfItemWithID(muscle.id, $scope.usedMuscles) == -1) {
                if (indexOfItemWithID(muscle.id, $scope.unusedMuscles) == -1) {
                    if (!muscle.component) {
                        $scope.unusedMuscles.push(muscle);
                    }
                }
            } else {
                if (indexOfItemWithID(muscle.id, $scope.usedMuscles) == -1) {
                    $scope.usedMuscles.push(muscle);
                }
            }
        }
        $scope.isInitialFilter = false;
    };

    $scope.remove = function(muscleToRemove) {
        var index = indexOfItemWithID(muscleToRemove.id, $scope.usedMuscles);
        if (index != -1) {
            var allIndex = indexOfItemWithID(muscleToRemove.id, $scope.allMuscles);
            if (allIndex != -1) {
                $scope.allMuscles[allIndex].component = null;
            }
            $scope.usedMuscles.splice(index, 1);
            $scope.filterMuscles();
        }
    };

    $scope.addMuscle = function () {
        if($scope.muscleToAdd) {
            $scope.usedMuscles.push($scope.muscleToAdd);
            var index = indexOfItemWithID($scope.muscleToAdd.id, $scope.unusedMuscles);
            $scope.unusedMuscles.splice(index, 1);
            var allIndex = indexOfItemWithID($scope.muscleToAdd.id, $scope.allMuscles);
            if (allIndex != -1) {
                $scope.allMuscles[allIndex].component = { "name": $scope.component.name };
            }
            $scope.muscleToAdd = null;
            $scope.filterMuscles();
        }
    };

    $scope.save = function() {
        $mdDialog.hide($scope.usedMuscles);
    };

    $scope.cancel = function() {
        $mdDialog.hide(null);
    };

    $scope.hide = function() {
        $mdDialog.hide(null);
    };

    $scope.filterMuscles();
}