gourceTV.controller("RepositoryShowCtrl", ["$scope", "$rootScope", "$routeParams", "Repository", function ($scope, $rootScope, $routeParams, Repository) {
  Repository.get({ id: $routeParams.id }, function(repository) {
    $scope.repository = repository;
    $rootScope.pageSubtitle = [[repository.account, repository.name].join("/"), "visualization"].join(" ");
  });
}]);
