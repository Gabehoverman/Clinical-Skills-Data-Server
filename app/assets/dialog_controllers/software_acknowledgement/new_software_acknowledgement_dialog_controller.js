function NewSoftwareAcknowledgementController($scope, $mdDialog) {

    $scope.newSoftwareAcknowledgement = {
        name: "",
        link: ""
    };

    $scope.close = function() {
        $mdDialog.cancel();
    };

    $scope.create = function() {
        if ($scope.newSoftwareAcknowledgement.name === "" || $scope.newSoftwareAcknowledgement.link === "") {
            $scope.newSoftwareAcknowledgementForm.$setSubmitted();
        } else {
            $mdDialog.hide($scope.newSoftwareAcknowledgement);
        }
    };
}