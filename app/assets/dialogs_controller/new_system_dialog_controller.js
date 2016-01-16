function NewDialogController($scope, $mdDialog, $http) {

	$scope.allLinks = [];

	$scope.newSystem = {
		name: "",
		details: "",
		visible: false,
		links: []
	};

	$scope.query = {
	    order: 'id',
	    limit: 5,
	    page: 1,
	    filter: ""
  	};

	$scope.toggleActive = function(link) {
		var index = indexOfItemWithID(link.id, $scope.newSystem.links);
		if (index === -1) {
			var addLink = $.extend(true, {}, link);
			delete addLink.isUsed;
			$scope.newSystem.links.push({
				"link": addLink
			});
		} else {
			$scope.newSystem.links.splice(index, 1);
		}
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

	$scope.linksPromise = $http.get(links_base_json_url).then(
		function success(response) {
			for (var i = 0; i < response.data.length; i++) {
				var link = response.data[i].link;
				link.isUsed = false;
				$scope.allLinks.push(link);
			}
		}, function error(response) {
			console.log(response.status + ": " + response.statusText);
			console.log(response);
		}
	);
}