/*global require, exports*/
var db = require('./db.js').db;

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
}),
	FarmerModel = db.model('Farmer', FarmerSchema);

exports.Farmer = FarmerModel;