app.controller("SubsystemsController", ["$scope", "$http", "$mdToast", function($scope, $http, $mdToast) {

	$scope.subsystems = [];

	$scope.selected = [];

	$scope.searching = false;

	$scope.query = {
	    order: 'name',
	    limit: 10,
	    page: 1,
	    filter: ""
  	};

	$scope.subsystemsPromise = $http.get('http://localhost:3000/subsystems.json').then(function success(response) {
		for (var i = 0; i < response.data.length; i++) {
			var subsystem = response.data[i].subsystem;
			$scope.subsystems.push(subsystem);
		}
	}, function error(response) {
		console.log(response.status + ": " + response.statusText);
		console.log(response);
	});

	$scope.toolbarTitle = function() {
		if ($scope.selected.length === 0) {
			return "All Subsystems";
		} else if ($scope.selected.length === 1) {
			return "1 Subsystem Selected";
		} else {
			return $scope.selected.length + " Subsystems Selected";
		}
	};

	$scope.delete = function() {
		var text = $scope.selected.length + " ";
		text += ($scope.selected.length === 1) ? "Subsystem" : "Subsystems";
		text += " to be Deleted";

		$mdToast.show($mdToast.simple().textContent(text).position("top right").capsule(true));
	};

}]);