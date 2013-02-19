var numberToFind = Math.floor(Math.random()*101);
var remainingAttempts = 7;
var numberEntered;

console.log(numberToFind);
do {
	numberEntered = prompt("Entrer un nombre");
	console.log(typeof numberEntered);

	if (numberEntered < numberToFind) {
		alert("C'est plus ! (Plus que "+ (remainingAttempts-1) + " essais )");
	}
	else if (numberEntered > numberToFind) {
		alert("C'est moins ! (Plus que "+ (remainingAttempts-1) + " essais )");
	}
	else if (numberEntered == numberToFind) {
		alert("Vous avez gagné !");
		remainingAttempts=1;
	}

	remainingAttempts -= 1;

} while (remainingAttempts != 0);

if (remainingAttempts==0 && numberEntered != numberToFind) {
		alert("Perdu !");
}