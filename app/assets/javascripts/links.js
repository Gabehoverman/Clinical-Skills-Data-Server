app.controller("LinksController", ["$scope", "$http", function($scope, $http) {

	$scope.links = [];

	$scope.selected = [];

	$scope.query = {
	    order: 'title',
	    limit: 10,
	    page: 1
  	};

	$http.get('http://localhost:3000/links.json').then(function success(response) {
		for (var i = 0; i < response.data.length; i++) {
			var link = response.data[i].link;
			$scope.links.push(link);
		}
	}, function error(response) {
		console.log(response.status + ": " + response.statusText);
		console.log(response);
	});
}]);