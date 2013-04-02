function Tamagocci()
{
	this.weight = 5;
	this.minWeight = 1,
	this.maxWeight = 10,
	this.age = 0;
	this.happiness = 5;

	this.eat = function() {
		this.weight += 2;
	};

	this.play = function() {
		this.weight--;
		this.happiness++;
	};

	this.becomeOlder = function() {
		this.age++;
		this.minWeight++;
		this.maxWeight++;
		this.happiness--;
	};

	this.isDead = function() {
		return (this.weight < this.minWeight) 
			|| (this.weight > this.maxWeight)
			|| (this.happiness <= 0);
	};

	this.getPicture = function() {
		var picture = "pk_good.gif";

		if (   (this.weight < this.minWeight+3)
			|| (this.weight > this.maxWeight-3) 
			|| (this.happiness < 3))
		{
			picture = "pk_bad.gif";
		}

		if (this.isDead())
			picture = "pk_dead.gif"

		return picture;
	};
}