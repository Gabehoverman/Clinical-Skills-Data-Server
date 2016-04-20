function NewSystemDialogController($scope, $mdDialog, $http) {

	$scope.newSystem = {
		name: "",
		details: ""
	};

	$scope.close = function() {
		$mdDialog.cancel();
	};

	$scope.create = function() {
		if ($scope.newSystem.name === "" || $scope.newSystem.details === "") {
			$scope.newSystemForm.$setSubmitted();
		} else {
			$mdDialog.hide($scope.newSystem);
		}
	};
}
