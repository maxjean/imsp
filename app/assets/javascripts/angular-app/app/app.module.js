(function () {
    'use strict';

    angular.module('app', [
        'app.layout',
        'app.videos',
        'app.templates'
    ]).run(console.log("modules launched"));
})();

