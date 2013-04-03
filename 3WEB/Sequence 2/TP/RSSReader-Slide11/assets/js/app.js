(function($){
	'use strict';

	$(document).ready(function() {

		$.mobile.defaultPageTransition = 'slide';

		var $summaryPage = $("#summary");
		var $summaryPageContent = $("#summary div[data-role='content']");
		var $summaryPageTitle = $('#summary div:first-child h1');
		var $listView = $("#rss-feed-list-view");

		$('a').on('click', function(event) {

			var $this = $(this);
			var rssURL = $this.attr('data-rss-feed-url');

			/* Update title */
			$summaryPageTitle.html($this.text());

			/* Prepare the page */
			$listView.hide();
			$listView.html('');

			/* Ajax call */
			$.ajax({
				url: rssURL,
				accepts: 'text/xml',
				success: function(data, textStatus, jqXHR) {
					console.log('Text status: ' + textStatus);
					console.log(data);
					$(data).find('item').each(renderItem);
					$listView.listview('refresh');
					$listView.fadeIn(300);
				},
				error: function() {
					$listView.show();
					$listView.html('<p>Loading error</p>');
				}
			});

		});

		/* Rendering */
		function renderItem(index, item)
		{
			item = $(item);
			/*
				<li>
					<a href="{{item.link}}">
						<h2>{{item.title}}</h2>
						<p>{{item.description}}</p>
						<p class="ui-li-aside">{{item.pubDate}}</p>
					</a>
				</li>
			*/
			var $li = $('<li/>');
			var $a = $('<a/>');
			$a.attr('href', item.find('link').text());

			var $h2 = $('<h2/>');
			$h2.html(item.find('title').text());
			$a.append($h2);

			var $p = $('<p/>');
			$p.html(item.find('description').text());
			$a.append($p);

			$p = $('<p/>');
			$p.html(item.find('pubDate').text());
			$p.addClass('ui-li-aside');
			$a.append($p);

			$li.append($a);

			$listView.append($li);
		}

	});

})(jQuery);