var url 	= require('url'),
	http 	= require('http');

exports.handleRequest = function(req, res) {

	var params 		= url.parse(req.url, true).query,
		rssFeed 	= params.rss_feed;

	http.get(rssFeed, function(response) {
		response.on('data', function(chunk) {
			res.write(chunk);
		});

		response.on('end', function() {
			res.end();
		});

		res.writeHead(response.statusCode, response.headers);
	}).on('error', function(error) {
		res.statusCode = 500;
		res.setHeader('content-type', 'text/plain');
		res.write(error.toString());
		res.end();
	});
};