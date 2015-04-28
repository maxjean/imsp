angular.module('controllers', [])
    .controller('MainCtrl', function($scope, WebSocket) {

    WebSocket.onopen(function() {
        console.log('connection');
        WebSocket.send('message')
    });

    WebSocket.onmessage(function(event) {
        console.log('message: ', event.data);
    });



});