app.controller('infosServerCtrl', function ($scope,$rootScope, InfoFactory, $routeParams){
    console.log("infos server:", InfoFactory.getInfo($routeParams.id));
    console.log($routeParams);
    $rootScope.loading = true;
    $scope.infosServers = InfoFactory.getInfo($routeParams.id).then(function(infosServers){
        $rootScope.loading = false;
        $scope.infosServers = infosServers;
    }, function(msg){
        alert(msg);
    });
});