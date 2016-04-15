function EditComponentsController($scope, $mdDialog, $http, system, editing) {
    $scope.hide = function() {
        $mdDialog.hide("Done");
    };
}
