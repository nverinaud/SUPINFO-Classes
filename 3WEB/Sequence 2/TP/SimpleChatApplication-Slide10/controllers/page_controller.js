var fs 				= require('fs'),	// http://nodejs.org/api/fs.html
	url				= require('url'),  	// http://nodejs.org/api/url.html
	simpleChatUtils = require('../helpers/simple_chat_utils.js');

/// Display Home Page
exports.getHome = function(req, res) {
	fs.readFile("views/index.html", function(err, data) 
	{
		if (err) 
		{
			res.writeHead(500, { 'content-type' : 'text/plain'});
			res.write(err.toString());
		} 
		else 
		{
			res.writeHead(200, { 'content-type' : 'text/html' });
			res.write(data);
		}

		res.end();
	});
};


/// Get a resource if it exists
exports.get = function(req, res) {
	// Dumb way to return content of a requested files (just slice the first /, we are at the root dir)
	var URL = url.parse(req.url);
	var filePath = URL.pathname.slice(1);

	fs.readFile(filePath, function(err, data) 
	{
		if (!err) 
		{
			res.writeHead(200, { 'content-type' : simpleChatUtils.mimeTypeOfFileAtPath(filePath) });
			res.write(data);
		} 
		else 
		{
			res.statusCode = 404;
		}

		res.end();
	});
};