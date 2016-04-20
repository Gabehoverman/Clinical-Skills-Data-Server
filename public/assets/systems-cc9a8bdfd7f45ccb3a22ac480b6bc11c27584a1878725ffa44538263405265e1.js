var SystemsController = Paloma.controller("Systems");
app.controller("SystemsController", ["$scope", "$http", "$mdToast", "$mdDialog", "$mdEditDialog", "$mdMedia", function($scope, $http, $mdToast, $mdDialog, $mdEditDialog, $mdMedia) {

    $scope.systems = [];
    $scope.changes = {
        updates: [],
        deletes: [],
        reverts: []
    };

    $scope.editing = false;

    $scope.query = {
        order: 'name',
        limit: 10,
        page: 1,
        filter: ""
    };

    SystemsController.prototype.index = function() {
        $scope.systems_url = this.params.systems_url;
        $scope.system_post_url = this.params.system_post_url;
        $scope.new_system_dialog_template_url = this.params.new_system_dialog_template_url;
        $scope.edit_components_dialog_template_url = this.params.edit_components_dialog_template_url;
        //$scope.edit_links_dialog_template_url = this.params.edit_links_dialog_template_url;
        //$scope.new_link_dialog_template_url = this.params.new_link_dialog_template_url;

        $scope.systemsPromise = $http.get($scope.systems_url, { 'format': 'json' }).then(
            function success(response) {
                for (var i = 0; i < response.data.length; i++) {
                    var system = response.data[i].system;
                    $scope.systems.push(system);
                }
            }, $scope.ajaxFailure
        );

        $scope.$apply();
    };

	$scope.save = function() {
		if ($scope.changes.updates.length !== 0) {
			for (var i = 0; i < $scope.changes.updates.length; i++) {
				$http.patch($scope.systems_url + "/" + $scope.changes.updates[i].id, buildRequest($scope.changes.updates[i])).then($scope.ajaxSuccess, $scope.ajaxFailure);

				var revertsIndex = indexOfItemWithID($scope.changes.updates[i].id, $scope.changes.reverts);
				if (revertsIndex !== -1) {
					$scope.changes.reverts.splice(revertsIndex, 1);
				}
			}
		}

		if ($scope.changes.deletes.length !== 0) {
			for (var j = 0; j < $scope.changes.deletes.length; j++) {
				$http({
					method: 'DELETE',
					url: $scope.systems_url + "/" + $scope.changes.deletes[j].id,
					dataType: 'json',
					headers: {
						'Content-type': 'application/json'
					},
					data: buildRequest($scope.changes.deletes[j])
				}).then($scope.ajaxSuccess, $scope.ajaxFailure);
			}
		}

		$scope.changes.updates = [];
		$scope.changes.deletes = [];
		$scope.changes.reverts = [];
		$scope.editing = false;
	};

	$scope.cancel = function() {
		for (var i = 0; i < $scope.changes.reverts.length; i++) {
			var systemBeforeUpdate = $scope.changes.reverts[i];
			var index = indexOfItemWithID(systemBeforeUpdate.id, $scope.systems);
			if (index === -1) {
				$scope.systems.push(systemBeforeUpdate);
			} else {
				$scope.systems[index] = systemBeforeUpdate;
			}
		}
		$scope.changes.updates = [];
		$scope.changes.deletes = [];
		$scope.changes.reverts = [];
		$scope.editing = false;
	};

	$scope.editName = function(event, systemToUpdate) {
		if ($scope.editing) {
			$mdEditDialog.small({
				modelValue: systemToUpdate.name,
				placeholder: "Name",
				save: function(input) {
					if (indexOfItemWithID(systemToUpdate.id, $scope.changes.reverts) === -1) {
						$scope.changes.reverts.push($.extend(true, {}, systemToUpdate));
					}
					var index = indexOfItemWithID(systemToUpdate.id, $scope.systems);
					$scope.systems[index].name = input.$modelValue;

					var changesIndex = indexOfItemWithID(systemToUpdate.id, $scope.changes.updates);
					if (changesIndex !== -1) {
						$scope.changes.updates.splice(changesIndex, 1);
					}
					$scope.changes.updates.push($scope.systems[index]);
				},
				targetEvent: event,
				validators: {
					"md-maxlength": 15
				}
			});
		}
	};

	$scope.editDetails = function(event, systemToUpdate) {
		if ($scope.editing) {
			$mdEditDialog.small({
				modelValue: systemToUpdate.details,
				placeholder: "Details",
				save: function(input) {
					if (indexOfItemWithID(systemToUpdate.id, $scope.changes.reverts) === -1) {
						$scope.changes.reverts.push($.extend(true, {}, systemToUpdate));
					}
					var index = indexOfItemWithID(systemToUpdate.id, $scope.systems);
					$scope.systems[index].details = input.$modelValue;
					
					var changesIndex = indexOfItemWithID(systemToUpdate.id, $scope.changes.updates);
					if (changesIndex !== -1) {
						$scope.changes.updates.splice(changesIndex, 1);
					}
					$scope.changes.updates.push($scope.systems[index]);
				},
				targetEvent: event,
				validators: {
					"md-maxlength": 500
				}
			});
		}
	};

    $scope.editComponents = function (event, systemToUpdate) {
        $mdDialog.show({
            controller: EditComponentsController,
            templateUrl: $scope.edit_components_dialog_template_url,
            parent: angular.element(document.body),
            targetEvent: event,
            clickOutsideToClose: false,
            escapeToClose: false,
            locals: {
                system: systemToUpdate,
                editing: $scope.editing
            },
            fullscreen: $mdMedia('xs') || $mdMedia('sm')
        }).then(function(response) {
            console.log(response);
        });
    };

	//$scope.editLinks = function(event, systemToUpdate) {
	//	$mdDialog.show({
	//      controller: EditDialogController,
	//      templateUrl: $scope.edit_links_dialog_template_url,
	//      parent: angular.element(document.body),
	//      targetEvent: event,
	//      clickOutsideToClose: false,
	//      escapeToClose: false,
	//      locals: {
     //       links_url: $scope.edit_links_dialog_template_url,
     //       system: systemToUpdate,
     //       editing: $scope.editing
	//      },
	//      fullscreen: $mdMedia('xs') || $mdMedia('sm')
    	//}).then(function(links) {
    	//	if (indexOfItemWithID(systemToUpdate.id, $scope.changes.reverts) === -1) {
	//			$scope.changes.reverts.push($.extend(true, {}, systemToUpdate));
	//		}
    	//	for (var i = 0; i < links.length; i++) {
    	//		links[i] = {
    	//			"link": links[i]
    	//		};
    	//	}
    	//	systemToUpdate.links = links;
	//		var changesIndex = indexOfItemWithID(systemToUpdate.id, $scope.changes.updates);
	//		if (changesIndex !== -1) {
	//			$scope.changes.updates.splice(changesIndex, 1);
	//		}
	//		$scope.changes.updates.push(systemToUpdate);
    	//});
	//};

	$scope.editVisible = function(systemToUpdate) {
		var revertSystem = $.extend(true, {}, systemToUpdate);
		revertSystem.visible = !revertSystem.visible;
		if (indexOfItemWithID(systemToUpdate.id, $scope.changes.reverts) === -1) {
			$scope.changes.reverts.push(revertSystem);
		}
		var changesIndex = indexOfItemWithID(systemToUpdate.id, $scope.changes.updates);
		if (changesIndex !== -1) {
			$scope.changes.updates.splice(changesIndex, 1);
		}
		$scope.changes.updates.push(systemToUpdate);
	};

	$scope.delete = function(systemToDelete) {
		$scope.changes.deletes.push(systemToDelete);
		if (indexOfItemWithID(systemToDelete.id, $scope.changes.reverts) === -1) {
			$scope.changes.reverts.push($.extend(true, {}, systemToDelete));
		}
		var index = indexOfItemWithID(systemToDelete.id, $scope.systems);
		$scope.systems.splice(index, 1);
	};

	$scope.newSystem = function(event) {
		$mdDialog.show({
	      controller: NewSystemDialogController,
	      templateUrl: $scope.new_system_dialog_template_url,
	      parent: angular.element(document.body),
	      targetEvent: event,
	      clickOutsideToClose: false,
	      escapeToClose: false,
	      fullscreen: $mdMedia('xs') || $mdMedia('sm')
    	}).then(function(newSystem) {
    		$http.post($scope.system_post_url, buildRequest(newSystem)).then($scope.ajaxSuccess, $scope.ajaxFailure);
		});
	};

	$scope.ajaxSuccess = function(response) {
		var text = "";
		if (response.config.method === 'POST' && response.status === 200) {
			$scope.systems.push(response.data.system);
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

}]);