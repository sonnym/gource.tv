gourceTV.factory("Repository", ["$resource", "$timeout", "$interval", function($resource, $timeout, $interval) {
  var repositories;

  var resources = $resource(Routes.repositories_path());
  var resource = $resource(Routes.repository_path(":id"));

  $timeout(updateRepositories);
  $interval(updateRepositories, 5000);

  return { list: function() { return repositories }
         , create: resources.save
         , get: resource.get
         };

  function updateRepositories() {
    resources.query(function(data) {
      repositories = data;
    });
  }
}]);

