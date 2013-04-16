/*global require, exports*/
var mongoose = require('mongoose');

mongoose.connect('localhost', 'farmersdb');

exports.db = mongoose;