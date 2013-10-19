var gource_tv = angular.module("gource_tv", ["ng", "ui.bootstrap", "repository"]);

var repository = angular.module("repository", ["ngResource"]);

repository.factory("Repository", ["$resource", function($resource) {
  var resources = $resource(Routes.repositories_path());
  var resource = $resource(Routes.repository_path(":id"));

  return { query: resources.query, create: resources.save, get: resource.get };
}]);

function RepositoryIndexCtrl($scope, $rootScope, $modal, Repository) {
  var newRepositoryForm;

  refreshRepositoryList();

  $scope.showAddRepositoryForm = function() {
    newRepositoryForm = $modal.open({
      templateUrl: "template/new_repository_form.html",
      controller: RepositoryCreateCtrl
    }); 
  }

  $scope.setSearchString = function() {
    if ($scope.searchRaw && $scope.searchRaw.length > 0) {
      $scope.searchString = $scope.searchRaw;
    } else {
      $scope.searchString = '';
    }
  }
  $scope.setSearchString();

  $scope.showRepository = function(id) {
    $rootScope.$broadcast("repository:show", id);
  }

  $rootScope.$on("repository:modal:close", function() {
    newRepositoryForm.close();
  });

  $rootScope.$on("repositories:refresh", refreshRepositoryList);

  function refreshRepositoryList() {
    $scope.repositories = Repository.query();
  }
}
RepositoryIndexCtrl.$inject = ["$scope", "$rootScope", "$modal", "Repository"];

function RepositoryCreateCtrl($scope, $rootScope, Repository) {
  $scope.save = function() {
    Repository.create({ repository: { account: this.account, name: this.name } }, function() {
      $rootScope.$broadcast("repository:modal:close");
      $rootScope.$broadcast("repositories:refresh");
    });
  }

  $scope.cancel = function() {
    $rootScope.$broadcast("repository:modal:close");
  }
}
RepositoryCreateCtrl.$inject = ["$scope", "$rootScope", "Repository"];

function RepositoryShowCtrl($scope, $rootScope, Repository) {
  $rootScope.$on("repository:show", function(e, id) {
    Repository.get({ id: id }, function(repository) {
      $scope.repository = repository;
    });
  });
}
RepositoryShowCtrl.$inject = ["$scope", "$rootScope", "Repository"];
