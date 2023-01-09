<%@page import="java.sql.*"%>

<%! String db_url = "jdbc:mysql://localhost:3306/test";
    String db_user = "root";
    String db_password="12345";
%>

<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(db_url, db_user, db_password);
		String user_id=request.getParameter("user_id");
		Statement stmt=con.createStatement();
		String query="select *from login where user_id='"+user_id+"'";
		ResultSet rs=stmt.executeQuery(query);
			if(rs.next())
				out.println("UserID already taken");
			else{
				out.println("UserID available");
		 }
	
}
	catch(Exception e){
	out.println(e);
	
	}
%>