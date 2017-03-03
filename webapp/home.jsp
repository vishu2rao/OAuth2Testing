<%@page import="com.eventm.oauth.GoogleOAuthHandler"%>
<%@page import="com.eventm.oauth.FacebookOAuthHandler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EventM OAuth Demo</title>
<style>
body {
	font-family: Sans-Serif;
	margin: 1em;
}

.oauthDemoGoogle a {
	display: block;
	border-style: solid;
	border-color: #bbb #888 #666 #aaa;
	border-width: 1px 2px 2px 1px;
	background: #ccc;
	color: #333;
	line-height: 2;
	text-align: center;
	text-decoration: none;
	font-weight: 900;
	width: 13em;
}

.oauthDemoGoogle pre {
	background: #ccc;
}

.oauthDemoGoogle a:active {
	border-color: #666 #aaa #bbb #888;
	border-width: 2px 1px 1px 2px;
	color: #000;
}

</style>
</head>
<body>
<p style="text-align: center;">
You have Authenticated Successfully using OAuth2 method in to EventO.
</p>

	
</body>
</html>
