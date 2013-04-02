"use strict";

(function(){

	window.onload = function() 
	{
		var canvas = document.createElement('canvas');
		canvas.width = 800;
		canvas.height = 600;
		document.body.appendChild(canvas);

		drawIntoCanvas(canvas);
	}

	function drawIntoCanvas(canvas)
	{
		var ctx = canvas.getContext('2d');

		var start = new Point(100, 100);
		start.width = 5;
		start.strokeStyle = 'green';
		start.fillStyle = start.strokeStyle;
		start.draw(ctx);

		var end = new Point(300, 50);
		end.width = 5;
		end.strokeStyle = 'green';
		end.fillStyle = end.strokeStyle;
		end.draw(ctx);

		var controlPoint = new Point(150, 150);
		controlPoint.width = 5;
		controlPoint.strokeStyle = 'red';
		controlPoint.fillStyle = controlPoint.strokeStyle;
		controlPoint.draw(ctx);

		var line1 = new Line(start, controlPoint);
		line1.strokeStyle = 'blue';
		line1.fillStyle = line1.strokeStyle;
		line1.draw(ctx);

		var line2 = new Line(controlPoint, end);
		line2.strokeStyle = 'blue';
		line2.fillStyle = line2.strokeStyle;
		line2.draw(ctx);

		ctx.moveTo(start.x, start.y);
		ctx.quadraticCurveTo(controlPoint.x, controlPoint.y, end.x, end.y);
		ctx.stroke();
	}

	function Shape()
	{
		this.width = 1;
		this.strokeStyle = 'black';
		this.fillStyle = 'black';
		this.prepareContext = function(context) {
			context.save();
			context.fillStyle = this.fillStyle;
			context.strokeStyle = this.strokeStyle;
			context.lineWidth = this.width;
		}
		this.restoreContext = function(context) {
			context.restore();
		}
		this.draw = function(context) {}
	}

	function Point(x, y)
	{
		Shape.call(this);

		this.x = x;
		this.y = y;

		this.draw = function(context) {
			this.prepareContext(context);

			context.fillRect(this.x, this.y, this.width, this.width);

			this.restoreContext(context);
		}
	}
	Point.prototype = Object.create(Shape.prototype);

	function Line(start, end) 
	{
		Shape.call(this);

		this.start = start;
		this.end = end;

		this.draw = function(context) {
			this.prepareContext(context);

			context.moveTo(this.start.x, this.start.y);
			context.lineTo(this.end.x, this.end.y);
			context.stroke();
			
			this.restoreContext(context);
		}
	}
	Line.prototype = Object.create(Shape.prototype);

}());
