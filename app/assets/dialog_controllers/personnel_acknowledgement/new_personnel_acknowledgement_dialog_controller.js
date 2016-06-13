function NewPersonnelAcknowledgementController($scope, $mdDialog) {

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

    $scope.enterKeyListener = function (event) {
        if (event.keyCode === 13) {
            $scope.create();
        }
    }
}
NewPersonnelAcknowledgementController.$inject = ["$scope", "$mdDialog"];