function NewImageLinkDialogController($scope, $mdDialog) {

    $scope.newImageLink = {
        title: "",
        link: ""
    };

    $scope.close = function() {
        $mdDialog.cancel();
    };

    $scope.create = function() {
        if ($scope.newImageLink.title === "" || $scope.newImageLink.link === "") {
            $scope.newImageLinkForm.$setSubmitted();
        } else {
            $mdDialog.hide($scope.newImageLink);
        }
    };
}
