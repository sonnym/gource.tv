gourceTV.filter('truthy', function(){
  return function(repositories, truthy) {
    if (truthy) {
      return repositories;
    } else {
      var selected = [];

      angular.forEach(repositories, function(repository) {
        if (!repository.processing) {
          selected.push(repository);
        }
      });

      return selected;
    }
  };
});
