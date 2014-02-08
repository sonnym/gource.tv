gourceTV.factory("Repository", ["$resource", function($resource) {
  var resources = $resource(Routes.repositories_path());
  var resource = $resource(Routes.repository_path(":id"));

  return { query: resources.query, create: resources.save, get: resource.get };
}]);

