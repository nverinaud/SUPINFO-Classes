
$('.javascript-disabled').removeClass('javascript-disabled');

$('ul li').hover(function(){
	$(this).children('img').finish().fadeTo(300, 0.5);
	$(this).children('span').finish().fadeIn(300);
}, function(){
	$(this).children('img').finish().fadeTo(300, 1.0);
	$(this).children('span').finish().fadeOut(300);
});
