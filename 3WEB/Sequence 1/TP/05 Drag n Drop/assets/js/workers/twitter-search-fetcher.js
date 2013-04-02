'use strict';

var TWITTER_SEARCH_API = "http://search.twitter.com/search.json"
	, refreshURL
	, search
	, updateInterval = 10000;

self.onmessage = function(event) {
	search = event.data;
	startSearching();
};

function startSearching() 
{
	var requestURI = TWITTER_SEARCH_API;
	if (refreshURL)
	{
		requestURI += refreshURL;
	}
	else if (search)
	{
		requestURI += '?q=' + search;
	}

	requestURI += "&callback=newTweetsArrived";

	importScripts(requestURI);
}

function newTweetsArrived(data)
{
	refreshURL = data.refresh_url;
	postMessage(data.results.reverse());
	setTimeout(startSearching, updateInterval);
}
