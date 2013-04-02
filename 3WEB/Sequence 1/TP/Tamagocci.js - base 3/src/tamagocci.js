'use strict';

function Tamagocci() 
{
	/* Private ivars */
	var _weight = 5
	, _happiness = 5
	, _isDead = false;

	/* Properties */
	Object.defineProperties(this, {
		weight: {
			get: function () {
				return _weight;
			},
			set: function (w) {
				_weight = w;
				if ((_weight < this.minWeight) || (_weight > this.maxWeight))
					this.isDead = true;
			}
		},
		minWeight: {
			value: 1,
			writable: true
		},
		maxWeight: {
			value: 10,
			writable: true
		},
		age: {
			value: 0,
			writable: true
		},
		happiness: {
			get: function () {
				return _happiness;
			},
			set: function (h) {
				_happiness = h;
				if (_happiness <= 0)
					this.isDead = true;
			}
		},
		isDead: {
			get: function () {
				return _isDead;
			},
			set: function (isDead) {
				_isDead = isDead;
				if (_isDead && typeof this.ondie === 'function')
					this.ondie();
			}
		}
	});
}


/* Methods */
Tamagocci.prototype.eat = function eat() {
	this.weight += 2;
};

Tamagocci.prototype.play = function play() {
	this.weight--;
	this.happiness++;
};

Tamagocci.prototype.becomeOlder = function becomeOlder() {
	this.age++;
	this.minWeight++;
	this.maxWeight++;
	this.happiness--;
};

Tamagocci.prototype.happyPicture = function happyPicture() {
	return "pk_good.gif";
};

Tamagocci.prototype.badPicture = function badPicture() {
	return "pk_bad.gif";
};

Tamagocci.prototype.deadPicture = function deadPicture() {
	return "pk_dead.gif";
};

Tamagocci.prototype.getPicture = function getPicture() {
	var picture = this.happyPicture();

	if (   (this.weight < this.minWeight+3)
		|| (this.weight > this.maxWeight-3) 
		|| (this.happiness < 3))
	{
		picture = this.badPicture();
	}

	if (this.isDead)
		picture = this.deadPicture();

	return picture;
};


function Pikachu()
{
	Tamagocci.call(this);
}
Pikachu.prototype = Object.create(Tamagocci.prototype);


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