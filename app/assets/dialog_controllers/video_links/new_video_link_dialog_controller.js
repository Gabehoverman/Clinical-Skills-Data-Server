function NewVideoLinkDialogController($scope, $mdDialog) {

    $scope.newVideoLink = {
        title: "",
        link: ""
    };

    $scope.close = function() {
        $mdDialog.cancel();
    };

    $scope.create = function() {
        if ($scope.newVideoLink.title === "" || $scope.newVideoLink.link === "") {
            $scope.newVideoLinkForm.$setSubmitted();
        } else {
            $mdDialog.hide($scope.newVideoLink);
        }
    };
}