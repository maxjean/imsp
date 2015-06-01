/**
 * Created by maxclifordjean on 15/05/15.
 */
app.factory('MediaTimelinesFactory', function ($http, $q, $timeout){
    var factory = {
        timelines : false,
        getTimelines : function(){  /*get all timelines*/
            var deferred = $q.defer();
            var mediaTimelines = [];
            $http.get(window.location.origin+"/media_timeline_api.json")
                .success(function(data, status){
                    console.log("media_timeline:",data);
                    factory.timelines = data;
                    var elems = factory.timelines;
                    for (var i = 0; i < elems.length; i++){
                        var elem = elems[i];
                        console.log(elem);
                        mediaTimelines.push(elem);
                    }
                    console.log(mediaTimelines);
                    $timeout(function(){
                        deferred.resolve(mediaTimelines);
                    }, 2000)
                }).error(function(data, status){
                    deferred.reject("We can't access datas from your media timelines");
                });
            // return mediaTimelines;
            return deferred.promise;
        }
    };
    return factory;
    //retourne un objet qui sera passé à mes controleurs
});