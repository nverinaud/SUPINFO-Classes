/*global require, exports*/
var Farmer = require('../models/farmer.js').Farmer;

/**
	Create a new farmer and save it in the database.

	@param rawFarmer a POJO representing the farmer to create
	@param callback function (err, createdFarmer)
*/
exports.createFarmer = function (rawFarmer, callback) {
	var farmer = new Farmer(rawFarmer);
	farmer.save(callback);
};
