var gourceTV = angular.module("gourceTV", ["ngResource", "ngRoute", "ui.bootstrap"]);

gourceTV.config(["$routeProvider", "$sceDelegateProvider", "$locationProvider", function($routeProvider, $sceDelegateProvider, $locationProvider) {
  $routeProvider.otherwise({ templateUrl: "index.html" });
  $routeProvider.when("/repository/:id", { controller: "RepositoryShowCtrl", templateUrl: "repository.html" });

  $sceDelegateProvider.resourceUrlWhitelist([
    "self",
    "http://www.youtube.com/embed/*?rel=0&vq=hd720&wmode=transparent"
  ]);

  $locationProvider.hashPrefix("!");
}]);

gourceTV.run(["$rootScope", "$location", function($rootScope, $location) {
  setPageSubtitle();

  $rootScope.goHome = function() {
    $location.path("/");
    setPageSubtitle();
  }

  function setPageSubtitle() {
    $rootScope.pageSubtitle = "gource visualization service";
  }
}]);
