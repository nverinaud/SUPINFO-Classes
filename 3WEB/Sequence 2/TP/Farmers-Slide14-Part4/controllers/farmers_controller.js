/*global require, exports*/
var Farmer		= require('../models/farmer.js').Farmer,
	Farm		= require('../models/farm.js').Farm,
	crypto		= require('crypto'),
	emptyError	= {
		farmer: {
			email: "",
			firstname: "",
			lastname: ""
		}
	};

exports.index = function (req, res) {
	'use strict';

	Farmer.all(function (err, farmers) {
		res.render('./farmers/index.jade', {
			'farmers': farmers,
			error: err
		});
	});
};

exports.create = function (req, res) {
	'use strict';

	var rawFarmer = req.body.farmer;
	rawFarmer.avatarURL = "http://www.gravatar.com/avatar/" + crypto.createHash('md5').update(rawFarmer.email).digest('hex');
	var farmer = new Farmer(rawFarmer);
	farmer.save(function (err, createdFarmer) {
		var error = {};
		error.farmer = {};
		if (err)
		{
			error.message = "Please fill all fields.";
			error.farmer = farmer;

			res.render('./farmers/new.jade', {
				'farmer' : createdFarmer,
				'error' : error
			});
		}
		else
		{
			res.redirect('/');
		}
	});
};

exports.new = function (req, res) {
	'use strict';

	res.render('./farmers/new.jade', {
		'error' : emptyError
	});
};


exports.show = function (req, res) {
	'use strict';

	Farmer.findById(req.params.id, function (err, farmer) {
		if (err)
		{
			res.redirect('/farmers');
		}
		else
		{
			Farm.findByFarmerId(farmer._id, function (err, farms) {
				farmer.farms = farms;
				res.render('./farmers/show.jade', {
					'farmer': farmer
				});
			});
		}
	});
};
