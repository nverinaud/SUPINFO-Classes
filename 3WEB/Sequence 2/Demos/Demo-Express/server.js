var express = require('express'),
	port	= 1337,
	server 	= express();

server.use('/kikoo', function (req, res, next) {
	console.log('BWAAAAAAAh');
	next();
});

server.use('/kikoo', function (req, res, next) {
	console.log(new Date() + ' ' + req.method + ' ' + req.url);
	next();
});



server.get('/', function (req, res) {
	res.send(200, '<h1>Hello Express</h1>');
});

server.get('/kikoo', function (req, res) {
	res.send(200, '<h1>Hello Kikoo</h1>');
});

server.listen(port);
console.log('Server listening on port: ' + port);