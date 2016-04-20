(function () {
  'use strict';
  angular
    .module('PackageDetails')
    .controller('PackageDetailsViewController', PackageDetailsViewController);

  PackageDetailsViewController.$inject = [
    '$scope',
	 '$http',
	  '$stateParams'
  ];

  /* @ngInject */
  function PackageDetailsViewController($scope, $http, $stateParams) {

	var vm = this;

	vm.model = {

	};
	vm.id = $stateParams.id;
	vm.active = 0;
	
	vm.init = function () {
	
	
		$http({
		  method: 'GET',
		  url: 'http://96.18.4.138:8081/api/package/' + vm.id
		}).then(function successCallback(response) {
			var data = response.data;
		
			vm.model = data;
			vm.loadOrg();
			vm.loadReadme();
		    // this callback will be called asynchronously
		    // when the response is available
		  }, function errorCallback(response) {
		    // called asynchronously if an error occurs
		    // or server returns response with an error status.
		  });
	
	};
	
	vm.loadOrg = function () {
		// https://api.github.com/orgs/Zewo
		

		var parts = vm.model.url.split("/")
		var orgName = parts[parts.length - 2];
		var orgUrl = "https://api.github.com/orgs/" + orgName;
			
			$http({
			  method: 'GET',
			  url: orgUrl
			}).then(function successCallback(response) {
				var data = response.data;
			
				vm.model.org = data;
		
			    // this callback will be called asynchronously
			    // when the response is available
			  }, function errorCallback(response) {
				  vm.loadUser();
				  // vm.model.readme = "No Readme.md in repo";
				  // vm.active = 1;
			    // called asynchronously if an error occurs
			    // or server returns response with an error status.
			  });
		  	
	}
	
	vm.openOnGithub = function () {
		window.location.href = vm.model.url;
	}
	
	vm.loadUser = function () {
		// https://api.github.com/orgs/Zewo
		

		var parts = vm.model.url.split("/")
		var orgName = parts[parts.length - 2];
		var orgUrl = "https://api.github.com/users/" + vm.model.author;
			
			$http({
			  method: 'GET',
			  url: orgUrl
			}).then(function successCallback(response) {
				var data = response.data;
			
				vm.model.org = data;
		
			    // this callback will be called asynchronously
			    // when the response is available
			  }, function errorCallback(response) {
				  // vm.loadUser();
				  // vm.model.readme = "No Readme.md in repo";
				  // vm.active = 1;
			    // called asynchronously if an error occurs
			    // or server returns response with an error status.
			  });
		  	
	}
	
	vm.loadReadme = function () {
	// https://raw.githubusercontent.com/Zewo/Zewo/master/README.md
	// https://github.com/Zewo/Zewo.git
	var readmeURL = vm.model.url.replace(".git", "/master/README.md").replace("github.com", "raw.githubusercontent.com");
	
		$http({
		  method: 'GET',
		  url: readmeURL
		}).then(function successCallback(response) {
			var data = response.data;
			
			vm.model.readme = data;
		
		    // this callback will be called asynchronously
		    // when the response is available
		  }, function errorCallback(response) {
			  vm.model.readme = "No Readme.md in repo";
			  vm.active = 1;
		    // called asynchronously if an error occurs
		    // or server returns response with an error status.
		  });
		  	
	};
	
	vm.init();
	
  }
})();



// var data = a.data
// var output = [];
// for (var i = 0, len = data.length; i < len; i += 1) {
// 	if (!data[i].latest_version) {
// 		data[i].latest_version = "0.0.0";
// 	}
// 	output.push({
//     "title": data[i].package_full_name.split("/")[1],
//     "author": data[i].package_full_name.split("/")[0],
//     "url": data[i].git_clone_url,
//     "overview": data[i].description,
//     "major": data[i].latest_version.split(".")[0],
// 		"minor": data[i].latest_version.split(".")[1]
// 	});
// }