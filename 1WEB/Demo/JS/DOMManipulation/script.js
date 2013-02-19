
var img = document.createElement('img');

img.src = "http://www.w3.org/2008/site/images/logo-w3c-mobile-lg";
img.setAttribute("alt", "W3C Logo");

document.body.appendChild(img);

var p = document.createElement('p');

p.innerText = "Hello World";
p.style["text-align"] = "center";

document.body.appendChild(p);

img.parentNode.removeChild(img);
p.parentNode.removeChild(p);




var divEl = document.getElementById("content");
var strongEl = divEl.childNodes[3].childNodes[1];
console.log(strongEl);
