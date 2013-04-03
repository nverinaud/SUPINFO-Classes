var App = {};

App.start = function() {
	chrome.app.window.create('app/index.html', {
		width: 400,
		height: 480,
		minWidth: 400,
		minHeight: 480
	},
	function(window_created) { 
		console.log(new Date() + ' Window created: ' + window_created);
	});
};

/*
 * Application Lifecycle
 */
chrome.app.runtime.onLaunched.addListener(App.start);