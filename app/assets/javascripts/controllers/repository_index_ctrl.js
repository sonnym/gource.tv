gourceTV.controller("RepositoryIndexCtrl", ["$scope", "$rootScope", "$location", "$modal", "Repository", function($scope, $rootScope, $location, $modal, Repository) {
  var newRepositoryForm;

  $scope.repositories = [];
  $scope.$watch(Repository.list, function(newVal, oldVal) {
    if (newVal === oldVal) {
      return
    }

    $scope.repositories = newVal;

    setRandomRepository();
  }, true);

  $scope.showAddRepositoryForm = function() {
    newRepositoryForm = $modal.open({
      templateUrl: "new_repository_form.html",
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

  $scope.setRandomRepository = setRandomRepository

  $rootScope.$on("repository:modal:close", function() {
    newRepositoryForm.close();
  });

  function setRandomRepository() {
    var random_idx = Math.floor(Math.random() * ($scope.repositories.length - 1));
    $scope.randomRepository = $scope.repositories[random_idx];
  }
}]);
