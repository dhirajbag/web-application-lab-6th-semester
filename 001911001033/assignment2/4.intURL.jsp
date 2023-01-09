<%@page import="java.util.*" %>
<html>
<head><title>Passing Parameter</title></head>
<body>
	<%
	int last=0;
	String param=request.getParameter("val");
	if(param!=null)
	last=Integer.parseInt(param);
	out.println(last);
	%>
<a href="./4.intURL.jsp?val=<%=last-1 %>">prev</a>
<a href="./4.intURL.jsp?val=<%=last+1 %>">next</a>
</body>
</html>