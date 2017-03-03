package com.eventm.oauth;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable; 
import org.springframework.web.bind.annotation.RequestBody; 
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestMethod; 
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController; 



@RestController

public class AuthServices {
	private Logger LOG = Logger.getLogger(AuthServices.class
			.getCanonicalName());
	public static final String FB_APP_ID = "551444695027775";
	public static final String FB_APP_SECRET = "cb0b0d9e4efb3decaa6ece2436659d7e";
	public static final String REDIRECT_URI = "http://localhost:8080/OAuth2v1/";
	
	
	private static final String GOOGLE_CLIENT_ID = "834163613682-i1js01s7l1rq03r0ck3afoe6sv9meumr.apps.googleusercontent.com";
	/**
	 * Please provide a value for the CLIENT_SECRET constant before proceeding, set this up at https://code.google.com/apis/console/
	 */
	private static final String GOOGLE_CLIENT_SECRET = "4RIdTezaLZRwKoI5Twb57Pjs";

	/**
	 * Callback URI that google will redirect to after successful authentication
	 */
	private static final String GOOGLE_CALLBACK_URI = "http://localhost:8080/OAuth2v1/home.jsp";
	public AuthServices() {
		// TODO Auto-generated constructor stub
	}
	@RequestMapping(value = "/authservice/{providerId}", method = RequestMethod.GET, headers = "Accept=application/json")
	public String authenticate(HttpServletRequest request) {
		//LOG.info("Read request of ReadRequestController has been called.");
		String returnStatus=null;
			
		System.out.println();		
		System.out.println("Read request of confirm status has been served !!!");
		System.out.println("pathinfo of URL is :"+request.getPathInfo());		
		String providerId=null;
		
		//Beware that i am assuming only /txnid/servid in the path if you want expiry time then
		//you need to handle another tuple accordingly
		String[] uris=request.getPathInfo().split("/");		
		providerId=uris[uris.length-1];
		
		System.out.println("Your provider Id is "+providerId);
		if(providerId.equalsIgnoreCase("facebook"))
		{
			FacebookOAuthHandler fhandler =new FacebookOAuthHandler();
			returnStatus=fhandler.getFBAuthUrl();
			
		}
		else
		{
			GoogleOAuthHandler ghandler =new GoogleOAuthHandler();
			ghandler.buildLoginUrl();
			returnStatus="Token is :"+ghandler.getStateToken();
		}
				
		return "Authentication done with status "+returnStatus;
	}
}
