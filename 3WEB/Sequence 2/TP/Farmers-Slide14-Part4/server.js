/*global require*/
var express				= require('express'),
	farmersController	= require('./controllers/farmers_controller.js'),
	farmsController		= require('./controllers/farms_controller.js');

var server	= express(),
	port	= 1337;

/* Middlewares */
server.engine('jade', require('jade').__express);
server.use(require('./middlewares/logging_middleware.js').__express);
server.use('/public', express.static(__dirname + '/public'));
server.use(express.bodyParser());

/* Routing */
server.get('/', farmersController.index);

// Farmers
server.get('/farmers', farmersController.index);
server.post('/farmers', farmersController.create);
server.get('/farmers/new', farmersController.new);
server.get('/farmers/:id', farmersController.show);

// Farms
server.post('/farms', farmsController.create);
server.get('/farms/new', farmsController.new);

/* Listen */
server.listen(port);
console.log('Server running on port ' + port);