(function () {
  'use strict';
  angular
    .module('PackageList')
    .controller('RecentPackageListViewController', RecentPackageListViewController);

  RecentPackageListViewController.$inject = [
    '$scope',
	 '$http'
  ];

  /* @ngInject */
  function RecentPackageListViewController($scope, $http) {

	var vm = this;

	vm.title = "Recent Packages"
	vm.packages = [];

	
	vm.init = function () {
	
	
		$http({
		  method: 'GET',
		  url: 'http://96.18.4.138:8081/api/packages/'
		}).then(function successCallback(response) {
			var data = response.data;
		
			for (var i = 0, len = data.length; i < len; i += 1) {
				if (i % 3 == 0) {
					vm.packages.push([])
				}
				vm.packages[~~(i/3)].push(data[i]);
			}
		
		    // this callback will be called asynchronously
		    // when the response is available
		  }, function errorCallback(response) {
		    // called asynchronously if an error occurs
		    // or server returns response with an error status.
		  });
	
		
	};
	
	vm.init();
	
  }
})();
