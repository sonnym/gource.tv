gourceTV.controller("SystemStatusCtrl", ["$scope", "$http", function($scope, $http) {
  function updateStatus() {
    $http.get(Routes.status_path()).success(function(data) {
      $scope.status = data;
      setTimeout(updateStatus, 5000);
    });
  }

  updateStatus();
}]);
