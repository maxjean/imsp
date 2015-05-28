app.controller('MediaController', function($scope,$rootScope, InfoFactory, UserFactory, $routeParams,$timeout,$route, $websocket, WebSocket) {
    $rootScope.loading = true;
    $scope.slideshowID = $routeParams.id;
    $scope.spinnerLoad = true;
    $scope.slideshowLoad = false;
    $scope.loadingInfos = ["Loading datas, please wait...","null"];
    $scope.showPlayPause = false;
    $scope.showPlay = false;
    $scope.showPause = false;
    $scope.showMySettings;
    $scope.showPreviousSection;
    $scope.showCloseSettings;
    $scope.showNavigation;
    $scope.showRow;
    $scope.showRow2;



    if(!$scope.slideshowID){
        $scope.datas = InfoFactory.getInfos().then(function(allInfosServers){
            $rootScope.loading = false;
            $scope.datas = allInfosServers;
            $scope.spinnerLoad = false;
            $scope.slideshowLoad = true;
            $scope.datas.showIt = false;
            $scope.datas.slidesInSlideshow = allInfosServers.length;
        }, function(msg){
            alert(msg);
        });
    }else if($scope.slideshowID){
        $scope.datas = InfoFactory.getInfo($routeParams.id).then(function(infosServers){
            $rootScope.loading = false;
            $scope.datas = infosServers;
            $scope.spinnerLoad = false;
            $scope.slideshowLoad = true;
            $scope.datas.showIt = false;
            $scope.datas.slidesInSlideshow = infosServers.length;
        }, function(msg){
            alert(msg);
        });
    }

    /*
     $scope.UsersDatas = UserFactory.getConnectedUsersDatas().then(function(ConnectedUsersInfosDatas){
     connectedUsersCount = ConnectedUsersInfosDatas.length
     console.log("connectedcound", connectedUsersCount);
     $scope.UsersDatas = ConnectedUsersInfosDatas[connectedUsersCount-1];
     console.log("TTTTTT",$scope.UsersDatas );
     }, function(msg){
     alert(msg);
     });
     $scope.showNewUserConnected = false;
     */



    /*
     WebSocket.onopen(function() {
     console.log('connection open!!!');
     WebSocket.send('Hello World').send(' again').send(' and again');
     });

     WebSocket.onclose(function() {
     console.log('connection closed');
     });

     */


    var slidesTimeIntervalInMs = 5000;
    $scope.currentSlide = 0;
    $scope.activeToolIndex = 0;
    $scope.setTool = function(index){
        $scope.activeToolIndex = index;
    }
    /*
     var slideTimer =
     $timeout(function interval() {
     $scope.activeToolIndex < $scope.datas.slidesInSlideshow - 1 ? $scope.activeToolIndex++ : $scope.activeToolIndex = 0;
     slideTimer = $timeout(interval, slidesTimeIntervalInMs);
     }, slidesTimeIntervalInMs);*/

    /*debugger;*/
    $scope.next = function() {
        $scope.activeToolIndex < $scope.datas.slidesInSlideshow - 1 ? $scope.activeToolIndex++ : $scope.activeToolIndex = 0;
    };

    $scope.prev = function() {
        $scope.activeToolIndex > 0 ? $scope.activeToolIndex-- : $scope.activeToolIndex = $scope.datas.slidesInSlideshow - 1;
    };

    $scope.reloading = function() {
        window.location.reload();
    };

    $scope.play = function(){
        slideTimer =
            $timeout(function interval() {
                $scope.currentSlide = ($scope.currentSlide % $scope.datas.slidesInSlideshow) + 1;
                slideTimer = $timeout(interval, slidesTimeIntervalInMs);
            }, slidesTimeIntervalInMs);
        $scope.showPlayPause = true;
        $scope.showPlay = true;
        $scope.showPause = false;
        //use 1 seconds TimeOut
        var slidePlayTimer =
            $timeout(function interval() {
                $scope.showPlayPause = false;
                $scope.showPlay = false;
                $scope.showPause = false;
                $timeout.cancel(slidePlayTimer);
            }, 1000);
    }

    $scope.pause = function(){
        $timeout.cancel(slideTimer);
        $scope.showPlayPause = true;
        $scope.showPause = true;
        $scope.showPlay = false;
    }

    $scope.displayNewUserConnected = function(){
        $timeout(function() {
            $scope.showNewUserConnected = true;
        }, 3000);
    }


    /*

     WebSocket.onmessage(function(event) {
     console.log('message: ', event.data);
     switch(event.data){
     case 'goToPrevSlide':
     $scope.prev();
     break;
     case 'goToNextSlide':
     $scope.next();
     break;
     case 'sliderReload':
     $scope.reloading();
     break;
     case 'sliderPause':
     $scope.pause();
     break;
     case 'sliderPlay':
     $scope.play();
     break;
     case 'sliderPowerOn':
     console.log("allumer, reload the page");
     $scope.reloading();
     break;
     case 'sliderPowerOff':
     console.log("supprimer les elements du dom et pas le WebSocket");
     //stop the page
     $scope.slideshowLoad = false;
     break;

     case 'isConnectedByPairing':
     $scope.displayNewUserConnected();
     break;


     default:
     if (console){
     console.log("No action from the remote");
     };
     break;
     }
     });
     */

    $scope.liquidConfigurations =
        [
            {fill: true, horizontalAlign: "center", verticalAlign: "center"}
        ];

    /*var count = 0;
     var timeout;

     $scope.countClicks = function(user) {
     count++;
     if(clicks > 1) {
     alert("test");

     //Do what we want on a browser double click
     } else {
     timeout = setTimeout(function() {
     //Do what we want on a click
     count = 0;
     }, 300);
     }
     }*/
});

app.directive('mediaplayer', function(){
    return {
        restrict: 'AE',
        link: function (scope, element, attr) {

            var playerElement = document.getElementById("player");
            var video_id = window.location.search.slice(3,39);
            var video_format = "640x360";
            var video_server_url = "http://195.154.67.219:80/imsp"
            var player = new Clappr.Player({
                    //source: "rtmp://10.20.77.238/vod/terminator.mp4", //flash player & for external links(embedded video)
                    source: video_server_url+"/"+video_id+"/"+video_id+"_"+video_format+".mp4", //in case of hls streaming, compati\ble anywhere(HTML5)
                    //source: "http://195.154.67.219:1935/hls/my_file.m3u8", //flash player
                    parentId: "#player",
                    autoPlay: true,
                    chromeless: false, //true => in chromeless mode, the video is only read, we can't do anything
                    mute: false, // start the player with no sound
                    persistConfig: true,
                    preload: 'metadata',
                    mediacontrol: {seekbar: "blue", buttons: "gray"},
                    hideMediaControl: false, //auto hide/display the player bar
                    //watermark: "rtmp://10.20.77.238/vod/Url-logo.png", position: 'top-right',
                    //poster: "http://10.20.77.238/Url-logo.png",
                    plugins: {playback: [RTMP]}}

            );
            //player.attachTo(playerElement);
            //$(".container").parent().css("width","100%")
        }
    }
});

app.directive('liquid', function ($timeout) {
    return {
        restrict: 'AE',
        link: function (scope, element, attr) {
            $timeout(function () {
                $(element).imgLiquid();
                $(element.children()).css("display","block");
            });
        }
    }
});

app.directive('showonhoverparent', function () {
    return {
        restrict: 'AE',
        link: function (scope, element, attr) {
            function auto(){
                $(element).children().hide();
            }
            setInterval(auto,5000);

            $(".slider-nav").hide();
            $(".slideshow").mousemove(function(){
                $(element).children().show();
            });
            $(".slideshow").mouseleave(function(){
                $(element).children().hide();
            });

            /*            var el = $(element).children();
             console.log("ham",Hammer);
             var hammertime = new Hammer($(".slider-nav"),{});
             hammertime.on('swiperight', function(ev) {
             console.log(ev);
             });*/
        }
    }
});

app.directive('rowonhoverorselect', function () {
    return {
        restrict: 'AE',
        link: function (scope, element, attr) {
            $(element).mousemove(function(){
                $(element).css("border-color","gainsboro")
            });

            $(".row").mouseleave(function(){
                $(element).css("border-color","black")
            });
        }
    }
});

app.directive('onsettings', function () {
    return {
        restrict: 'AE',
        link: function (scope, element, attr) {

            function showRow(){
                $(".my-settings .row").fadeIn(1000);
            }

            function hideRow(){
                $(".my-settings .row").fadeOut(800);
            }

            function showRow2(){
                $(".my-settings .row2").fadeIn(1000);
            }

            function hideRow2(speed){
                $(".my-settings .row2").fadeOut(speed);
            }

            function showSettings(){
                $(".my-settings").fadeIn();
            }

            function hideSettings(){
                $(".my-settings").fadeOut();
            }

            function showNavigation(){
                $(".navigation").fadeIn(1000);
            }

            function hideNavigation(){
                $(".navigation").fadeOut(1000);
            }

            function slideshowBackgroundEffect(){
                $(".slideshow").css("opacity","0.5");
                $(".slideshow").css("-webkit-filter","blur(30px)");
            }

            function slideshowBackgroundNoEffect(){
                $(".slideshow").css("opacity","1.0");
                $(".slideshow").css("-webkit-filter","none");
            }

            function openSettingSection(){
                slideshowBackgroundEffect();
                showSettings();
                showNavigation();
                showRow();
                hideRow2(0);
            }

            function closeSettingSection(){
                slideshowBackgroundNoEffect();
                hideSettings();
                hideNavigation();
                hideRow();
                hideRow2(1000);
            }

            hideSettings();
            $(".settings").bind('click', function(){
                openSettingSection();
            })

            $(".my-settings .row").bind('click', function(){
                showRow2();
                hideRow();
            })

            $(".previous-section").bind('click', function(){
                if(($(".my-settings .row2").is(":visible")) == true){
                    hideRow2(800);
                    showSettings();
                    showRow();
                }else if(($(".my-settings .row").is(":visible")) == true){
                    closeSettingSection();
                }
            })

            $(".close-settings").bind('click', function(){
                closeSettingSection();
            })


        }
    }
});

// app.run(function ($websocket) {
//     var ws = $websocket.$new('ws://localhost:4247'); // instance of ngWebsocket, handled by $websocket service
//     var ws2 = $websocket.$get('ws://localhost:4247');
//     console.log("ws2_stat", ws2.$status()); // it prints ws.$CONNECTING
//     console.log(ws.$ready());
//     ws.$on('$open', function () {
//         console.log('The websocket now is open');
//         console.log(ws.$ready());
//         console.log(ws.$status()); // it prints ws.$CONNECTING
//         console.log("ws2_stat", ws2.$status());
//         ws.$close(); // it closes the websocket connection
//         console.log(ws.$status()); // it prints ws.$CONNECTING
//         console.log(ws.$ready());
//     });
//     ws.$on('$close', function () {
//         console.log(ws.$status()); // it prints ws.$CONNECTING
//         console.log(ws.$ready());
//         console.log('Connection closed!');
//     });
// });

