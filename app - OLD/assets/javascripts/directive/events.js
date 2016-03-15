var touchEvents = angular.module('hmTime', ['hmTouchEvents']);
touchEvents.controller('hmCtrl', function ($scope) {
    $scope.eventType = "No events yet";
    $scope.onHammer = function onHammer (event) {
        $scope.$apply(function () {
            $scope.eventType = event.type;
        })
    };
});