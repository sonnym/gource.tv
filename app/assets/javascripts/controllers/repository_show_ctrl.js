gourceTV.controller("RepositoryShowCtrl", ["$scope", "$rootScope", "Repository", function ($scope, $rootScope, Repository) {
  $rootScope.$on("repository:show", function(e, id) {
    Repository.get({ id: id }, function(repository) {
      $scope.repository = repository;
    });
  });

  $rootScope.$on("repository:clear", function() {
    $scope.repository = undefined;
  });
}]);
