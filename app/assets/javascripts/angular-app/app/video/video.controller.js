(function () {
    'use strict';

    angular
        .module('app.videos',[])
        .controller('VideoController', VideoController);

    VideoController.$inject = ['$q'];
    /* @ngInject */
    function VideoController($q) {
        var vm = this;
       debugger;
    }
})();
