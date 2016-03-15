(function () {
    'use strict';

    angular
        .module('app.discover')
        .controller('SidebarDiscoverController', SidebarDiscoverController);

    SidebarDiscoverController.$inject = ['$state', 'routerHelper'];
    /* @ngInject */
    function SidebarDiscoverController($state, routerHelper) {
        var vm = this;
     //   vm.searchService = searchService;
     //   vm.autocompleteOperation = []
        alert('sidebar');


        activate();

        function activate() {
          //  logger.info('Activated Sidebar Home View');
        }

      /*  function autocompleteOperation(query) {
            return referentielService.refreshOperation(query).then(function (data) {
                vm.autocompleteOperation = data;
                return vm.autocompleteOperation;
            });
        }
*/


    }
})();
