
var tab = []; // <=> new Array();

tab.push("Premier élément !");
tab.push(42);

tab.forEach(function(element, index, array) {
	console.log("tableau[" + index + "] = " + element);
});

tab.forEach(prompt);