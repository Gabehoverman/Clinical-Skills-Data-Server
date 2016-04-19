// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require paloma

$(document).ready(function(){
  Paloma.start();
});

app.controller("BodyController", ['$scope', '$mdSidenav', function($scope, $mdSidenav) {

    $scope.toggleSidenav = function (menuID) {
        $mdSidenav(menuID).toggle();
    };

    $scope.ajaxSuccess = function (response) {
        var text = "";

        if (response.status === 200) {
            text = "Success!";
        } else {
            text = response.status + ": " + response.statusText;
        }

        $mdToast.show($mdToast.simple().textContent(text).capsule(true).hideDelay(2000).position('top right'));
    };

    $scope.ajaxFailure = function (response) {
        var text = response.status + ": " + response.statusText;
        $mdToast.show($mdToast.simple().textContent(text).capsule(true).hideDelay(2000).position('top right'));
    };
    
}]);

function buildRequest(fromObject) {
	var params = {
		'format': 'json'
	};

	for (var key in fromObject) {
		if (key[0] !== '$') {
			params[key] = fromObject[key];
		}
	}

	return params;
}

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