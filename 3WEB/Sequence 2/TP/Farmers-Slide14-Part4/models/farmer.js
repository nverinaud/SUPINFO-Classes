/*global require, exports*/
var db		= require('./db.js').db,
	farm	= require('./farm.js');

var FarmerSchema = db.Schema({
	firstname	: {
		type		: String,
		required	: true,
		unique		: false,
		trim		: true
	},
	lastname	: {
		type		: String,
		required	: true,
		unique		: false,
		trim		: true
	},
	email		: {
		type		: String,
		required	: true,
		unique		: true,
		trim		: true
	},
	avatarURL	: {
		type		: String,
		required	: true,
		unique		: false,
		trim		: true
	}
});

FarmerSchema.statics.all = function (callback) {
	'use strict';
	this.find().exec(callback);
};

var FarmerModel = db.model('Farmer', FarmerSchema);

exports.Farmer = FarmerModel;
exports.Schema = FarmerSchema;