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

app.controller("LinksController", ["$scope", "$http", "$mdToast", "$mdDialog", "$mdEditDialog", "$mdMedia", function($scope, $http, $mdToast, $mdDialog, $mdEditDialog, $mdMedia) {

	$scope.links = [];
	$scope.changes = {
		updates: [],
		reverts: []
	};

	$scope.editing = false;

	$scope.query = {
	    order: 'title',
	    limit: 10,
	    page: 1,
	    filter: ""
  	};

  	$scope.save = function() {
		if ($scope.changes.updates.length !== 0) {
			for (var i = 0; i < $scope.changes.updates.length; i++) {
				$http({
					method: 'PATCH',
					url: links_base_url + "/" + $scope.changes.updates[i].id,
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
					url: links_base_url + "/" + $scope.changes.reverts[j].id,
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
			var linkBeforeUpdate = $scope.changes.reverts[i];
			var index = indexOfItemWithID(linkBeforeUpdate.id, $scope.links);
			if (index === -1) {
				$scope.links.push(linkBeforeUpdate);
			} else {
				$scope.links[index] = linkBeforeUpdate;
			}
		}
		$scope.changes.reverts = [];
		$scope.editing = false;
  	};

  	$scope.editTitle = function(event, linkToUpdate) {
		if ($scope.editing) {
			$mdEditDialog.small({
				modelValue: linkToUpdate.title,
				placeholder: "Title",
				save: function(input) {
					if (indexOfItemWithID(linkToUpdate.id, $scope.changes.reverts) === -1) {
						$scope.changes.reverts.push($.extend(true, {}, linkToUpdate));
					}
					var index = indexOfItemWithID(linkToUpdate.id, $scope.links);
					$scope.links[index].title = input.$modelValue;

					var changesIndex = indexOfItemWithID(linkToUpdate.id, $scope.changes.updates);
					if (changesIndex !== -1) {
						$scope.changes.updates.splice(changesIndex, 1);
					}
					$scope.changes.updates.push($scope.links[index]);
				},
				targetEvent: event
			});
		}
  	};

  	$scope.editLink = function(event, linkToUpdate) {
		if ($scope.editing) {
			$mdEditDialog.small({
				modelValue: linkToUpdate.link,
				placeholder: "Link",
				save: function(input) {
					if (indexOfItemWithID(linkToUpdate.id, $scope.changes.reverts) === -1) {
						$scope.changes.reverts.push($.extend(true, {}, linkToUpdate));
					}
					var index = indexOfItemWithID(linkToUpdate.id, $scope.links);
					$scope.links[index].link = input.$modelValue;

					var changesIndex = indexOfItemWithID(linkToUpdate.id, $scope.changes.updates);
					if (changesIndex !== -1) {
						$scope.changes.updates.splice(changesIndex, 1);
					}
					$scope.changes.updates.push($scope.links[index]);
				},
				targetEvent: event
			});
		}
  	};

  	$scope.editVisible = function(linkToUpdate) {
		var revertLink = $.extend(true, {}, linkToUpdate);
		revertLink.visible = !revertLink.visible;
		if (indexOfItemWithID(linkToUpdate.id, $scope.changes.reverts) === -1) {
			$scope.changes.reverts.push(revertLink);
		}
		var changesIndex = indexOfItemWithID(linkToUpdate.id, $scope.changes.updates);
		if (changesIndex !== -1) {
			$scope.changes.updates.splice(changesIndex, 1);
		}
		$scope.changes.updates.push(linkToUpdate);
  	};

  	$scope.delete = function(linkToDelete) {
		if (indexOfItemWithID(linkToDelete.id, $scope.changes.reverts) === -1) {
			$scope.changes.reverts.push($.extend(true, {}, linkToDelete));
		}
		var index = indexOfItemWithID(linkToDelete.id, $scope.links);
		$scope.links.splice(index, 1);
	};

  	$scope.newLink = function(event) {
		$mdDialog.show({
	      controller: NewLinkDialogController,
	      templateUrl: new_link_dialog_html_path,
	      parent: angular.element(document.body),
	      targetEvent: event,
	      clickOutsideToClose: false,
	      escapeToClose: false,
	      fullscreen: $mdMedia('xs') || $mdMedia('sm')
    	}).then(function(newLink) {
    		$http({
    			method: 'POST',
    			url: links_base_url,
    			dataType: 'json',
    			headers: {
    				'Content-type': 'application/json'
    			},
    			data: $scope.buildRequest(newLink)
    		}).then($scope.ajaxSuccess, $scope.ajaxFailure);
		});
  	};

	$scope.buildRequest = function(link) {
		var params = {
			'format': 'js'
		};

		for (var key in link) {
			if (key[0] !== '$') {
				params[key] = link[key];
			}
		}

		return params;
	};

	$scope.ajaxSuccess = function(response) {
		var text = "";
		if (response.config.method === 'POST' && response.status === 200) {
			$scope.links.push(response.data.link);
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

	$scope.linksPromise = $http.get('http://localhost:3000/links.json').then(function success(response) {
			for (var i = 0; i < response.data.length; i++) {
				var link = response.data[i].link;
				$scope.links.push(link);
			}
		}, $scope.ajaxFailure
	);

}]);