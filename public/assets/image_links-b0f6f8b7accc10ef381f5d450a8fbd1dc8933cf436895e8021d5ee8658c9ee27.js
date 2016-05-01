var ImageLinksController = Paloma.controller("ImageLinks");
app.controller("ImageLinksController", ["$scope", "$http", "$mdToast", "$mdDialog", "$mdEditDialog", "$mdMedia", 'apiService', function ($scope, $http, $mdToast, $mdDialog, $mdEditDialog, $mdMedia, apiService) {

    $scope.imageLinks = [];
    $scope.allExamTechniques = [];
    $scope.allSpecialTests = [];

    $scope.editing = false;

    $scope.query = {
        order: 'title',
        limit: 15,
        page: 1,
        filter: ""
    };

    ImageLinksController.prototype.index = function () {
        $scope.new_image_link_dialog_template_url = this.params.new_image_link_dialog_template_url;
        $scope.edit_exam_techniques_dialog_template_url = this.params.edit_exam_techniques_dialog_template_url;
        $scope.edit_special_tests_dialog_template_url = this.params.edit_special_tests_dialog_template_url;

        $scope.imageLinksPromise = $http.get(apiService.image_links_url, { 'params' : { 'format': 'json' } }).then(
            function success(response) {
                for (var i = 0; i < response.data.length; i++) {
                    var imageLink = response.data[i].image_link;
                    if (indexOfItemWithID(imageLink.id, $scope.imageLinks) == -1) {
                        $scope.imageLinks.push(imageLink);
                    }
                }
            }, $scope.ajaxFailure
        );

        $scope.examTechniquesPromise = $http.get(apiService.exam_techniques_url, { 'params' : { 'format': 'json' } }).then(
            function success(response) {
                for (var i = 0; i < response.data.length; i++) {
                    var examTechnique = response.data[i].exam_technique;
                    $scope.allExamTechniques.push(examTechnique);
                }
            }, $scope.ajaxFailure
        );

        $scope.specialTestsPromise = $http.get(apiService.special_tests_url, { 'params' : { 'format': 'json' } }).then(
            function success(response) {
                for (var i = 0; i < response.data.length; i++) {
                    var specialTest = response.data[i].special_test;
                    $scope.allSpecialTests.push(specialTest);
                }
            }, $scope.ajaxFailure
        );

        $scope.$apply();
    };

    $scope.done = function () {
        $scope.editing = !$scope.editing;
    };

    $scope.editTitle = function (event, imageLinkToUpdate) {
        if ($scope.editing) {
            $mdEditDialog.large({
                modelValue: imageLinkToUpdate.title,
                placeholder: "Title",
                clickOutsideToClose: false,
                escToClose: false,
                targetEvent: event,
                title: 'Edit Image Link Title',
                validators: {
                    'required': true
                },
                messages: {
                    'required': 'Title is required'
                },
                save: function (input) {
                    var index = indexOfItemWithID(imageLinkToUpdate.id, $scope.imageLinks);
                    if (index != -1) {
                        var imageLink = $scope.imageLinks[index];
                        imageLink.title = input.$modelValue;
                        $http.patch(apiService.image_links_url + imageLink.id, buildRequest(imageLink)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                    }
                }
            });
        }
    };

    $scope.editExamTechniques = function(imageLinkToUpdate) {
        $mdDialog.show({
            controller: EditExamTechniquesDialogController,
            templateUrl: $scope.edit_exam_techniques_dialog_template_url,
            parent: angular.element(document.body),
            targetEvent: event,
            clickOutsideToClose: false,
            escapeToClose: false,
            locals: {
                imageLink: imageLinkToUpdate,
                allExamTechniques: $scope.allExamTechniques,
                editing: $scope.editing
            },
            fullscreen: $mdMedia('xs') || $mdMedia('sm')
        }).then(function (examTechniques) {
            if (examTechniques) {
                var index = indexOfItemWithID(imageLinkToUpdate.id, $scope.imageLinks);
                if (index != -1) {
                    $scope.imageLinks[index].exam_techniques = examTechniques;
                    var imageLink = $scope.imageLinks[index];
                    $http.patch(apiService.image_links_url + imageLink.id, buildRequest(imageLink)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                }
            }
        });
    };

    $scope.editSpecialTests = function(imageLinkToUpdate) {
        $mdDialog.show({
            controller: EditSpecialTestsController,
            templateUrl: $scope.edit_special_tests_dialog_template_url,
            parent: angular.element(document.body),
            targetEvent: event,
            clickOutsideToClose: false,
            escapeToClose: false,
            locals: {
                component: componentToUpdate,
                allSpecialTests: $scope.allSpecialTests,
                editing: $scope.editing
            },
            fullscreen: $mdMedia('xs') || $mdMedia('sm')
        }).then(function (specialTests) {
            if (specialTests) {
                var index = indexOfItemWithID(imageLinkToUpdate.id, $scope.imageLinks);
                if (index != -1) {
                    $scope.imageLinks[index].special_tests = specialTests;
                    var imageLink = $scope.imageLinks[index];
                    $http.patch(apiService.image_links_url + imageLink.id, buildRequest(imageLink)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                }
            }
        });
    };

    $scope.editLink = function (event, imageLinkToUpdate) {
        if ($scope.editing) {
            $mdEditDialog.large({
                modelValue: imageLinkToUpdate.link,
                placeholder: "Link",
                clickOutsideToClose: false,
                escToClose: false,
                targetEvent: event,
                title: 'Edit Image Link Link',
                validators: {
                    'required': true
                },
                messages: {
                    'required': 'Link is required'
                },
                save: function (input) {
                    var index = indexOfItemWithID(imageLinkToUpdate.id, $scope.imageLinks);
                    if (index != -1) {
                        var imageLink = $scope.imageLinks[index];
                        imageLink.link = input.$modelValue;
                        $http.patch(apiService.image_links_url + imageLink.id, buildRequest(imageLink)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                    }
                }
            });
        }
    };

    $scope.delete = function (imageLinkToDelete) {
        var index = indexOfItemWithID(imageLinkToDelete.id, $scope.imageLinks);
        if (index != -1) {
            $scope.imageLinks.splice(index, 1);
            $http.delete(apiService.image_links_url + imageLinkToDelete.id, { 'params' : { 'format': 'json' } }).then($scope.ajaxSuccess, $scope.ajaxFailure);
        }
    };

    $scope.newImageLink = function (event) {
        $mdDialog.show({
            controller: NewImageLinkDialogController,
            templateUrl: $scope.new_image_link_dialog_template_url,
            parent: angular.element(document.body),
            targetEvent: event,
            clickOutsideToClose: false,
            escapeToClose: false,
            fullscreen: $mdMedia('xs') || $mdMedia('sm')
        }).then(function (newImageLink) {
        $http.post(apiService.image_links_url, buildRequest(newImageLink)).then(function(response) {
                if (response.config.method === 'POST' && response.status === 200) {
                    $scope.imageLinks.push(response.data.image_link);
                }
                $scope.ajaxSuccess(response);
            }, $scope.ajaxFailure);
        });
    };

    $scope.limitOptions = [10, 15, 20, {
        label: 'All',
        value: $scope.imageLinks.length
    }];

}]);
