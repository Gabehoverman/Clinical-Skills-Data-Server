var VideoLinksController = Paloma.controller("VideoLinks");
app.controller("VideoLinksController", ["$scope", "$http", "$mdToast", "$mdDialog", "$mdEditDialog", "$mdMedia", 'apiService', function ($scope, $http, $mdToast, $mdDialog, $mdEditDialog, $mdMedia, apiService) {

    $scope.videoLinks = [];
    $scope.allExamTechniques = [];
    $scope.allSpecialTests = [];

    $scope.editing = false;

    $scope.query = {
        order: 'title',
        limit: 15,
        page: 1,
        filter: ""
    };

    VideoLinksController.prototype.index = function () {
        $scope.new_video_link_dialog_template_url = this.params.new_video_link_dialog_template_url;
        $scope.edit_exam_techniques_dialog_template_url = this.params.edit_exam_techniques_dialog_template_url;
        $scope.edit_special_tests_dialog_template_url = this.params.edit_special_tests_dialog_template_url;

        $scope.videoLinksPromise = $http.get(apiService.video_links_url, { 'params' : { 'format': 'json' } }).then(
            function success(response) {
                for (var i = 0; i < response.data.length; i++) {
                    var videoLink = response.data[i].video_link;
                    if (indexOfItemWithID(videoLink.id, $scope.videoLinks) == -1) {
                        $scope.videoLinks.push(videoLink);
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

    $scope.editTitle = function (event, videoLinkToUpdate) {
        if ($scope.editing) {
            $mdEditDialog.large({
                modelValue: videoLinkToUpdate.title,
                placeholder: "Title",
                clickOutsideToClose: false,
                escToClose: false,
                targetEvent: event,
                title: 'Edit Video Link Title',
                validators: {
                    'required': true
                },
                messages: {
                    'required': 'Title is required'
                },
                save: function (input) {
                    var index = indexOfItemWithID(videoLinkToUpdate.id, $scope.videoLinks);
                    if (index != -1) {
                        var videoLink = $scope.videoLinks[index];
                        videoLink.title = input.$modelValue;
                        $http.patch(apiService.video_links_url + videoLink.id, buildRequest(videoLink)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                    }
                }
            });
        }
    };

    $scope.editExamTechniques = function(videoLinkToUpdate) {
        $mdDialog.show({
            controller: EditExamTechniquesDialogController,
            templateUrl: $scope.edit_exam_techniques_dialog_template_url,
            parent: angular.element(document.body),
            targetEvent: event,
            clickOutsideToClose: false,
            escapeToClose: false,
            locals: {
                videoLink: videoLinkToUpdate,
                allExamTechniques: $scope.allExamTechniques,
                editing: $scope.editing
            },
            fullscreen: $mdMedia('xs') || $mdMedia('sm')
        }).then(function (examTechniques) {
            if (examTechniques) {
                var index = indexOfItemWithID(videoLinkToUpdate.id, $scope.videoLinks);
                if (index != -1) {
                    $scope.videoLinks[index].exam_techniques = examTechniques;
                    var videoLink = $scope.videoLinks[index];
                    $http.patch(apiService.video_links_url + videoLink.id, buildRequest(videoLink)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                }
            }
        });
    };

    $scope.editSpecialTests = function(videoLinkToUpdate) {
        $mdDialog.show({
            controller: EditSpecialTestsController,
            templateUrl: $scope.edit_special_tests_dialog_template_url,
            parent: angular.element(document.body),
            targetEvent: event,
            clickOutsideToClose: false,
            escapeToClose: false,
            locals: {
                videoLink: videoLinkToUpdate,
                allSpecialTests: $scope.allSpecialTests,
                editing: $scope.editing
            },
            fullscreen: $mdMedia('xs') || $mdMedia('sm')
        }).then(function (specialTests) {
            if (specialTests) {
                var index = indexOfItemWithID(videoLinkToUpdate.id, $scope.videoLinks);
                if (index != -1) {
                    $scope.videoLinks[index].special_tests = specialTests;
                    var videoLink = $scope.videoLinks[index];
                    $http.patch(apiService.video_links_url + videoLink.id, buildRequest(videoLink)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                }
            }
        });
    };

    $scope.editLink = function (event, videoLinkToUpdate) {
        if ($scope.editing) {
            $mdEditDialog.large({
                modelValue: videoLinkToUpdate.link,
                placeholder: "Link",
                clickOutsideToClose: false,
                escToClose: false,
                targetEvent: event,
                title: 'Edit Video Link Link',
                validators: {
                    'required': true
                },
                messages: {
                    'required': 'Link is required'
                },
                save: function (input) {
                    var index = indexOfItemWithID(videoLinkToUpdate.id, $scope.videoLinks);
                    if (index != -1) {
                        var videoLink = $scope.videoLinks[index];
                        videoLink.link = input.$modelValue;
                        $http.patch(apiService.video_links_url + videoLink.id, buildRequest(videoLink)).then($scope.ajaxSuccess, $scope.ajaxFailure);
                    }
                }
            });
        }
    };

    $scope.delete = function (videoLinkToDelete) {
        var index = indexOfItemWithID(videoLinkToDelete.id, $scope.videoLinks);
        if (index != -1) {
            $scope.videoLinks.splice(index, 1);
            $http.delete(apiService.video_links_url + videoLinkToDelete.id, { 'params' : { 'format': 'json' } }).then($scope.ajaxSuccess, $scope.ajaxFailure);
        }
    };

    $scope.newVideoLink = function (event) {
        $mdDialog.show({
            controller: NewVideoLinkDialogController,
            templateUrl: $scope.new_video_link_dialog_template_url,
            parent: angular.element(document.body),
            targetEvent: event,
            clickOutsideToClose: false,
            escapeToClose: false,
            fullscreen: $mdMedia('xs') || $mdMedia('sm')
        }).then(function (newVideoLink) {
            $http.post(apiService.video_links_url, buildRequest(newVideoLink)).then(function(response) {
                if (response.config.method === 'POST' && response.status === 200) {
                    $scope.videoLinks.push(response.data.video_link);
                }
                $scope.ajaxSuccess(response);
            }, $scope.ajaxFailure);
        });
    };

    $scope.limitOptions = [10, 15, 20, {
        label: 'All',
        value: $scope.videoLinks.length
    }];

}]);
