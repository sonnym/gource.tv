var gourceTV = angular.module("gourceTV", ["ngResource", "ui.bootstrap"]);

gourceTV.config(["$sceDelegateProvider", function($sceDelegateProvider) {
  $sceDelegateProvider.resourceUrlWhitelist([
    "self",
    "http://www.youtube.com/embed/*?rel=0&vq=hd720&wmode=transparent"
  ]);
}]);

gourceTV.run(["$rootScope", function($rootScope) {
  $rootScope.goHome = function() {
    $rootScope.$broadcast("repository:clear");
  }
}]);
