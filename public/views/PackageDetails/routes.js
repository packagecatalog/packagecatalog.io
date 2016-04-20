(function () {
  'use strict';

  angular.module('PackageDetails', [
      'ui.router'
    ])
    .config(function ($stateProvider, $urlRouterProvider) {

	  $stateProvider
	    .state('package-details', {
	      url: "/details/:id",
	      templateUrl: "views/PackageDetails/details.view.html",
			controller: "PackageDetailsViewController",
			controllerAs: "Details"
	    })
		
    });

})();

