(function(){
	'use strict';

	var twitterSearchFetcher = new Worker('assets/js/workers/twitter-search-fetcher.js');

	window.onload = function() {

		twitterSearchFetcher.onmessage = function(event) {
			var newTweets = event.data;

			if (newTweets.length > 0)
				onNewTweetsFetched(newTweets);
		};

		twitterSearchFetcher.postMessage("SUPINFO");
	};

	/* Fetching & Rendering */
	var timelineView = document.getElementById('timeline');

	function onNewTweetsFetched(newTweets) 
	{
		var tweetView;
		newTweets.forEach(function(tweet) {
			tweetView = newTweetViewForTweet(tweet);
			timelineView.insertBefore(tweetView, timelineView.firstElementChild);
		});
	}

	/*
		Tweet:
			- created_at,
			- text,
			- from_user

		View:
			<article>
				<p>[text]</p>
				<footer>
					<p><em>Created the [created_at]</em> by <strong>@[from_user]</strong></p>
				</footer>
			</article>
	*/
	function newTweetViewForTweet(tweet)
	{
		var article = document.createElement('article');

		/* Text */
		var p = document.createElement('p');
		p.innerHTML = tweet.text;
		article.appendChild(p);

		/* Footer */
		var footer = document.createElement('footer');
		p = document.createElement('p');
		
		// Date
		var em = document.createElement('em');
		em.innerHTML = "Created the " + tweet.created_at;
		p.appendChild(em);

		// Author
		p.innerHTML += " by ";
		var strong = document.createElement('strong');
		strong.innerHTML = "@"+tweet.from_user;
		p.appendChild(strong);

		footer.appendChild(p);
		article.appendChild(footer);

		return article;
	}

})();
