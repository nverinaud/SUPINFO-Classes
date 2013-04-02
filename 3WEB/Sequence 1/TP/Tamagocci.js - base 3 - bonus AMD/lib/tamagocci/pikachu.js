"use strict";

define(['tamagocci'], function(Tamagocci) {

	function Pikachu()
	{
		Tamagocci.call(this);
	}
	Pikachu.prototype = Object.create(Tamagocci.prototype);

	return Pikachu;
});