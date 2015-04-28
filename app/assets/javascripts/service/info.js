app.factory('InfoFactory', function ($http, $q, $timeout){
    var nbServers;
    var factory = {
        infos : false,
        getInfos : function(){  /*get all infos*/
            var deferred = $q.defer();
            var infosServers = [];
            $http.get("http://localhost:3000/category_plist_channels_api.json")
                .success(function(data, status){
                    factory.infos = data;
                    var elems = factory.infos;
                    for (var i = 0; i < elems.length; i++){
                        var elem = elems[i];
                        console.log(elem);
                        infosServers.push(elem);
                    }
                    console.log(infosServers);
                    $timeout(function(){
                        deferred.resolve(infosServers);
                    }, 2000)
                }).error(function(data, status){
                    deferred.reject("We can't access dataas");
                });
            // return infosServers;
            return deferred.promise;
        },
        getInfo : function(id){ /*get info of one element*/
            var deferred = $q.defer();
            var infosServer = {};

            $http.get("http://localhost:3000/category_plist_channels_api.json")
                .success(function(data, status){
                    factory.infos = data;
                    var elem = factory.infos;
                    angular.forEach(elem, function(value, key){
                        if (key == id){
                            infosServer = value;
                        }
                    });
                    $timeout(function(){
                        deferred.resolve(infosServer);
                    }, 2000)
                }).error(function(data, status){
                    deferred.reject("We can't access datas");
                });
            return deferred.promise;
        }
    };
    return factory;
    //retourne un objet qui sera passé à mes controleurs
});