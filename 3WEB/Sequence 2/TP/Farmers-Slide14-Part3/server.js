/*global require, __dirname*/
var express = require('express'),
	farmersController = require('./controllers/farmers_controller.js');

var server	= express(),
	port	= 1337;

/* Middlewares */
server.engine('jade', require('jade').__express);
server.use('/public', express.static(__dirname + '/public'));
server.use(express.bodyParser());

/* Routing */
server.get('/', farmersController.index);
server.get('/farmers', farmersController.index);
server.post('/farmers', farmersController.create);
server.get('/farmers/new', farmersController.new);

/* Listen */
server.listen(port);
console.log('Server running on port ' + port);