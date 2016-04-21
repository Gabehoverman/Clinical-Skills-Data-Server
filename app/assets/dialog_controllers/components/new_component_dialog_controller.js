function NewComponentDialogController($scope, $mdDialog, $http, allSystems) {

	$scope.allSystems = allSystems;

	$scope.newComponent = {
		name: "",
		inspection: "",
		notes: ""
	};

	$scope.close = function() {
		$mdDialog.cancel();
	};

	$scope.create = function() {
		if ($scope.newComponent.name === "") {
			$scope.newComponentForm.$setSubmitted();
		} else {
			$mdDialog.hide($scope.newComponent);
		}
	};
}