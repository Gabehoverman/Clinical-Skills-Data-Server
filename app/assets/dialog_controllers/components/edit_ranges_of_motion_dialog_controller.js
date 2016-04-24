function EditRangeOfMotionsController($scope, $mdDialog, component, allRangesOfMotion, editing) {

    $scope.component = component;
    $scope.allRangesOfMotion = allRangesOfMotion;
    $scope.usedRangesOfMotion = [];
    $scope.unusedRangesOfMotion = [];
    $scope.editing = editing;

    $scope.isInitialFilter = true;

    $scope.query = {
        order: 'name',
        limit: 10,
        page: 1,
        filter: ""
    };

    $scope.filterRangeOfMotions = function () {
        for (var i = 0; i < $scope.allRangesOfMotion.length; i++) {
            var rangeOfMotion = $scope.allRangesOfMotion[i];
            if (($scope.isInitialFilter) ? indexOfItemWithID(rangeOfMotion.id, $scope.component.range_of_motions) == -1 : indexOfItemWithID(rangeOfMotion.id, $scope.usedRangesOfMotion) == -1) {
                if (indexOfItemWithID(rangeOfMotion.id, $scope.unusedRangesOfMotion) == -1) {
                    if (!rangeOfMotion.component) {
                        $scope.unusedRangesOfMotion.push(rangeOfMotion);
                    }
                }
            } else {
                if (indexOfItemWithID(rangeOfMotion.id, $scope.usedRangesOfMotion) == -1) {
                    $scope.usedRangesOfMotion.push(rangeOfMotion);
                }
            }
        }
        $scope.isInitialFilter = false;
    };

    $scope.remove = function(rangeOfMotionToRemove) {
        var index = indexOfItemWithID(rangeOfMotionToRemove.id, $scope.usedRangesOfMotion);
        if (index != -1) {
            var allIndex = indexOfItemWithID(rangeOfMotionToRemove.id, $scope.allRangesOfMotion);
            if (allIndex != -1) {
                $scope.allRangesOfMotion[allIndex].component = null;
            }
            $scope.usedRangesOfMotion.splice(index, 1);
            $scope.filterRangeOfMotions();
        }
    };

    $scope.addRangeOfMotion = function () {
        if($scope.rangeOfMotionToAdd) {
            $scope.usedRangesOfMotion.push($scope.rangeOfMotionToAdd);
            var index = indexOfItemWithID($scope.rangeOfMotionToAdd.id, $scope.unusedRangesOfMotion);
            $scope.unusedRangesOfMotion.splice(index, 1);
            var allIndex = indexOfItemWithID($scope.rangeOfMotionToAdd.id, $scope.allRangesOfMotion);
            if (allIndex != -1) {
                $scope.allRangesOfMotion[allIndex].component = { "name": $scope.component.name };
            }
            $scope.rangeOfMotionToAdd = null;
            $scope.filterRangeOfMotions();
        }
    };

    $scope.save = function() {
        $mdDialog.hide($scope.usedRangesOfMotion);
    };

    $scope.cancel = function() {
        $mdDialog.hide(null);
    };

    $scope.hide = function() {
        $mdDialog.hide(null);
    };

    $scope.filterRangeOfMotions();
}