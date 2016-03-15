app.controller('SliderController', function($scope,$rootScope, InfoFactory,$routeParams,$timeout) {
	$rootScope.loading = true;
	$scope.datas = InfoFactory.getInfos().then(function(allInfosServers){
		$rootScope.loading = false;
		$scope.datas = allInfosServers;
		$scope.nbSlides = allInfosServers.length;
		$scope.datas.showIt = false;
	    }, function(msg){
		    alert(msg);
	});

/*	var slidesInSlideshow = 8;
	var slidesTimeIntervalInMs = 8000;

	$scope.currentSlide = 1;
    var slideTimer =
    $timeout(function interval() {
        $scope.currentSlide = ($scope.currentSlide % slidesInSlideshow) + 1;
        slideTimer = $timeout(interval, slidesTimeIntervalInMs);
        }, slidesTimeIntervalInMs);
    *//*
          debugger;
    *//*
    console.log("Datas:",$scope.datas);
    console.log("nbSlides:",InfoFactory.getInfos().infosServers);*/
});

