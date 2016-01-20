function NewLinkDialogController($scope, $mdDialog, $http) {

	$scope.newLink = {
		title: "",
		link: "",
		visible: false
	};

	$scope.close = function() {
		$mdDialog.cancel();
	};

	$scope.create = function() {
		if ($scope.newLink.title === "" || $scope.newLink.link === "") {
			$scope.newLinkForm.$setSubmitted();
		} else {
			$mdDialog.hide($scope.newLink);
		}
	};
}