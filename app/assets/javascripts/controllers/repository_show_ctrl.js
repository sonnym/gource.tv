gourceTV.controller("RepositoryShowCtrl", ["$scope", "$routeParams", "Repository", function ($scope, $routeParams, Repository) {
  Repository.get({ id: $routeParams.id }, function(repository) {
    $scope.repository = repository;
  });
}]);
