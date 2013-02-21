function validateForm(thisForm)
{
	var allFieldsAreCorrect = true;
	
	// La fonction prend en paramètre le formulaire à valider.
	// On va valider chacun de ses champs un à un.
	var field = null;
	
	// FirstName
	field = thisForm.elements["firstname"];
	if (!validateField("onlyLetters", field)) 
	{
		field.style.border = "1px solid red";
		allFieldsAreCorrect = false;
		document.getElementById("firstname_invalid").style.display = "inline";
	} 
	else 
	{
		field.style.border = null;
		document.getElementById("firstname_invalid").style.display = "none";
	}
	
	field = thisForm.elements["lastname"];
	if (!validateField("onlyLetters", field)) 
	{
		field.style.border = "1px solid red";
		allFieldsAreCorrect = false;
		document.getElementById("lastname_invalid").style.display = "inline";
	} 
	else 
	{
		field.style.border = null;
		document.getElementById("lastname_invalid").style.display = "none";
	}			
	
	field = thisForm.elements["email"];
	if (!validateField("email", field)) 
	{
		field.style.border = "1px solid red";
		allFieldsAreCorrect = false;
		document.getElementById("email_invalid").style.display = "inline";
	} 
	else 
	{
		field.style.border = null;
		document.getElementById("email_invalid").style.display = "none";
	}
		
	field = thisForm.elements["comment"];		
	if (!validateField(null, field)) 
	{
		field.style.border = "1px solid red";
		allFieldsAreCorrect = false;
		document.getElementById("comment_invalid").style.display = "inline";
	} 
	else 
	{
		field.style.border = null;
		document.getElementById("comment_invalid").style.display = "none";
	}
	
	return allFieldsAreCorrect;
}

function validateField(rule, thisField)
{
	var fieldIsValid = true;
	
	with(thisField)
	{
		if (value == null || value == "")
			return false;
		
		switch(rule) 
		{
			case "onlyLetters":
			{
				var onlyLettersRegex = /^[a-z-]+$/i;
				fieldIsValid = value.match(onlyLettersRegex) != null;
				break;
			}
				
			case "email":
			{
				var emailRegex = /^[A-Z0-9\._\-]*@[A-Z0-9\._\-]*\.[A-Z]{2,3}$/i;
				fieldIsValid = value.match(emailRegex) != null;
				break;
			}
		}
	}
	
	return fieldIsValid;
}