/**
 * Created by maxclifordjean on 04/06/15.
 */
/**
 * Created by maxclifordjean on 15/05/15.
 */
app.factory('MediaTranslationFactory', function ($http, $q, $timeout){
    var factory = {
        translations : false,
        getTranslations : function(){  /*get all mediaTranslations*/
            var deferred = $q.defer();
            var mediaTranslations = [];
            $http.get("http://srt2json.herokuapp.com/?url=195.154.67.219/imsp/killing_jesus.srt")
                .success(function(data, status){
                    console.log("mediaTranslations:",data);
                    factory.translations = data;
                    var elems = factory.translations;
                    for (var i = 0; i < elems.length; i++){
                        var elem = elems[i];
                        mediaTranslations.push(elem);
                    }
                    $timeout(function(){
                        deferred.resolve(mediaTranslations);
                    }, 2000)
                }).error(function(data, status){
                    deferred.reject("We can't access datas from your media timelines");
                });
            // return mediaTranslations;
            return deferred.promise;
        }
    };
    return factory;
    //retourne un objet qui sera passé à mes controleurs
});