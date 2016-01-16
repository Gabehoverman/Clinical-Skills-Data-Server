app.controller("LinksController", ["$scope", "$http", "$mdToast", function($scope, $http, $mdToast) {

	$scope.links = [];

	$scope.selected = [];

	$scope.query = {
	    order: 'title',
	    limit: 10,
	    page: 1,
	    filter: ""
  	};

	$scope.linksPromise = $http.get('http://localhost:3000/links.json').then(function success(response) {
		for (var i = 0; i < response.data.length; i++) {
			var link = response.data[i].link;
			$scope.links.push(link);
		}
	}, function error(response) {
		console.log(response.status + ": " + response.statusText);
		console.log(response);
	});

	$scope.toolbarTitle = function() {
		if ($scope.selected.length === 0) {
			return "All Links";
		} else if ($scope.selected.length === 1) {
			return "1 Link Selected";
		} else {
			return $scope.selected.length + " Links Selected";
		}
	};

	$scope.toggleSearching = function() {
		if ($scope.searching) {
			$scope.query.filter = "";
		}
		$scope.searching = !$scope.searching;
	};

	$scope.delete = function() {
		var text = $scope.selected.length + " ";
		text += ($scope.selected.length === 1) ? "Link" : "Links";
		text += " to be Deleted";

		$mdToast.show($mdToast.simple().textContent(text).position("top right").capsule(true));
	};

}]);