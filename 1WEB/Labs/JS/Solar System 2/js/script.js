
$('.javascript-disabled').removeClass('javascript-disabled');

$('ul li').hover(function(){
	$(this).children('img').finish().fadeTo(300, 0.5);
	$(this).children('span').finish().fadeIn(300);
}, function(){
	$(this).children('img').finish().fadeTo(300, 1.0);
	$(this).children('span').finish().fadeOut(300);
});

$('ul li img').click(function(){

	$bigImg = $('#img-big');
	$bigImg.attr('src', this.src); // this.src <=> $(this).attr("src");
	$bigImg.attr('alt', this.alt);

	$('#dim-bg').fadeIn(500, function(){
		$bigImg.slideDown(300);
	});

});

$('#dim-bg').click(function(){

	$dimBG = $(this);

	$('#img-big').slideUp(300, function(){
		// Note: $(this) ici représente $('#img-big')
		$dimBG.fadeOut(500);
	});

});
