// Le nombre à trouver, généré de manière pseudo-aléatoire.
// Le nombre généré est entre 0 et 1 donc on le multiplie par 100 pour avoir un nombre entre 0 et 100.
var numberToFind = Math.random()*100; 

// Le nombre généré est un nombre à virgule, on prends donc l'arrondi grâce à la méthode ceil() de l'objet Math.
numberToFind = Math.ceil(numberToFind);

// On initialise le nombre d'essais restants.
var remainingAttempts = 7;

// Un booléen pour savoir si l'utilisateur a trouvé.
var won = false;

// Boucle du déroulement du jeu.
// Tant que les essais sont supérieurs à 0.
while(remainingAttempts > 0) 
{
	// On demande un nombre à l'utilisateur.
	var userGuess = window.prompt("What is the number ?");
	
	if (userGuess == '' || userGuess == null)
		continue;
	
	// Si sa proposition est égale au nombre à trouver alors il gagne.
	if (userGuess == numberToFind) 
	{
		won = true;
		break; // Il gagne, donc on interrompt la boucle !
	// Sinon si sa proposition est inférieure, on lui dit que le nombre est plus grand.
	} 
	else if (userGuess < numberToFind) 
	{
		alert('The number is greater.');
	} 
	else 
	{
		alert('The number is smaller.');
	}
	
	// On diminue ses chances restantes après chaque essai raté.
	remainingAttempts--;
	
	// On l'informe de ses chances restantes.
	alert(remainingAttempts + " chances left.");	
}

// S'il n'a pas gagné à la fin du jeu, on lui indique quel était le nombre à trouver.
if(!won)
	alert('Sorry, you failed ! The number was : ' + numberToFind);
else
	alert('You won ! The number was : ' + numberToFind);