function EditImageLinksController($scope, $mdDialog, specialTest, allImageLinks, editing) {

    $scope.specialTest = specialTest;
    $scope.allImageLinks = allImageLinks;
    $scope.usedImageLinks = [];
    $scope.unusedImageLinks = [];
    $scope.editing = editing;

    $scope.isInitialFilter = true;

    $scope.query = {
        order: 'title',
        limit: 10,
        page: 1,
        filter: ""
    };

    $scope.filterImageLinks = function () {
        for (var i = 0; i < $scope.allImageLinks.length; i++) {
            var imageLink = $scope.allImageLinks[i];
            if (($scope.isInitialFilter) ? indexOfItemWithID(imageLink.id, $scope.specialTest.image_links) == -1 : indexOfItemWithID(imageLink.id, $scope.usedImageLinks) == -1) {
                if (indexOfItemWithID(imageLink.id, $scope.unusedImageLinks) == -1) {
                    $scope.unusedImageLinks.push(imageLink);
                }
            } else {
                if (indexOfItemWithID(imageLink.id, $scope.usedImageLinks) == -1) {
                    $scope.usedImageLinks.push(imageLink);
                }
            }
        }
        $scope.isInitialFilter = false;
    };

    $scope.remove = function(imageLinkToRemove) {
        var index = indexOfItemWithID(imageLinkToRemove.id, $scope.usedImageLinks);
        if (index != -1) {
            var allIndex = indexOfItemWithID(imageLinkToRemove.id, $scope.allImageLinks);
            if (allIndex != -1) {
                var specialTestIndex = indexOfItemWithID($scope.specialTest.id, $scope.allImageLinks[allIndex].special_tests);
                $scope.allImageLinks[allIndex].special_tests.splice(specialTestIndex, 1);
            }
            $scope.usedImageLinks.splice(index, 1);
            $scope.filterImageLinks();
        }
    };

    $scope.addImageLink = function () {
        if($scope.imageLinkToAdd) {
            $scope.usedImageLinks.push($scope.imageLinkToAdd);
            var index = indexOfItemWithID($scope.imageLinkToAdd.id, $scope.unusedImageLinks);
            $scope.unusedImageLinks.splice(index, 1);
            var allIndex = indexOfItemWithID($scope.imageLinkToAdd.id, $scope.allImageLinks);
            if (allIndex != -1) {
                var imageLink = $scope.allImageLinks[allIndex];
                if (!imageLink.special_tests) {
                    imageLink.special_tests = [];
                }
                imageLink.special_test.push( { "name": $scope.specialTest.name } );
            }
            $scope.imageLinkToAdd = null;
            $scope.filterImageLinks();
        }
    };

    $scope.save = function() {
        $mdDialog.hide($scope.usedImageLinks);
    };

    $scope.cancel = function() {
        $mdDialog.hide(null);
    };

    $scope.hide = function() {
        $mdDialog.hide(null);
    };

    $scope.enterKeyListener = function (event) {
        if (event.keyCode === 13) {
            $scope.save();
        }
    };

    $scope.filterImageLinks();
}
