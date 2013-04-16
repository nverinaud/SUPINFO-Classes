var express = require('express'),
	crypto	= require('crypto');

var server 	= express(),
	port	= 1337;

/* Middlewares */
server.engine('jade', require('jade').__express);
server.use('/public', express.static(__dirname + '/public'));
server.use(express.bodyParser());

/* Routing */
server.get('/', function (req, res) {
	res.render('./home.jade', {
		user: null
	});
});

server.post('/farmers', function (req, res) {
	var user = req.body.user;
	user.avatarURL = "http://www.gravatar.com/avatar/" + crypto.createHash('md5').update(user.email).digest('hex');
	res.render('./home.jade', {
		'user' : user
	});
});

/* Listen */
server.listen(port);
console.log('Server running on port ' + port);