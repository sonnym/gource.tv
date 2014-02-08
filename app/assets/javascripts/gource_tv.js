var gourceTV = angular.module("gourceTV", ["ngResource", "ui.bootstrap"]);

gourceTV.run(["$rootScope", function($rootScope) {
  $rootScope.goHome = function() {
    $rootScope.$broadcast("repository:clear");
  }
}]);
