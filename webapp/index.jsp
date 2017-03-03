<%@page import="com.eventm.oauth.GoogleOAuthHandler"%>
<%@page import="com.eventm.oauth.FacebookOAuthHandler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.eventm.oauth.FacebookOAuthHandler"%>
<%@page import="com.eventm.oauth.FBlist"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
FacebookOAuthHandler fbCon = new FacebookOAuthHandler();

%>
<html>
    <head>
        <title>Eventm Logins</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        
        <div class="buttonContainer">
           
            
           
            
		<div class="eachSocialMediaButton" >
		<a class="facebookBg" href="<%=fbCon.getFBAuthUrl()%>">
		<span class="facebookIcon"></span>
                    <span class="buttonText">SignIn with Facebook</span>
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
       
       // out.println(graph);

				out.println("</pre>");
		%>		
        
	</div>
			
			
            <div class="oauthDemoGoogle">
               
			<%
			/*
			 * The GoogleAuthHelper handles all the heavy lifting, and contains all "secrets"
			 * required for constructing a google login url.
			 */
			final GoogleOAuthHandler ghelper = new GoogleOAuthHandler();
			
			if (request.getParameter("code") == null
					|| request.getParameter("state") == null) {

				/*
				 * initial visit to the page
				 */
				out.println("<a href='" + ghelper.buildLoginUrl()
						+ "'><span class='googleIcon'></span><span class='buttonText'>SignIn with Google</span></a>");								
				
						
				/*
				 * set the secure state token in session to be able to track what we sent to google
				 */
				session.setAttribute("state", ghelper.getStateToken());

			} else if (request.getParameter("code") != null && request.getParameter("state") != null
					&& request.getParameter("state").equals(session.getAttribute("state"))) {

				session.removeAttribute("state");

				out.println("<pre>");
				/*
				 * Executes after google redirects to the callback url.
				 * Please note that the state request parameter is for convenience to differentiate
				 * between authentication methods (ex. facebook oauth, google oauth, twitter, in-house).
				 * 
				 * GoogleAuthHelper()#getUserInfoJson(String) method returns a String containing
				 * the json representation of the authenticated user's information. 
				 * At this point you should parse and persist the info.
				 */

				out.println(ghelper.getUserInfoJson(request.getParameter("code")));

				out.println("</pre>");
			}
		%>
            </div>
			
			
			<div class="createNewAccountDiv">
            <a href="local.jsp">or SignIn/create a new account locally </a>
            </div>
			
        </div>
        
       
        
    </body>
</html>
