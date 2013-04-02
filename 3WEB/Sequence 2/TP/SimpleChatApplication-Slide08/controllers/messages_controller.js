// Requires
var url = require('url');

// Data
var messages 	= [],
	msgBuffer 	= null;

exports.index = function(req, res) 
{
	res.setHeader('content-type', 'application/json');
	var result = {};

	if (messages.length > 0) 
	{
		var params = url.parse(req.url, true).query;
		var sinceId = params.since_id;

		if (sinceId > 0)
			result.messages = messages.slice(sinceId);
		else
			result.messages = messages;

		result.refresh_url = "/messages?since_id=" + (messages.length);
		result.count = result.messages.length;

		res.statusCode = 200;
		res.write(JSON.stringify(result));
	} 
	else 
	{
		result.count = 0;
		result.messages = [];
		result.refresh_url = "/messages";

		res.statusCode = 204;
		res.write(JSON.stringify(result));
	}

	res.end();
};


exports.newMessage = function(req, res) 
{
	req.on('data', function(chunk) 
	{
		var chunkStr = chunk.toString();
		if (!msgBuffer)
			msgBuffer = chunkStr;
		else
			msgBuffer += chunkStr;
	});

	req.on('end', function() 
	{
		if (msgBuffer) 
		{
			messages.push(msgBuffer);
			msgBuffer = null;
		}

		res.statusCode = 201;
		res.end();
	});
};