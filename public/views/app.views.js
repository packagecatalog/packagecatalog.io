(function () {
  'use strict';

  angular.module('app.views', [
      'PackageList',
	  'PackageDetails'
    ])
    .config(function ($stateProvider, $urlRouterProvider) {

      $urlRouterProvider.otherwise('/');

    });

})();

