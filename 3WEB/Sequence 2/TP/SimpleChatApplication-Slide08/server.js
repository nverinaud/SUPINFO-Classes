// Requires
var http 				= require('http'), 	// http://nodejs.org/api/http.html
	url					= require('url'),
	pageController		= require('./controllers/page_controller.js'),
	messagesController 	= require('./controllers/messages_controller.js');

// Globals
var port 	= 1337,
	server 	= null;

server = http.createServer(function(req, res) {

	console.log(req.method + " " + req.url);
	var path = url.parse(req.url).pathname;

	// Routing is manually managed here
	if (req.method == "GET") 
	{
		if (path == "/") 
		{ 
			// Display Home Page
			pageController.getHome(req, res);
		} 
		else if (path == "/messages") 
		{ 
			// API request to get the last message
			messagesController.index(req, res);
		} 
		else 
		{ 
			// Request for other ressources (like assets)
			pageController.get(req, res);
		}
	} 
	else if (req.method == "POST") 
	{
		if (path == "/messages") 
		{
			// Create a new message
			messagesController.newMessage(req, res);
		}
	} 
	else 
	{
		res.end();
	}
});

server.listen(port);

console.log('Server running on port ' + port);