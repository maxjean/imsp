var wsocket = angular.module('websock', ['ngWebsocket'])
    .run(function ($websocket, $timeout) {
        var ws = $websocket.$new({
            url: 'ws://http://10.0.30.11/mep_projects/mep-servers-diff',
            reconnect: true
        });

        ws.$on('$open', function () {
            console.log('The ngWebsocket has open!'); // It will print after 5 (or more) seconds
        });

        ws.$on('$close', function () {
            console.log('The ngWebsocket has closed!'); // It will print after 5 (or more) seconds
        });

        $timeout(function () {
            ws.$open(); // Open the connction only at this point. It will fire the '$open' event
        }, 5000);
    });

