<%@page import="java.sql.*"%>

<%! String db_url = "jdbc:mysql://localhost:3306/test";
    String db_user = "root";
    String db_password="12345";
%>

<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("db_url, db_user, db_password);
		String semester=request.getParameter("sem");
		String roll=request.getParameter("roll");
		String subject=request.getParameter("subject");
		Statement stmt=con.createStatement();

		String query="select marks from marks where roll="+roll+" and roll="+roll+" AND sub_id='"+subject+"';";
		ResultSet rs=stmt.executeQuery(query);
		if(rs.next())
		 out.println("Marks: "+rs.getInt("marks"));
		else
		 out.println("Marks for the selected (roll, subject) combination doesn't exist.");
	}	
	catch(Exception e){
		out.println(e);
	}
%>

