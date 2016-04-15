function EditExamTechniquesDialogController($scope, $mdDialog, system, exam_techniques , editing) {

    $scope.system = system;
    $scope.exam_techniques = exam_techniques;
    $scope.editing = editing;

    $scope.query = {
        order: 'name',
        limit: 10,
        page: 1,
        filter: ""
    };

    $scope.remove = function(examTechniqueToRemove) {
        var index = indexOfItemWithID(examTechniqueToRemove.id, $scope.exam_techniques);
        if (index != -1) {
            $scope.exam_techniques.splice(index, 1);
        }
    };

    $scope.addExamTechnique = function(event) {
        console.log("Add");
    };

    $scope.save = function() {
        $mdDialog.hide($scope.exam_techniques);
    };

    $scope.cancel = function() {
        $mdDialog.hide(null);
    };

    $scope.hide = function() {
        $mdDialog.hide(null);
    };
}