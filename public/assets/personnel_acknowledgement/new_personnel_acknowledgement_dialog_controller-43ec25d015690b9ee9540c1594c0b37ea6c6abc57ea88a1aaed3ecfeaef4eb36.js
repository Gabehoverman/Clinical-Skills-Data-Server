function TestController($scope, $mdDialog) {

    $scope.newPersonnelAcknowledgement = {
        name: "",
        role: "",
        notes: ""
    };

    $scope.close = function() {
        $mdDialog.cancel();
    };

    $scope.create = function() {
        if ($scope.newPersonnelAcknowledgement.name === "") {
            $scope.newPersonnelAcknowledgementForm.$setSubmitted();
        } else {
            $mdDialog.hide($scope.newPersonnelAcknowledgement);
        }
    };
}
