
(function(){

	document.body.onload = function()
	{
		var form = document.getElementById("myForm");
		form.addEventListener('submit', onFormSubmitted);
	};

	function onFormSubmitted(event)
	{
		console.log(event);
		var form = event.target;

		event.preventDefault();
	}

})();
