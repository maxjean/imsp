(function() {
    'use strict';

    angular
        .module('app.layout',['app.core']) //get a module
        .controller('DefaultController', DefaultController);

    DefaultController.$inject = ['$q','$rootScope', '$timeout'];
    /* @ngInject */
    function DefaultController($q,$rootScope, $timeout) {
        var vm = this;
        vm.busyMessage = 'Please wait ...';
        vm.isBusy = true;
        vm.currentUser = {};
        vm.popularMedias = ["matrix","spiderman","abele"];
        $rootScope.showSplash = true;

        alert('DEFAULT CONTROLLER');


        activate();



        function activate() {

            //var promises = [AuthUser()];

         //   return $q.all(promises ).then(function() {
                //logger.success(config.appTitle + ' loaded!', null);
           //     hideSplash();
           // });


        }



        function hideSplash() {
            //Force a 1 second delay so we can see the splash.
            $timeout(function() {
                $rootScope.showSplash = false;
            }, 1000);
        }
    }
})();
