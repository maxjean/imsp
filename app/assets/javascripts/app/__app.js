'use strict'

var app = angular.module('MyApp',['ngRoute','spinnerLoader','angular-websocket','ngWebsocket']);
// app.config(function($httpProvider){
//     //Enable cross domain calls
//       $httpProvider.defaults.useXDomain = true;
//  //Remove the header used to identify ajax call  that would prevent CORS from working
//       delete $httpProvider.defaults.headers.common['X-Requested-With'];
//  });



/*
app.config(['$routeProvider', function($routeProvider){
    $routeProvider
// 			.when('/', {templateUrl: './public/views/partials/404.html', controller:'AllInfosServersCtrl'})
			.when('/slideshows', {templateUrl:'./public/views/slideshows.erb', controller:'AllInfosServersCtrl'})
			.when('/slideshows/:id', {templateUrl:'./views/partials/slideshow.html', controller:'infosServerCtrl'})
// 			.otherwise({redirectTo : '/'});
}]);*/

//app.config(function(WebSocketProvider) {
//  WebSocketProvider
//    .prefix('')
//    .uri('ws://0.0.0.0:4247');
//})


// app.run(function ($websocket) {
//     var ws = $websocket.$new('ws://localhost:4247'); // instance of ngWebsocket, handled by $websocket service

//     ws.$on('$open', function () {
//         console.log('Oh my gosh, websocket is really open! Fukken awesome!');

//         ws.$emit('ping', 'hi listening websocket server'); // send a message to the websocket server

//         var data = {
//             level: 1,
//             text: 'ngWebsocket rocks!',
//             array: ['one', 'two', 'three'],
//             nested: {
//                 level: 2,
//                 deeper: [{
//                     hell: 'yeah'
//                 }, {
//                     so: 'good'
//                 }]
//             }
//         };

//         ws.$emit('pong', data);
//     });

//     ws.$on('pong', function (data) {
//         console.log('The websocket server has sent the following data:');
//         console.log(data);

//         ws.$close();
//     });

//     ws.$on('$close', function () {
//         console.log('Noooooooooou, I want to have more fun with ngWebsocket, damn it!');
//     });
// });