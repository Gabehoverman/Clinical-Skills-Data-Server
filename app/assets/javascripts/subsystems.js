app.controller("SubsystemsController", ["$scope", "$http", function($scope, $http) {

	$scope.subsystems = [];

	$scope.selected = [];

	$scope.query = {
	    order: 'name',
	    limit: 10,
	    page: 1
  	};

	$http.get('http://localhost:3000/subsystems.json').then(function success(response) {
		for (var i = 0; i < response.data.length; i++) {
			var subsystem = response.data[i].subsystem;
			$scope.subsystems.push(subsystem);
		}
	}, function error(response) {
		console.log(response.status + ": " + response.statusText);
		console.log(response);
	});
}]);