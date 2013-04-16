var http 			= require('http'),
	awesomeConsole 	= require('./lib/awesome_console.js'),
	fs 				= require('fs'),
	port 			= 1337;

var server = http.createServer(function(request, response) {

	awesomeConsole.log(request.method + ' ' + request.url);

	if (request.method === 'GET' && request.url === '/')
	{
		fs.readFile('index.html', function(err, data) {
			if (!err)
			{
				response.writeHead(200, { 'content-type' : 'text/html' });
				response.write(data);
			}
			else
			{
				response.writeHead(500, { 'content-type' : 'text/plain' });
				response.write(err.toString());
			}

			response.end();
		});
	}
	else
	{
		response.writeHead(404, { 'content-type' : 'text/plain' });
		response.write('Oops! Not found :-(');
		response.end();
	}
});

server.listen(port);
awesomeConsole.log('Server running on port: ' + port);
