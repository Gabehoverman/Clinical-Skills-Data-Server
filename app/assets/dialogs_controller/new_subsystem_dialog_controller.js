function NewSubsystemDialogController($scope, $mdDialog, $http) {

	$scope.subsystems = [];
	$scope.systems = [];

	$scope.allLinks = [];

	$scope.newSubsystem = {
		name: "",
		details: "",
		parent_name: "",
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
		var index = indexOfItemWithID(link.id, $scope.newSubsystem.links);
		if (index === -1) {
			var addLink = $.extend(true, {}, link);
			delete addLink.isUsed;
			$scope.newSubsystem.links.push({
				"link": addLink
			});
		} else {
			$scope.newSubsystem.links.splice(index, 1);
		}
	};

	$scope.close = function() {
		$mdDialog.cancel();
	};

	$scope.create = function() {
		if ($scope.newSubsystem.name === "" || $scope.newSubsystem.details === "" || $scope.newSubsystem.parent_name === "") {
			$scope.newSubsystemForm.$setSubmitted();
		} else {
			$mdDialog.hide($scope.newSubsystem);
		}
	};

  	$scope.possibleParents = function(subsystem) {
  		var subsystemsClone = $scope.subsystems.slice();
  		var indexOfSelf = indexOfItemWithID(subsystem.id, subsystemsClone);
  		subsystemsClone.splice(indexOfSelf, 1);
  		return subsystemsClone.concat($scope.systems);
  	};

	$scope.subsystemsPromise = $http.get(subsystems_base_json_url).then(function success(response) {
		for (var i = 0; i < response.data.length; i++) {
			var subsystem = response.data[i].subsystem;
			$scope.subsystems.push(subsystem);
		}
	}, function error(response) {
		console.log(response.status + ": " + response.statusText);
		console.log(response);
	});

  	$scope.systemsPromise = $http.get(systems_base_json_url).then(
		function success(response) {
			for (var i = 0; i < response.data.length; i++) {
				var system = response.data[i].system;
				$scope.systems.push(system);
			}
		}, function error(response) {
			console.log(response.status + ": " + response.statusText);
			console.log(response);
		}
	);

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