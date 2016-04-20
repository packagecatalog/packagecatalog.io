(function () {
  'use strict';

  angular.module('PackageList', [
      'ui.router'
    ])
    .config(function ($stateProvider, $urlRouterProvider) {

	  $stateProvider
	    .state('packages', {
	      url: "/",
	      templateUrl: "views/PackageList/recent.view.html",
			controller: "RecentPackageListViewController",
			controllerAs: "List"
	    })
	    .state('packages-by-author', {
	      url: "/author/:author",
	      templateUrl: "views/PackageList/recent.view.html",
			controller: "PackageByAuthorListViewController",
			controllerAs: "List"
	    });
		
    });

})();

