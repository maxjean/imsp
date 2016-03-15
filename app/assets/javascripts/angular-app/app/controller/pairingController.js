app.controller('PairingController', function($scope,$rootScope, PairingFactory,$routeParams,$timeout,$route, $websocket, WebSocket,$location) {
    // $scope.showSettings = false;
    $scope.pairingUrl = "pairing"
    $scope.pairingKey;

/*    $scope.datas = PairingFactory.getPairingsDatas().then(function(allPairingsDatas){
        $scope.pairingKey = allPairingsDatas;
        pairingCount = $scope.pairingKey.length;
        console.log("scope pairingkey:",$scope.pairingKey[pairingCount-1]);
        $scope.currentPainringKey = $scope.pairingKey[pairingCount-1].key
    }, function(msg){
        alert(msg);
    });*/
});

app.directive('', function () {
    return {
        restrict: 'AE',
        link: function (scope, element, attr) {

        }
    }
});
