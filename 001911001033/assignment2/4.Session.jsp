<%@page import="java.util.*" %>
	<html><head><title>Cookies</title></head>
<body>
	<% int curr=0;
		String last=(String)session.getAttribute("last");
		if(last!=null)
		{
			String button=request.getParameter("buttontext");
			if(button!=null)
			{
			if(button.equals("next"))
				curr=Integer.parseInt(last)+1;
			else
				curr=Integer.parseInt(last)-1;
			}
		}
		session.setAttribute("last",String.valueOf(curr));
		out.println(curr);
	%>

	<form method="post">
		<input type="submit" name="buttontext" value="prev"/>
		<input type="submit" name="buttontext" value="next"/>
	</form>
</body>
</html>