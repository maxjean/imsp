app.controller('RemoteControlController', function($scope,$rootScope, InfoFactory,$routeParams,$timeout,$route, $websocket, WebSocket) {
	$scope.remoteTitle = "MEP SERVERS DIFF REMOTE CONTROL";
	$rootScope.serverState = "Press any action to control the slider"
	$scope.ws = WebSocket;
	$scope.powerCount = 0;
	$scope.playPauseCount = 0;
	$scope.playLoad = false;
	$scope.pauseLoad = true;
	$scope.navButtonLink;
	$scope.powerButtonColor;



	WebSocket.onopen(function() {
	    console.log('connection remote control open!!!');
	    WebSocket.send('Hello World remoteControl').send(' again').send(' and again');
	    $rootScope.serverState = "Succesfully connected to "+document.domain+", server is: "+WebSocket.currentState();
	});

	WebSocket.onclose(function() {
	    console.log('connection remote control closed');
	    $rootScope.serverState = WebSocket.currentState();
	});

	

	function pushKeyAction(message) {
      console.log("Message Send: ", message);
      WebSocket.send(message);
   //    var x = WebSocket.status();
   //    var ws2 = $websocket.$get('ws://localhost:4247');
	  // console.log("ws2_stat", ws2.$status());
      // $scope.serverState = ws2.$status();
    };

    
    $scope.prev = function() {
    	pushKeyAction("goToPrevSlide");
    };

	$scope.next = function() {
		pushKeyAction("goToNextSlide");
    };

    // $scope.reload = function(){
    // 	pushKeyAction("sliderReload")
    // }

    // $scope.pause = function(){
    // 	pushKeyAction("sliderPause")
    // }

    // $scope.play = function(){
    // 	pushKeyAction("sliderPlay");
    // }

    $scope.playPause = function(){
    	$scope.playPauseCount++;
    	if ($scope.playPauseCount == 1){
		$scope.playLoad = true;
		$scope.pauseLoad = false;
    		pushKeyAction("sliderPause");
    	}else if ($scope.playPauseCount == 2){
    		$scope.playLoad = false;
			$scope.pauseLoad = true;    		
    		pushKeyAction("sliderPlay");
    		$scope.playPauseCount = 0;
    	}
    }

    $scope.power = function(){
    	$scope.powerCount++;
    	
    	if ($scope.powerCount == 1){
	    	pushKeyAction("sliderPowerOff");
	        console.log($scope.powerCount);
	        console.log("eteindre remote");
	        WebSocket.close();
	        console.log($rootScope.serverState);
	        $rootScope.serverState = "CLOSED"; //impossible d'avoir le resultat de la websocket
	    	$scope.slideshowLoad;
	    }else if ($scope.powerCount == 2){
	    	
	    	WebSocket.new('ws://0.0.0.0:4247'); //remote in connecting
    		var remoteTimer = 
	    	$timeout(function interval(){
	    		
	    		remoteTimer = $timeout(interval, 1);
				console.log("test");
				console.log("states::",WebSocket.currentState());
				if(WebSocket.currentState() == "OPEN"){ //remote connected
					pushKeyAction("isConnectedByPairing");
					pushKeyAction("sliderPowerOn");
					console.log("is connected!");
					$timeout.cancel(remoteTimer);
					$scope.powerCount = 0;
					$rootScope.serverState = "Succesfully connected to "+document.domain+", server is: "+WebSocket.currentState();
				}else{
					console.log("Connecting...");
				}
		    }, 500);		       
	    }else{
	    	return 0;
	    }
    }
});

app.directive('remotecontrol', function(){
return {
        restrict: 'AE',
        link: function (scope, element, attr) {
            // $(element).imgLiquid();
   //          $(element).find(".remote-nav a").css("color","gray");

			// $(element).find(".remote-power-button a").hover(function(){
			// 	$(this).css("color","red");
			// });
			// console.log("dlsfsdmjkfsd",WebSocket.currentState());
        }
    }

});

