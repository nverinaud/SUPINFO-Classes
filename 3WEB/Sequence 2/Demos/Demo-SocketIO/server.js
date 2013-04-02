// Requires
var http 	= require('http'), 	// http://nodejs.org/api/http.html
	url		= require('url'),
	fs 		= require('fs'),
	simpleChatUtils = require('./simple-chat-utils.js')
	io		= require('socket.io');

// Globals
var port 	= 1337,
	server 	= null;

server = http.createServer(function(req, res) {

	console.log(new Date() + " " + req.method + " " + req.url);
	var path = url.parse(req.url).pathname;

	// Routing is manually managed here
	if (req.method == "GET") 
	{
		if (path == "/") 
		{ 
			// Display Home Page
			fs.readFile("index.html", function(err, data) 
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
		} 
		else 
		{ 
			// Request for other ressources (like assets)
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
		}
	} 
	else 
	{
		res.end();
	}
});

server.listen(port);

console.log(new Date() + ' Server running on port ' + port);

io = io.listen(server);

io.sockets.on('connection', function(client) {
	console.log('New client conntected.');

	client.emit('hello', { 'message': 'Hellowww !'});

	client.on('say', function(data) {
		var msg = data.msg;
		io.sockets.emit('hello', {'message':msg});
	});

});