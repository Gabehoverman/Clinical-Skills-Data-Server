function EditComponentsController($scope, $mdDialog, $http, links_url, system, editing) {
    $scope.hide = function() {
        $mdDialog.hide("Done");
    };
}
