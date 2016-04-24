function EditPalpationsController($scope, $mdDialog, component, allPalpations, editing) {

    $scope.component = component;
    $scope.allPalpations = allPalpations;
    $scope.usedPalpations = [];
    $scope.unusedPalpations = [];
    $scope.editing = editing;

    $scope.isInitialFilter = true;

    $scope.query = {
        order: 'name',
        limit: 10,
        page: 1,
        filter: ""
    };

    $scope.filterPalpations = function () {
        for (var i = 0; i < $scope.allPalpations.length; i++) {
            var palpation = $scope.allPalpations[i];
            if (($scope.isInitialFilter) ? indexOfItemWithID(palpation.id, $scope.component.palpations) == -1 : indexOfItemWithID(palpation.id, $scope.usedPalpations) == -1) {
                if (indexOfItemWithID(palpation.id, $scope.unusedPalpations) == -1) {
                    if (!palpation.component) {
                        $scope.unusedPalpations.push(palpation);
                    }
                }
            } else {
                if (indexOfItemWithID(palpation.id, $scope.usedPalpations) == -1) {
                    $scope.usedPalpations.push(palpation);
                }
            }
        }
        $scope.isInitialFilter = false;
    };

    $scope.remove = function(palpationToRemove) {
        var index = indexOfItemWithID(palpationToRemove.id, $scope.usedPalpations);
        if (index != -1) {
            var allIndex = indexOfItemWithID(palpationToRemove.id, $scope.allPalpations);
            if (allIndex != -1) {
                $scope.allPalpations[allIndex].component = null;
            }
            $scope.usedPalpations.splice(index, 1);
            $scope.filterPalpations();
        }
    };

    $scope.addPalpation = function () {
        if($scope.palpationToAdd) {
            $scope.usedPalpations.push($scope.palpationToAdd);
            var index = indexOfItemWithID($scope.palpationToAdd.id, $scope.unusedPalpations);
            $scope.unusedPalpations.splice(index, 1);
            var allIndex = indexOfItemWithID($scope.palpationToAdd.id, $scope.allPalpations);
            if (allIndex != -1) {
                $scope.allPalpations[allIndex].component = { "name": $scope.component.name };
            }
            $scope.palpationToAdd = null;
            $scope.filterPalpations();
        }
    };

    $scope.save = function() {
        $mdDialog.hide($scope.usedPalpations);
    };

    $scope.cancel = function() {
        $mdDialog.hide(null);
    };

    $scope.hide = function() {
        $mdDialog.hide(null);
    };

    $scope.filterPalpations();
}