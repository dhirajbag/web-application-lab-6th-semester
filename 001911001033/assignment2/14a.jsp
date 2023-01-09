<%@page import="java.sql.*"%>

<%! String db_url = "jdbc:mysql://localhost:3306/test";
    String db_user = "root";
    String db_password="12345";
%>

<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(db_url, db_user, db_password);
		String semester=request.getParameter("sem");
		Statement stmt=con.createStatement();
		String query="select id, name from subjects where semester='"+semester+"'";
		ResultSet rs=stmt.executeQuery(query);
		StringBuilder s=new StringBuilder("");
			while(rs.next()){
			s.append("<option value='"+rs.getString(1)+"'>"+rs.getString(2)+"</option>");
		}
		out.println(s);
	
}
	catch(Exception e){
	out.println(e);
	
	}
%>

