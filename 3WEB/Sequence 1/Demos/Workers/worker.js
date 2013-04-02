
var TWITTER_SEARCH_API = "http://search.twitter.com/search.json"
,	refreshURL = "?q=SUPINFO"
,	callback = "&callback=fetchTweets"
,	refreshInterval = 10000;

self.onmessage = function(event) {
	startSearching();
}

function fetchTweets(result) 
{
	refreshURL = result.refresh_url;
	postMessage(result.results.reverse());
	setTimeout(startSearching, refreshInterval);
}

function startSearching()
{
	importScripts(TWITTER_SEARCH_API + refreshURL + callback);
}
