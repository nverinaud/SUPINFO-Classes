var path = require('path'); // http://nodejs.org/api/path.html

exports.mimeTypeOfFileAtPath = function (filePath) {
	var ext = path.extname(filePath).slice(1); // Get the extension like '.css' and remove the first .
	var mimeType = "text/plain";

	if (ext === "css")
		mimeType = "text/css";
	else if (ext === "js")
		mimeType = "application/javascript";
	else if (ext === "html" || ext === "htm" || ext === "xhtml")
		mimeType = "text/html";

	return mimeType;
};