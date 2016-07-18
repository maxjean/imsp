(function () {
    'use strict';

    angular
        .module('discover.core')
        .run(appRun);

    /* @ngInject */
    function appRun(routerHelper) {
        var otherwise = '/404';
        routerHelper.configureStates(getStates(), otherwise);
    }

    function getStates() {
        return [
            {
                state: '404',
                config: {
                    url: '/404',
                    templateUrl: 'app/core/404.html',
                    title: '404',
                    breadcrumbs: {
                        displayName: false
                    }
                }

            },
            {
                state: 'accessdenied',
                config: {
                    url: '/403',
                    templateUrl: 'app/core/403.html',
                    title: 'accessdeny',
                    breadcrumbs: {
                        displayName: false
                    }
                }
            }
        ];
    }
})();
