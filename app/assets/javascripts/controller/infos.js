app.controller('AllInfosServersCtrl', function($scope,$rootScope, InfoFactory,$routeParams){
    console.log("infos des servers:", InfoFactory.getInfos());
    $rootScope.loading = true;
    $scope.allInfosServers = InfoFactory.getInfos().then(function(allInfosServers){
        $rootScope.loading = false;
        $scope.allInfosServers = allInfosServers;
    }, function(msg){
        alert(msg);
    });
    console.log($scope);
});
