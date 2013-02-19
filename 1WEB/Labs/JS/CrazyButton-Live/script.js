
function goToGoogle()
{
	window.location = "http://www.google.com";
}


function moveButton(button)
{
	button.style.position = "absolute";

	var leftStr = button.style.left;
	var x = 0;
	if (leftStr)
		x = parseInt(leftStr);

	x += 80;

	var windowWidth = window.innerWidth;
	var maxX = windowWidth - 80;

	if (x >= maxX)
		x = 0;

	var topStr = button.style.top;
	var y = 0;
	if (topStr)
		y = parseInt(topStr);

	y += 44;

	var windowHeight = window.innerHeight;
	var maxY = windowHeight - 44;

	if (y >= maxY)
		y = 0;

	button.style.left = x + "px";
	button.style.top = y + "px";
}