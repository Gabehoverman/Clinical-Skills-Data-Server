function EditSpecialTestsController($scope, $mdDialog, component, allSpecialTests, editing) {

    $scope.component = component;
    $scope.allSpecialTests = allSpecialTests;
    $scope.usedSpecialTests = [];
    $scope.unusedSpecialTests = [];
    $scope.editing = editing;

    $scope.isInitialFilter = true;

    $scope.query = {
        order: 'name',
        limit: 10,
        page: 1,
        filter: ""
    };

    $scope.filterSpecialTests = function () {
        for (var i = 0; i < $scope.allSpecialTests.length; i++) {
            var specialTest = $scope.allSpecialTests[i];
            if (($scope.isInitialFilter) ? indexOfItemWithID(specialTest.id, $scope.component.special_tests) == -1 : indexOfItemWithID(specialTest.id, $scope.usedSpecialTests) == -1) {
                if (indexOfItemWithID(specialTest.id, $scope.unusedSpecialTests) == -1) {
                    if (!specialTest.component) {
                        $scope.unusedSpecialTests.push(specialTest);
                    }
                }
            } else {
                if (indexOfItemWithID(specialTest.id, $scope.usedSpecialTests) == -1) {
                    $scope.usedSpecialTests.push(specialTest);
                }
            }
        }
        $scope.isInitialFilter = false;
    };

    $scope.remove = function(specialTestToRemove) {
        var index = indexOfItemWithID(specialTestToRemove.id, $scope.usedSpecialTests);
        if (index != -1) {
            var allIndex = indexOfItemWithID(specialTestToRemove.id, $scope.allSpecialTests);
            if (allIndex != -1) {
                $scope.allSpecialTests[allIndex].component = null;
            }
            $scope.usedSpecialTests.splice(index, 1);
            $scope.filterSpecialTests();
        }
    };

    $scope.addSpecialTest = function () {
        if($scope.specialTestToAdd) {
            $scope.usedSpecialTests.push($scope.specialTestToAdd);
            var index = indexOfItemWithID($scope.specialTestToAdd.id, $scope.unusedSpecialTests);
            $scope.unusedSpecialTests.splice(index, 1);
            var allIndex = indexOfItemWithID($scope.specialTestToAdd.id, $scope.allSpecialTests);
            if (allIndex != -1) {
                $scope.allSpecialTests[allIndex].component = { "name": $scope.component.name };
            }
            $scope.specialTestToAdd = null;
            $scope.filterSpecialTests();
        }
    };

    $scope.save = function() {
        $mdDialog.hide($scope.usedSpecialTests);
    };

    $scope.cancel = function() {
        $mdDialog.hide(null);
    };

    $scope.hide = function() {
        $mdDialog.hide(null);
    };

    $scope.filterSpecialTests();
}
