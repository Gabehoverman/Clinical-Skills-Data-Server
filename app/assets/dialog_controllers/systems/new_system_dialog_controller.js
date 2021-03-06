function NewSystemDialogController($scope, $mdDialog) {

	$scope.newSystem = {
		name: "",
		details: ""
	};

	$scope.close = function() {
		$mdDialog.cancel();
	};

	$scope.create = function() {
		if ($scope.newSystem.name === "") {
			$scope.newSystemForm.$setSubmitted();
		} else {
			$mdDialog.hide($scope.newSystem);
		}
	};

    $scope.enterKeyListener = function (event) {
        if (event.keyCode === 13) {
            $scope.create();
        }
    };
}
NewSystemDialogController.$inject = ["$scope", "$mdDialog"];