gourceTV.controller("RepositoryCreateCtrl", ["$scope", "$rootScope", "Repository", function($scope, $rootScope, Repository) {
  $scope.save = function() {
    Repository.create({ repository: { account: this.account, name: this.name } }, function() {
      $rootScope.$broadcast("repository:modal:close");
    }, function() {
      $rootScope.$broadcast("repository:modal:close");
    });
  }

  $scope.cancel = function() {
    $rootScope.$broadcast("repository:modal:close");
  }
}]);
