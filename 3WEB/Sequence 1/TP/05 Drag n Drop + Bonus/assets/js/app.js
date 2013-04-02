(function(){
	'use strict';

	var twitterSearchFetcher = new Worker('assets/js/workers/twitter-search-fetcher.js');

	window.onload = function() {

		/* Listener for fetching new tweets. */
		twitterSearchFetcher.onmessage = function(event) {
			var newTweets = event.data;

			if (newTweets.length > 0)
				onNewTweetsFetched(newTweets);
		};

		/* Drag'n'drop support */
		var favouritesView = document.getElementById('favourites');

		favouritesView.ondragover = function(event) {
			this.setAttribute('class', 'active');
			event.preventDefault();
		};

		favouritesView.ondragleave = function(event) {
			this.removeAttribute('class');
		};

		favouritesView.ondrop = function(event) {
			event.preventDefault();
			this.removeAttribute('class');
			/* Make the drop */
			var droppedElementId = event.dataTransfer.getData('Text');
			var droppedElement = document.getElementById(droppedElementId);
			droppedElement.draggable = false;
			this.appendChild(droppedElement);
		};

		/* Start fetching */
		twitterSearchFetcher.postMessage("SUPINFO");
	}

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
			- from_user,
			- id_str

		View:
			<article id="tweet_[id_str]">
				<p>[text]</p>
				<footer>
					<p><em>Created the [created_at]</em> by <strong>@[from_user]</strong></p>
				</footer>
			</article>
	*/
	function newTweetViewForTweet(tweet)
	{
		var article = document.createElement('article');
		article.id = "tweet_"+tweet.id_str;

		/* Text */
		var p = document.createElement('p');
		if (twttr)
			p.innerHTML = twttr.txt.autoLink(tweet.text);
		else
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
		strong.innerHTML = twttr.txt.autoLink("@"+tweet.from_user);
		p.appendChild(strong);

		footer.appendChild(p);
		article.appendChild(footer);

		/* Drag'n'drop */
		article.draggable = true;
		article.ondragstart = function (event) {
			event.dataTransfer.setData('Text', event.target.id);
		};

		return article;
	}

})();