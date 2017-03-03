Here is the code to achieve OAuth2 with Google and Facebook as a separate java classes and jsp clients.
I have done so because its easy to integrate with your main eventm AuthServer and DB update.

Before integration we have to secure client specific creds from any oauth provides which I have documented and attached with this email.
I coded by adding many comments so that it is easy understandable any one trying to integrate. However I have not handled any success/fails because any ways your authserver will do the same.

Please note this is kind of POC program may need to handle failures.

I did it as a webservices instead of REST because it has many re-directions by the browser ,In handling those re-directions in REST will be difficult.

I have created respective entry points for auth validation and common exit points as below.

1.       Gmail :- http://localhost:8080/OAuth2Testing/gmail.jsp

2.       FB:- http://localhost:8080/OAuth2Testing/fb.jsp

If authentication success redirected to http://localhost:8080/OAuth2Testing/index.jsp
