var gourceTV = angular.module("gourceTV", ["ngResource", "ngRoute", "ui.bootstrap"]);

gourceTV.config(["$routeProvider", "$sceDelegateProvider", function($routeProvider, $sceDelegateProvider) {
  $routeProvider.otherwise({ templateUrl: "index.html" });
  $routeProvider.when("/repository/:id", { controller: "RepositoryShowCtrl", templateUrl: "repository.html" });

  $sceDelegateProvider.resourceUrlWhitelist([
    "self",
    "http://www.youtube.com/embed/*?rel=0&vq=hd720&wmode=transparent"
  ]);
}]);

gourceTV.run(["$rootScope", "$location", function($rootScope, $location) {
  $rootScope.goHome = function() {
    $location.path("/");
  }
}]);
