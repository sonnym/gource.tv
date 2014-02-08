gourceTV.controller("RepositoryIndexCtrl", ["$scope", "$rootScope", "$modal", "Repository", function($scope, $rootScope, $modal, Repository) {
  var newRepositoryForm;

  updateRepositoryList();

  $scope.showAddRepositoryForm = function() {
    newRepositoryForm = $modal.open({
      templateUrl: "template/new_repository_form.html",
      controller: "RepositoryCreateCtrl"
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
    setTimeout(updateRepositoryList, 10000);
  }
}]);
