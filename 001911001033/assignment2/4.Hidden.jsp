<%@page import="java.util.*" %>
<html>
	<head><title>Hidden Form Field</title></head>
	<body>
		<%
		int current=0;
		String value=request.getParameter("int");
		String button=request.getParameter("buttontext");
		
		if(button!=null)
		{
			if(button.equals("next"))
				current=Integer.parseInt(value)+1;
			else
				current=Integer.parseInt(value)-1;
		}
		out.println(current);
		%>
	
		<form method="post" >
			<input type="hidden" name="int" value="<%=current%>" />
			<input type="submit" name="buttontext" value="prev"/>
			<input type="submit" name="buttontext" value="next"/>
		</form>
	
	</body>
</html>