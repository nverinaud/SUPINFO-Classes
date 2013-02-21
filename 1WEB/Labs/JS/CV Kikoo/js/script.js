
$('a[href="http://www.google.com/search?q=nicolas+verinaud"]').css("background-color", "lime");


//Non-Plugin Function
var doBlink = function(obj,start,finish) { 
    jQuery(obj).fadeOut(300).fadeIn(300, function() {
		if(start!=finish) { 
			start=start+1; 
			doBlink(obj,start,finish); 
		}
	}); 
};
 
//jQuery Blink Plugin
jQuery.fn.blink = function(start,finish) { 
	return this.each(function() { 
		doBlink(this,start,finish) 
	}); 
};

$('h4:contains("Liens")').blink(1, 0);
$('#haut').animate({
	"font-size": "+=2em"
}, 3000, "easeInOutElastic");
