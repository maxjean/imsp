(function () {
    'use strict';

    angular
        .module('discover.core', [
            'ngAnimate', 'ngSanitize',
            'blocks.exception', 'blocks.logger','blocks.userNotification', 'blocks.router',
            'ui.router', 'ngplus','pascalprecht.translate', 'ngCookies'
        ]);
})();
