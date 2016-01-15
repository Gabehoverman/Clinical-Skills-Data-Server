app.controller("SystemsController", ["$scope", "$http", function($scope, $http) {

	$scope.systems = [];

	$scope.selected = [];

	$scope.query = {
	    order: 'name',
	    limit: 10,
	    page: 1
  	};

	$http.get('http://localhost:3000/systems.json').then(function success(response) {
		for (var i = 0; i < response.data.length; i++) {
			var system = response.data[i].system;
			$scope.systems.push(system);
		}
	}, function error(response) {
		console.log(response.status + ": " + response.statusText);
		console.log(response);
	});
}]);