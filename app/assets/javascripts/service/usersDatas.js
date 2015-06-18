app.factory('UserFactory', function ($http, $q, $timeout){
    var factory = {
        user : false,
        getConnectedUsersDatas : function(){  
            var deferred = $q.defer();
            var connectedUsersDatas = [];
            $http.get('connected_users.json')
                .success(function(data, status){
                    console.log(data);
                    factory.connectedUsersDatas = data;
                    var elems = factory.connectedUsersDatas;
                    for (var i = 0; i < elems.users.length; i++){
                        var elem = elems.users[i];
                        console.log("connectedUsersDatas",elem);
                        connectedUsersDatas.push(elem);
                    }
                    $timeout(function(){
                    console.log("elem",elem);

                        deferred.resolve(connectedUsersDatas);
                    }, 0)
                }).error(function(data, status){
                    deferred.reject("We can't access dataas");
                });
            // return connectedUsersDatas;
            return deferred.promise;
        }
        // getPairingDatas : function(id){ /*get info of one element*/
        //     var deferred = $q.defer();
        //     var infosServer = {};

        //     $http.get('pairing.json')
        //         .success(function(data, status){
        //             factory.pairing = data;
        //             var elem = factory.pairing;
        //             angular.forEach(elem, function(value, key){
        //                 if (key == id){
        //                     infosServer = value;
        //                 }
        //             });
        //             $timeout(function(){
        //                 deferred.resolve(infosServer);
        //             }, 2000)
        //         }).error(function(data, status){
        //             deferred.reject("We can't access datas");
        //         });
        //     return deferred.promise;
        // }
    };
    return factory;
    //retourne un objet qui sera passé à mes controleurs
});