function indexOfItemWithID(id, collection) {
	for (var i = 0; i < collection.length; i++) {
		if (collection[i].id === undefined) {
			if (id === collection[i].link.id) {
				return i;
			}
		}
		if (id === collection[i].id) {
			return i;
		}
	}
	return -1;
}

app.controller("SubsystemsController", ["$scope", "$http", "$mdToast", "$mdDialog", "$mdEditDialog", "$mdMedia", function($scope, $http, $mdToast, $mdDialog, $mdEditDialog, $mdMedia) {

	$scope.subsystems = [];
	$scope.systems = [];
	$scope.changes = {
		updates: [],
		reverts: []
	};

	$scope.selected = [];

	$scope.editing = false;

	$scope.query = {
	    order: 'id',
	    limit: 10,
	    page: 1,
	    filter: ""
  	};

  	$scope.possibleParents = function(subsystem) {
  		var subsystemsClone = $scope.subsystems.slice();
  		var indexOfSelf = indexOfItemWithID(subsystem.id, subsystemsClone);
  		subsystemsClone.splice(indexOfSelf, 1);
  		return subsystemsClone.concat($scope.systems);
  	};

	$scope.save = function() {
		if ($scope.changes.updates.length !== 0) {
			for (var i = 0; i < $scope.changes.updates.length; i++) {
				$http({
					method: 'PATCH',
					url: subsystems_base_url + "/" + $scope.changes.updates[i].id,
					dataType: 'json',
					headers: {
						'Content-type': 'application/json'
					},
					data: $scope.buildRequest($scope.changes.updates[i])
				}).then($scope.ajaxSuccess, $scope.ajaxFailure);
				var revertsIndex = indexOfItemWithID($scope.changes.updates[i].id, $scope.changes.reverts);
				if (revertsIndex !== -1) {
					$scope.changes.reverts.splice(revertsIndex, 1);
				}
			}
		}

		if ($scope.changes.reverts.length !== 0) {
			for (var j = 0; j < $scope.changes.reverts.length; j++) {
				$http({
					method: 'DELETE',
					url: subsystems_base_url + "/" + $scope.changes.reverts[j].id,
					dataType: 'json',
					headers: {
						'Content-type': 'application/json'
					},
					data: $scope.buildRequest($scope.changes.reverts[j])
				}).then($scope.ajaxSuccess, $scope.ajaxFailure);
			}
		}

		$scope.changes.reverts = [];
		$scope.editing = false;
	};

	$scope.cancel = function() {
		for (var i = 0; i < $scope.changes.reverts.length; i++) {
			var subsystemBeforeUpdate = $scope.changes.reverts[i];
			var index = indexOfItemWithID(subsystemBeforeUpdate.id, $scope.subsystems);
			if (index === -1) {
				$scope.subsystems.push(subsystemBeforeUpdate);
			} else {
				$scope.subsystems[index] = subsystemBeforeUpdate;
			}
		}
		$scope.changes.reverts = [];
		$scope.editing = false;
	};

	$scope.delete = function(subsystemToDelete) {
		if (indexOfItemWithID(subsystemToDelete.id, $scope.changes.reverts) === -1) {
			$scope.changes.reverts.push($.extend(true, {}, subsystemToDelete));
		}
		var index = indexOfItemWithID(subsystemToDelete.id, $scope.subsystems);
		$scope.subsystems.splice(index, 1);
	};

	$scope.editName = function(event, subsystemToUpdate) {
		if ($scope.editing) {
			$mdEditDialog.small({
				modelValue: subsystemToUpdate.name,
				placeholder: "Name",
				save: function(input) {
					if (indexOfItemWithID(subsystemToUpdate.id, $scope.changes.reverts) === -1) {
						$scope.changes.reverts.push($.extend(true, {}, subsystemToUpdate));
					}
					var index = indexOfItemWithID(subsystemToUpdate.id, $scope.subsystems);
					$scope.subsystems[index].name = input.$modelValue;

					var changesIndex = indexOfItemWithID(subsystemToUpdate.id, $scope.changes.updates);
					if (changesIndex !== -1) {
						$scope.changes.updates.splice(changesIndex, 1);
					}
					$scope.changes.updates.push($scope.subsystems[index]);
				},
				targetEvent: event,
				validators: {
					"md-maxlength": 15
				}
			});
		}
	};

	$scope.editDetails = function(event, subsystemToUpdate) {
		if ($scope.editing) {
			$mdEditDialog.small({
				modelValue: subsystemToUpdate.details,
				placeholder: "Details",
				save: function(input) {
					if (indexOfItemWithID(subsystemToUpdate.id, $scope.changes.reverts) === -1) {
						$scope.changes.reverts.push($.extend(true, {}, subsystemToUpdate));
					}
					var index = indexOfItemWithID(subsystemToUpdate.id, $scope.subsystems);
					$scope.subsystems[index].details = input.$modelValue;
					
					var changesIndex = indexOfItemWithID(subsystemToUpdate.id, $scope.changes.updates);
					if (changesIndex !== -1) {
						$scope.changes.updates.splice(changesIndex, 1);
					}
					$scope.changes.updates.push($scope.subsystems[index]);
				},
				targetEvent: event,
				validators: {
					"md-maxlength": 500
				}
			});
		}
	};

	$scope.editParentName = function(event, subsystemToUpdate, oldParentName) {
		if ($scope.editing) {
			if (indexOfItemWithID(subsystemToUpdate.id, $scope.changes.reverts) === -1) {
				var revertSubsystem = $.extend(true, {}, subsystemToUpdate);
				revertSubsystem.parent_name = oldParentName;
				$scope.changes.reverts.push(revertSubsystem);
			}

			var index = indexOfItemWithID(subsystemToUpdate.id, $scope.subsystems);
			$scope.subsystems[index].parent_name = subsystemToUpdate.parent_name;

			var changesIndex = indexOfItemWithID(subsystemToUpdate.id, $scope.changes.updates);
			if (changesIndex !== -1) {
				$scope.changes.updates.splice(changesIndex, 1);
			}
			$scope.changes.updates.push($scope.subsystems[index]);
		}
	};

	$scope.editLinks = function(event, subsystemToUpdate) {
		$mdDialog.show({
	      controller: EditDialogController,
	      templateUrl: edit_links_dialog_html_path,
	      parent: angular.element(document.body),
	      targetEvent: event,
	      clickOutsideToClose: false,
	      escapeToClose: false,
	      locals: {
	      	system: subsystemToUpdate,
	      	editing: $scope.editing
	      },
	      fullscreen: $mdMedia('xs') || $mdMedia('sm')
    	}).then(function(links) {
    		if (indexOfItemWithID(subsystemToUpdate.id, $scope.changes.reverts) === -1) {
				$scope.changes.reverts.push($.extend(true, {}, subsystemToUpdate));
			}
    		for (var i = 0; i < links.length; i++) {
    			links[i] = {
    				"link": links[i]
    			};
    		}
    		subsystemToUpdate.links = links;
			var changesIndex = indexOfItemWithID(subsystemToUpdate.id, $scope.changes.updates);
			if (changesIndex !== -1) {
				$scope.changes.updates.splice(changesIndex, 1);
			}
			$scope.changes.updates.push(subsystemToUpdate);
    	});
	};

	$scope.editVisible = function(subsystemToUpdate) {
		var revertSubsystem = $.extend(true, {}, subsystemToUpdate);
		revertSubsystem.visible = !revertSubsystem.visible;
		if (indexOfItemWithID(subsystemToUpdate.id, $scope.changes.reverts) === -1) {
			$scope.changes.reverts.push(revertSubsystem);
		}
		var changesIndex = indexOfItemWithID(subsystemToUpdate.id, $scope.changes.updates);
		if (changesIndex !== -1) {
			$scope.changes.updates.splice(changesIndex, 1);
		}
		$scope.changes.updates.push(subsystemToUpdate);
	};

	$scope.newSubsystem = function(event) {
		$mdDialog.show({
	      controller: NewDialogController,
	      templateUrl: new_subsystem_dialog_html_path,
	      parent: angular.element(document.body),
	      targetEvent: event,
	      clickOutsideToClose: false,
	      escapeToClose: false,
	      fullscreen: $mdMedia('xs') || $mdMedia('sm')
    	}).then(function(newSubsystem) {
    		$http({
    			method: 'POST',
    			url: subsystems_base_url,
    			dataType: 'json',
    			headers: {
    				'Content-type': 'application/json'
    			},
    			data: $scope.buildRequest(newSubsystem)
    		}).then($scope.ajaxSuccess, $scope.ajaxFailure);
		});
	};

	$scope.buildRequest = function(subsystem) {
		var params = {
			'format': 'js'
		};

		for (var key in subsystem) {
			if (key[0] !== '$') {
				params[key] = subsystem[key];
			}
		}

		return params;
	};

	$scope.ajaxSuccess = function(response) {
		var text = "";
		if (response.config.method === 'POST' && response.status === 200) {
			$scope.subsystems.push(response.data.subsystem);
		}

		if (response.status === 200) {
			text = "Success!";
		} else {
			text = response.status + ": " + response.statusText;
		}

		$mdToast.show($mdToast.simple().textContent(text).capsule(true).hideDelay(2000).position('top right'));
	};

	$scope.ajaxFailure = function(response) {
		var text = response.status + ": " + response.statusText;
		$mdToast.show($mdToast.simple().textContent(text).capsule(true).hideDelay(2000).position('top right'));
	};

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

	$scope.subsystemsPromise = $http.get(subsystems_base_json_url).then(function success(response) {
		for (var i = 0; i < response.data.length; i++) {
			var subsystem = response.data[i].subsystem;
			$scope.subsystems.push(subsystem);
		}
	}, function error(response) {
		console.log(response.status + ": " + response.statusText);
		console.log(response);
	});

}]);