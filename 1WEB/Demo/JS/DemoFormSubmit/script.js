
document.body.onload = function(){
	var contactForm = document.getElementById("contactForm");
	console.log(contactForm);

	contactForm.addEventListener("submit", validateForm);
};

function validateForm(event)
{
	var userInputIsValid = true;

	var form = event.target;
	
	var lastnameInput = form.elements["lastname"];
	var lastnameErrorSpan = document.getElementById("lastname-error");

	var alphaRegex = /^[a-z-]+$/i;

	if (lastnameInput.value.match(alphaRegex) == null) 
	{
		lastnameInput.style.border = "1px solid red";
		lastnameErrorSpan.style.display = "inline";
		userInputIsValid = false;
	}
	else
	{
		lastnameInput.style.border = "1px solid black";
		lastnameErrorSpan.style.display = "none";
	}

	if (!userInputIsValid)
		event.preventDefault();
}
