var client = algoliasearch('Y8EXIE1RSQ', 'c61858c95e2b0418574c2e4dae16c137');
var index = client.initIndex('Contact');
index.search({query: '', hitsPerPage: 10, page: 0 })
  .then(function searchDone(content) {
  	console.log(content.hits)
  })
  .catch(function searchFailure(err) {
    console.error(err);
  });
