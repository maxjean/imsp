/**
 * Created by maxclifordjean on 25/11/15.
 */
(function () {
    'use strict';

    angular
        .module('app.discover')
        .controller('DiscoverController', DiscoverController);

    DiscoverController.$inject = ['$q'];
    /* @ngInject */
    function DiscoverController($q) {
        alert("you there");
        var vm = this;
        vm.search = searchService;
        vm.popularMedias= ["test","test"];
        vm.lastMediasAdded = [];
        alert('hello');

        activate();

        function activate() {

            var promises = [getPopularMedias(),getLastMediasAdded()];
            return $q.all(promises).then(function() {
              //  logger.info('Activated Discover View');
            });
        }

        function getPopularMedias() {
            return mediaDatasService.getPopularMedias().then(function (data) {
                vm.popularMedias = data;
                return vm.popularMedias;
            });
        }

        function getLastMediasAdded() {
            return mediaDatasService.getLastMediasAdded().then(function (data) {
                vm.lastMediasAdded = data;
                return vm.lastMediasAdded;
            });
        }

        /*searchService.getStatus().then(function(){
         vm.showSearchResult = searchService.status;
         })*/
    }
})();
