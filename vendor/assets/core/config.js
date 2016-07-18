(function () {
    'use strict';

    var core = angular.module('discover.core');
    core.config(toastrConfig);

    toastrConfig.$inject = ['toastr'];
    /* @ngInject */
    function toastrConfig(toastr) {
        toastr.options.timeOut = 0;
        toastr.options.extendedTimeOut = 0;
        toastr.options.positionClass = 'toast-top-right';
        toastr.options.closeButton = true;
    }

    var config = {
        appErrorPrefix: '[Bi Docs Error] ',
        appTitle: 'Bi Docs'
    };

    core.value('config', config);

    core.config(configure);

    configure.$inject = ['$logProvider', 'routerHelperProvider', 'exceptionHandlerProvider', '$translateProvider', '$stateProvider'];
    /* @ngInject */
    function configure($logProvider, routerHelperProvider, exceptionHandlerProvider, $translateProvider, $stateProvider) {
        if ($logProvider.debugEnabled) {
            $logProvider.debugEnabled(true);
        }
        exceptionHandlerProvider.configure(config.appErrorPrefix);
        routerHelperProvider.configure({docTitle: config.appTitle + ': '});



        // Initialize angular-translate
        $translateProvider.useLoader('$translatePartialLoader', {
            urlTemplate: 'app/i18n/{lang}/{part}.json'
        });
        $translateProvider.preferredLanguage('fr').fallbackLanguage('fr');

        $translateProvider.useCookieStorage();


        $stateProvider.state('site', {
            'abstract': true,
            templateUrl: 'app/layout/defaultSite.html',
            url: '',
            breadcrumbs: {
                displayName: "Page d'accueil",
                breadcrumbProxy: 'site.home'
            }
        });


    }

})();
