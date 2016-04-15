function EditDialogController($scope, $mdDialog, $http, links_url, system, editing) {

	$scope.system = system;

	$scope.editing = editing;

	$scope.allLinks = [];
	$scope.systemLinks = [];
	$scope.reverts = [];

	$scope.query = {
	    order: 'id',
	    limit: 5,
	    page: 1,
	    filter: ""
  	};

	$scope.parseSystemLinks = function(system) {
        console.log(system);
        if (system.links) {
            for (var x = 0; x < system.links.length; x++) {
                $scope.systemLinks.push(system.links[x].link);
            }
        }
	};

	$scope.systemUsesLink = function(link) {
		for (var i = 0; i < $scope.systemLinks.length; i++) {
			if ($scope.systemLinks[i].id === link.id) {
				return true;
			}
		}
		return false;
	};

	$scope.toggleActive = function(link) {
		if ($scope.editing) {
			if (indexOfItemWithID(link.id, $scope.reverts) === -1) {
				var revertLink = $.extend(true, {}, link);
				revertLink.isUsed = !revertLink.isUsed;
				$scope.reverts.push(revertLink);
			}

			if (link.isUsed) {
				var addLink = $.extend(true, {}, link);
				delete addLink.isUsed;
				$scope.systemLinks.push(addLink);
			} else {
				var index = indexOfItemWithID(link.id, $scope.systemLinks);
				$scope.systemLinks.splice(index, 1);
			}
		}
	};

	$scope.hide = function() {
		$mdDialog.hide($scope.systemLinks);
	};

	$scope.linksPromise = $http.get(links_url).then(
		function success(response) {
			$scope.parseSystemLinks($scope.system);
			for (var i = 0; i < response.data.length; i++) {
				var link = response.data[i].link;
				link.isUsed = $scope.systemUsesLink(link);
				$scope.allLinks.push(link);
			}
		}, function error(response) {
			console.log(response.status + ": " + response.statusText);
			console.log(response);
		}
	);
}
