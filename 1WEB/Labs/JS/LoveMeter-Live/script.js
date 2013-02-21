
document.body.onload = function(){

	var loveForm = document.getElementById("loveForm");
	loveForm.addEventListener("submit", function(event){

		event.preventDefault(); // empêche l'envoi du formulaire

		/*
			1) Récupérer la valeur des deux inputs.
			2) Calculer le nombre magique de la valeur des deux inputs
			3) Comparer les deux nombres et afficher le résultat correspondant,
				si la différence des deux nombres :
					- est entre 0 et 2 alors la compatibilité est grande
					- est entre 3 et 6 alors la compatibilité est moyenne
					- est supérieur à 6 alors la compatibilité est faible.
		*/

		var form = event.target;
		var firstname1Input = form.elements["firstname1"];
		var firstname2Input = form.elements["firstname2"];

		var magicNumber1 = computeMagicNumber(firstname1Input.value);
		var magicNumber2 = computeMagicNumber(firstname2Input.value);

		var result = resultForMagicNumbers(magicNumber1, magicNumber2);

		var loveResultsP = document.getElementById("love-results");
		loveResultsP.innerHTML = "Votre score de compatibilit&eacute; est: " + result + ". C'est g&eacute;nial!!";
	});
};


function resultForMagicNumbers(firstMN, secondMN)
{
	var gap = Math.abs(firstMN - secondMN);
	var result = "";

	if (gap < 3)
		result = "FORTE";
	else if (3 <= gap && gap <= 6)
		result = "MOYENNE";
	else
		result = "FAIBLE";

	return result;
}


function computeMagicNumber(name)
{
	var i = 0;
	var charCode = 0;
	var charCodePowed = 0;
	var result = 0;

	console.log("Magic Number for: " + name);

	for (i = 0; i < name.length; i++)
	{
		charCode = name.charCodeAt(i);
		console.log( name[i] + " = " + charCode );

		charCodePowed = Math.pow(charCode, i+1);

		result += flattenNumber(charCodePowed);
	}

	result = flattenNumber(result);

	console.log("Magic Number: " + result);

	return result;
}


function flattenNumber(num)
{
	var numAsString = num.toString(); // <=> new String(num);
	var i = 0;
	var result = 0;

	for (i = 0; i < numAsString.length; i++)
	{
		result += parseInt(numAsString[i]);
	}

	if (result >= 10)
		result = flattenNumber(result);

	return result;
}