"use strict";

define(['tamagocci'], function(Tamagocci) {

	function HelloKitty()
	{
		Tamagocci.call(this);
	}
	HelloKitty.prototype = Object.create(Tamagocci.prototype);

	HelloKitty.prototype.happyPicture = function happyPicture() {
		return "hk_good.gif";
	};

	HelloKitty.prototype.badPicture = function badPicture() {
		return "hk_bad.gif";
	};

	HelloKitty.prototype.deadPicture = function deadPicture() {
		return "hk_dead.png";
	};

	return HelloKitty;
});
