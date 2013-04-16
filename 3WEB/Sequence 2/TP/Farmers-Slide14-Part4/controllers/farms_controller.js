/*global require, exports*/
var Farm 		= require('../models/farm.js').Farm,
	Farmer		= require('../models/farmer.js').Farmer,
	emptyError 	= {
		farm: {
			name: ""
		}
	};

exports.create = function (req, res) {
	'use strict';

	var farm = new Farm(req.body.farm);
	farm.save(function (err, createdFarm) {
		var error = {};
		error.farm = {};
		if (err)
		{
			console.log(err);
			error.message = "Please fill all fields.";
			error.farm = farm;

			Farmer.find().exec(function (err, farmers) {
				res.render('./farms/new.jade', {
					'error' : error,
					'farmers' : farmers
				});
			});
		}
		else
		{
			res.redirect('/farmers');
		}
	});
};

exports.new = function (req, res) {
	'use strict';

	Farmer.find().exec(function (err, farmers) {
		res.render('./farms/new.jade', {
			'error' : emptyError,
			'farmers' : farmers
		});
	});
};