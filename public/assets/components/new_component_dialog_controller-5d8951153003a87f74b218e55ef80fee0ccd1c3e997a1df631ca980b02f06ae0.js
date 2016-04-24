function NewComponentDialogController($scope, $mdDialog, $http, allSystems) {

	$scope.allSystems = allSystems;

	$scope.newComponent = {
		name: "",
		inspection: "",
		notes: "",
		system: {
			id: -1,
			name: ""
		}
	};

	$scope.close = function() {
		$mdDialog.cancel();
	};

	$scope.create = function() {
		if ($scope.newComponent.name === "" || $scope.selectedSystem === "") {
			$scope.newComponentForm.$setSubmitted();
		} else {
			$scope.newComponent.system.id = $scope.selectedSystem.id;
			$scope.newComponent.system.name = $scope.selectedSystem.name;
			$mdDialog.hide($scope.newComponent);
		}
	};
}
