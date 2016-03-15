/* jshint -W117, -W030 *//*

describe('DefaultController', function() {
    var controller;

    var currentUSer = mockData.currentUser();

    beforeEach(function() {
        bard.appModule('app.layout');
        bard.inject('$controller', '$q', '$rootScope', '$timeout');
    });

    beforeEach(function () {

    //    sinon.stub(authService, 'currentUser').returns($q.when(currentUSer));
      //  sinon.stub(authService, 'authorize').returns($q.when(currentUSer));

        controller = $controller('DefaultController');
        $rootScope.$apply();




    });

    bard.verifyNoOutstandingHttpRequests();

    describe('Default controller', function() {
        it('should be created successfully', function () {
            expect(controller).to.be.defined;
        });

        it('should show splash screen', function () {
            expect($rootScope.showSplash).to.be.true;
        });

        it('should hide splash screen after timeout', function (done) {
            $timeout(function() {
                expect($rootScope.showSplash).to.be.false;
                done();
            }, 1000);
            $timeout.flush();
        });
    });
});
*/
