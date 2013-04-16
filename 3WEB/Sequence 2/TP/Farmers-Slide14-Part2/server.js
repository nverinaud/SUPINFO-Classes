var express = require('express'),
	crypto	= require('crypto'),
	farmersController = require('./controllers/farmers_controller.js');

var server 	= express(),
	port	= 1337,
	emptyError = { 
		farmer: {
			email: "",
			firstname: "",
			lastname: ""
		}
	};

/* Middlewares */
server.engine('jade', require('jade').__express);
server.use('/public', express.static(__dirname + '/public'));
server.use(express.bodyParser());

/* Routing */
server.get('/', function (req, res) {
	res.render('./home.jade', {
		farmer: null,
		error: emptyError
	});
});

server.post('/farmers', function (req, res) {
	var farmer = req.body.farmer;
	farmer.avatarURL = "http://www.gravatar.com/avatar/" + crypto.createHash('md5').update(farmer.email).digest('hex');
	farmersController.createFarmer(farmer, function (err, createdFarmer) {
		var error = {};
		error.farmer = {};
		if (err)
		{
			error.message = "Please fill all fields.";
			error.farmer = farmer;
		}

		res.render('./home.jade', {
			'farmer' : createdFarmer,
			'error' : error
		});
	});
});

/* Listen */
server.listen(port);
console.log('Server running on port ' + port);