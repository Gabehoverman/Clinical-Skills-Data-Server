function EditVideoLinksController($scope, $mdDialog, specialTest, allVideoLinks, editing) {

    $scope.specialTest = specialTest;
    $scope.allVideoLinks = allVideoLinks;
    $scope.usedVideoLinks = [];
    $scope.unusedVideoLinks = [];
    $scope.editing = editing;

    $scope.isInitialFilter = true;

    $scope.query = {
        order: 'title',
        limit: 10,
        page: 1,
        filter: ""
    };

    $scope.filterVideoLinks = function () {
        for (var i = 0; i < $scope.allVideoLinks.length; i++) {
            var videoLink = $scope.allVideoLinks[i];
            if (($scope.isInitialFilter) ? indexOfItemWithID(videoLink.id, $scope.specialTest.video_links) == -1 : indexOfItemWithID(videoLink.id, $scope.usedVideoLinks) == -1) {
                if (indexOfItemWithID(videoLink.id, $scope.unusedVideoLinks) == -1) {
                    if (videoLink.special_tests.length === 0) {
                        $scope.unusedVideoLinks.push(videoLink);
                    }
                }
            } else {
                if (indexOfItemWithID(videoLink.id, $scope.usedVideoLinks) == -1) {
                    $scope.usedVideoLinks.push(videoLink);
                }
            }
        }
        $scope.isInitialFilter = false;
    };

    $scope.remove = function(videoLinkToRemove) {
        var index = indexOfItemWithID(videoLinkToRemove.id, $scope.usedVideoLinks);
        if (index != -1) {
            var allIndex = indexOfItemWithID(videoLinkToRemove.id, $scope.allVideoLinks);
            if (allIndex != -1) {
                var specialTestIndex = indexOfItemWithID($scope.specialTest.id, $scope.allVideoLinks[allIndex].special_tests);
                $scope.allVideoLinks[allIndex].special_tests.splice(specialTestIndex, 1);
            }
            $scope.usedVideoLinks.splice(index, 1);
            $scope.filterVideoLinks();
        }
    };

    $scope.addVideoLink = function () {
        if($scope.videoLinkToAdd) {
            $scope.usedVideoLinks.push($scope.videoLinkToAdd);
            var index = indexOfItemWithID($scope.videoLinkToAdd.id, $scope.unusedVideoLinks);
            $scope.unusedVideoLinks.splice(index, 1);
            var allIndex = indexOfItemWithID($scope.videoLinkToAdd.id, $scope.allVideoLinks);
            if (allIndex != -1) {
                var videoLink = $scope.allVideoLinks[allIndex];
                if (!videoLink.special_tests) {
                    videoLink.special_tests = [];
                }
                videoLink.special_test.push( { "name": $scope.specialTest.name } );
            }
            $scope.videoLinkToAdd = null;
            $scope.filterVideoLinks();
        }
    };

    $scope.save = function() {
        $mdDialog.hide($scope.usedVideoLinks);
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

    $scope.filterVideoLinks();
}
