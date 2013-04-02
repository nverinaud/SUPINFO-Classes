function Tamagocci()
{
	this.weight = 5;
	this.minWeight = 1,
	this.maxWeight = 10,
	this.age = 0;
	this.happiness = 5;
}

Tamagocci.prototype.eat = function() {
	this.weight += 2;
};

Tamagocci.prototype.play = function() {
	this.weight--;
	this.happiness++;
};

Tamagocci.prototype.becomeOlder = function() {
	this.age++;
	this.minWeight++;
	this.maxWeight++;
	this.happiness--;
};

Tamagocci.prototype.isDead = function() {
	return (this.weight < this.minWeight) 
		|| (this.weight > this.maxWeight)
		|| (this.happiness <= 0);
};

Tamagocci.prototype.happyPicture = function() {
	return "pk_good.gif";
};

Tamagocci.prototype.badPicture = function() {
	return "pk_bad.gif";
};

Tamagocci.prototype.deadPicture = function() {
	return "pk_dead.gif";
};

Tamagocci.prototype.getPicture = function () {
	var picture = this.happyPicture();

	if (   (this.weight < this.minWeight+3)
		|| (this.weight > this.maxWeight-3) 
		|| (this.happiness < 3))
	{
		picture = this.badPicture();
	}

	if (this.isDead())
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

HelloKitty.prototype.happyPicture = function() {
	return "hk_good.gif";
};

HelloKitty.prototype.badPicture = function() {
	return "hk_bad.gif";
};

HelloKitty.prototype.deadPicture = function() {
	return "hk_dead.png";
};