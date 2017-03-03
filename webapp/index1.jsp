<%@page import="com.eventm.oauth.FacebookOAuthHandler"%>
<%@page import="com.eventm.oauth.FBlist"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
FacebookOAuthHandler fbCon = new FacebookOAuthHandler();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Java Facebook Login</title>
</head>
<body style="text-align: center; margin: 0 auto;">
	<div
		style="margin: 0 auto; background-image: url(./img/fbloginbckgrnd.jpg); height: 360px; width: 610px;">
		<a href="<%=fbCon.getFBAuthUrl()%>"> <img
			style="margin-top: 138px;" src="./img/facebookloginbutton.png" />
		</a>
		<%
		HttpSession httpSession = request.getSession();
        String code = request.getParameter("code");       
        
       
		String state = request.getParameter("state");
       /// String accessToken = fbCon.getAccessToken(code);
        
        String sessionID = httpSession.getId();
        
        //FBlist fblist = new FBlist(accessToken);
		//String graph = fblist.getFBGraph();
        out.println("<pre>");
        out.println(state);
		 out.println(code);
       // out.println(graph);

				out.println("</pre>");
		%>		
        
	</div>
</body>
</html>