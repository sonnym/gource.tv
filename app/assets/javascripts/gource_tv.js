var gource_tv = angular.module("gource_tv", ["ng", "ui.bootstrap", "repository"]);

gource_tv.run(["$rootScope", function($rootScope) {
  $rootScope.goHome = function() {
    $rootScope.$broadcast("repository:clear");
  }
}]);

var repository = angular.module("repository", ["ngResource"]);

repository.factory("Repository", ["$resource", function($resource) {
  var resources = $resource(Routes.repositories_path());
  var resource = $resource(Routes.repository_path(":id"));

  return { query: resources.query, create: resources.save, get: resource.get };
}]);

function RepositoryIndexCtrl($scope, $rootScope, $modal, Repository) {
  var newRepositoryForm;

  updateRepositoryList();

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

  $scope.showRandomRepository = function() {
    var random_idx = Math.floor(Math.random() * ($scope.repositories.length - 1));
    $scope.showRepository($scope.repositories[random_idx].id);
  }

  $rootScope.$on("repository:modal:close", function() {
    newRepositoryForm.close();
  });

  $rootScope.$on("repositories:refresh", refreshRepositories);

  function refreshRepositories() {
    $scope.repositories = Repository.query();
  }

  function updateRepositoryList() {
    refreshRepositories();
    setTimeout(refreshRepositories, 10000);
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

  $rootScope.$on("repository:clear", function() {
    $scope.repository = undefined;
  });
}
RepositoryShowCtrl.$inject = ["$scope", "$rootScope", "Repository"];

function SystemStatusCtrl($scope, $http) {
  function updateStatus() {
    $http.get(Routes.status_path()).success(function(data) {
      $scope.status = data;
      setTimeout(updateStatus, 5000);
    });
  }

  updateStatus();
}
SystemStatusCtrl.$inject = ["$scope", "$http"];
