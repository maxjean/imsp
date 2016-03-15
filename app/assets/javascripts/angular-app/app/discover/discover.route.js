(function () {
    'use strict';

    angular
        .module('app.discover')
        .run(appRun);

    appRun.$inject = ['routerHelper'];
    /* @ngInject */
    function appRun(routerHelper) {
        routerHelper.configureStates(getStates());
    }

    function getStates() {
        return [
            {
                state: 'site.discover',
                config: {
                    url: '/',
                    title: 'Discover',
                    views: {
                        sidebar: {
                            templateUrl: 'app/discover/sidebar.html',
                            controller: 'DiscoverController',
                            controllerAs: 'vm'
                        },
                        '': {
                            templateUrl: 'app/discover/discover.html',
                            controller: 'DiscoverController',
                            controllerAs: 'vm'
                        }

                    },
                   /*resolve: {
                        translatePartialLoader: ['$translate', '$translatePartialLoader', function ($translate, $translatePartialLoader) {
                            $translatePartialLoader.addPart('discover');
                            return $translate.refresh();
                        }]
                    },*/
                    settings: {
                        nav: 1,
                        content: 'discover'
                    }

                }
            },

        ];
    }
})();
