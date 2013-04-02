'use strict';

/*
	
	# Javascript Prototyping Best Practices

	* To create a class, create a constructor function with a `Name` and assign
		it to a variable of the same `Name`.

	* In this constructor only define properties using `this.prop` notation
		or, even better, using `Object.defineProperty` method.

	* NEVER define methods in the constructor because you will break the
		prototype chain !!!!!

	* ALWAYS define methods on the prototype. To define methods use 
		`YourClass.prototype.yourMethod`.

	* To create a subclass:
		- create a constructor function and call the superclass constructor 
			using `Superclass.call(this[, args, ...])`,
		- set the subclass's prototype to `Object.create(Superclass.prototype)`

	* To call the 'super' implementation of a method you must manually follow
		the prototype chain:
		- use `Superclass.prototype.method.call(this[, args, ...])`
		- or `Object.getPrototypeOf(Subclass.prototype).method.call(this[, args, ...])`
		See the redefinition of `sayHello` below.

*/


/*
	`Mother` will be our base class. This function is called the `constructor`.
	Every subclasses should call the constructor with the parameters (see `Son`
	below).
*/
var Mother = function Mother(name) {
	
	/*
	 	Each `Mother` objects will have their own name, which is correct.
	 	You can remove the `var _name` & `Object.defineProperty` if you don't
	 	want getter & setter. Just keep `this.name = name`.
	 */
	var _name;
	Object.defineProperty(this, 'name', {
		get: function() { return _name; },
		set: function(n){ _name = n; }
	});
	this.name = name;

	/* 
		Each `Mother` objects will have their own toString method.
		You break the prototype chain when you define methods like that.
		To understand why this is bad open your JS console and create an instance
		of `Son` (see below). The `Son` redefines `toString` in its prototype
		but calling `toString` on the `Son` instance will show "<Mother>" in
		the console because each `Son` objects have their own `toString` method
		so the prototype chain is not followed !!

		A better solution is to only define properties within object constructor
		because properties are unique for each instances.
		To define methods within the prototype chain, use `Mother.prototype`.

		Moreover we will not be able to change the behavior of the `toString` 
		method for all instances currently alive.

		BUT you can redefine the `toString` method in subclasses and you will have
		to do it for each instances, ie. in the subclass constructor !
	*/
	this.toString = function() {
		console.log('<Mother> name:' + this.name);
		console.log("I will always get called, even by the subclasses. Niark Niark ';..;' ");
	};
};

/*
	We define a method `sayHello` on Mother's prototype.
	This method will be in the prototype chain so when it is reimplemented
	dynamically later it will affect all instances.
	To try this behavior type this in your js console:
		`var mom = new Mother();`
		`mom.sayHello();` <- shows in alert
		`Mother.prototype.sayHello = function(){ console.log('Hello'); };`
		`mom.sayHello();` <- shows in console
*/
Mother.prototype.sayHello = function() {
	window.alert('['+this.name+'] Hello !');
};


/*
	`Son` class will be a subclass of `Mother`.
*/
var Son = function Son(name, isGeek) {
	
	/*
		Call the constructor of the superclass `Mother` passing arguments it
		needs.
	*/
	Mother.call(this, name);

	/*
		Define `Son` properties.
	*/
	var _isGeek = false;
	Object.defineProperty(this, 'isGeek', {
		get: function() { return _isGeek; },
		set: function(isG) { _isGeek = isG; }
	});
	this.isGeek = isGeek;

	/*
		If we want to override `Mother.toString` we have to do this here like the
		following:

			`this.toString = function() {
				console.log("<Son> name:"+this.name);
			};`
	*/
};

/* 
	A `Son` is a `Mother`. Here we are defining the SuperPrototype.
	But why `Object.create(Mother.prototype)` and not simply `Mother.prototype` ?
	Because changing the `Son`'s prototype does not have to change the `Mother`'s
	one. If we redefine `sayHello` for `Son` we don't want `Mother`'s `sayHello`
	to be redefined. So the `Son` prototype must be a copy of the `Mother`'s one.
*/
Son.prototype = Object.create(Mother.prototype);

/*
	This `toString` method is useless because every `Son` have their own
	`toString` method. This is because the `Son` constructor calls `Mother`
	constructor which define a `toString` method per instance and not on the
	prototype ! The prototype chain will not be followed because it works like
	the following for methods discovery:
		1- Does the instance have the method ?
		2- Does the prototype have the method ?
		3- Does the prototype of the prototype have the method ?
		4- etc.
*/
Son.prototype.toString = function() {
	console.log('<Son> name:' + this.name);
	window.alert("I will never get called! :(");
};

/*
	Redefine of `sayHello` method inherited from `Mother`.
	We can call the SuperPrototype implementation using:
		- `Mother.prototype.sayHello.call(this)` directly referencing `Mother`,
		- or `Object.getPrototypeOf(Son.prototype).sayHello.call(this)` using
			the prototype of the prototype which works but is more odd. This
			approach is better since we don't have to change this code if we
			change the `Son`'s superprototype.
*/
Son.prototype.sayHello = function() {
	Object.getPrototypeOf(Son.prototype).sayHello.call(this);
	if (this.isGeek)
		window.alert("And I'm a G33K !");
};
