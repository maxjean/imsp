(function () {
    'use strict';

    angular
        .module('app.videos')
        .run(appRun);

    appRun.$inject = ['routerHelper'];
    /* @ngInject */
    function appRun(routerHelper) {
        routerHelper.configureStates(getStates());
    }

    function getStates() {
        return [
            {
                state: 'site.video',
                config: {
                    url: '/',
                    title: 'Video',
                    views: {
                        sidebar: {
                            templateUrl: 'app/video/sidebar.html',
                            controller: 'SidebarVideoController',
                            controllerAs: 'vm'
                        },
                        '': {
                            templateUrl: 'app/video/video.html',
                            controller: 'VideoController',
                            controllerAs: 'vm'
                        }

                    },
                    resolve: {
                        translatePartialLoader: ['$translate', '$translatePartialLoader', function ($translate, $translatePartialLoader) {
                            $translatePartialLoader.addPart('video');
                            return $translate.refresh();
                        }]
                    },
                    settings: {
                        nav: 1,
                        content: 'Video'
                    }

                }
            }
        ];
    }
})();
