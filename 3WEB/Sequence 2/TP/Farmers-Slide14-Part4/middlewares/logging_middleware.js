/*global exports*/
exports.__express = function (req, res, next) {
	'use strict';
	console.log(new Date() + ' ' + req.method + ' ' + req.url);
	next();
};