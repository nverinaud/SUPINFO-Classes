/*global require, exports*/
var db = require('./db.js').db;

var FarmSchema = db.Schema({
	name			: {
		type		: String,
		required	: true,
		unique		: false,
		trim		: true
	},
	farmer			: {
		type		: db.Schema.Types.ObjectId,
		ref			: 'Farmer'
	}
});

FarmSchema.statics.findByFarmerId = function (farmerId, callback) {
	'use strict';
	this.where('farmer', farmerId).exec(callback);
};

var FarmModel = db.model('Farm', FarmSchema);

exports.Farm = FarmModel;
exports.Schema = FarmSchema;