app.factory('PairingFactory', function ($http, $q, $timeout){
    var factory = {
        pairing : false,
        getPairingsDatas : function(){  /*get all pairing*/
            var deferred = $q.defer();
            var pairingsDatas = [];
            $http.get('pairing.json')
                .success(function(data, status){
                    factory.pairing = data;
                    var elems = factory.pairing;
                    for (var i = 0; i < elems.pairing.length; i++){
                        var elem = elems.pairing[i];
                        console.log("elem",elem);
                        pairingsDatas.push(elem);
                    }
                    $timeout(function(){
                    console.log("elem",elem);

                        deferred.resolve(pairingsDatas);
                    }, 2000)
                }).error(function(data, status){
                    deferred.reject("We can't access dataas");
                });
            // return pairingsDatas;
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