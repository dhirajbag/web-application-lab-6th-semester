<%@page import="java.util.*" %>
<html>
<head>
<title>Cookies</title>
</head>
<body>
	<%  int cur=0;
		Cookie cookie=null;
		Cookie[] cookies=request.getCookies();
		if(cookies!=null)
		{
			for(int i=0;i<cookies.length;i++)
			{
				if(cookies[i].getName().equals("counter"))
					cookie=cookies[i];
			}
		}
		if(cookie!=null)
		{
			String button=request.getParameter("buttontext");
			if(button!=null)
			{
				if(button.equals("next"))
					cur=Integer.parseInt(cookie.getValue())+1;
				else
					cur=Integer.parseInt(cookie.getValue())-1;
			}
		}
		response.addCookie(new Cookie("counter",String.valueOf(cur)));
		out.println(cur);
	%>
	
	<form method="post">
		<input type="submit" name="buttontext" value="prev"/>
		<input type="submit" name="buttontext" value="next"/>
	</form>
</body>
</html>