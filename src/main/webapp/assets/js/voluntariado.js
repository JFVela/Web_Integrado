(function ($) {

	var $body = $('body')
	



	breakpoints({
		xlarge: ['1281px', '1680px'],
		large: ['981px', '1280px'],
		medium: ['737px', '980px'],
		small: ['481px', '736px'],
		xsmall: [null, '480px']
	});

	

	if (browser.mobile)
		$body.addClass('is-mobile');
	else {

		breakpoints.on('>medium', function () {
			$body.removeClass('is-mobile');
		});

		breakpoints.on('<=medium', function () {
			$body.addClass('is-mobile');
		});

	}

	$('.scrolly')
		.scrolly({
			speed: 1500,

		});
})(jQuery);





