app.controller("list-controller", function($scope, $http) {
	
	var vm = $scope;
	
	vm.packages = [];
	
	$http({
	  method: 'GET',
	  url: 'http://localhost:8081/api/packages/'
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
	

});