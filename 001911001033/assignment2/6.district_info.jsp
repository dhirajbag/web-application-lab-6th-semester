<%@page import="java.sql.*"%>

<%! String db_url = "jdbc:mysql://localhost:3306/test";
    String db_user = "root";
    String db_password="12345";
%>

<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(db_url, db_user, db_password);
		String district_id = request.getParameter("district_id");

		Statement stmt=con.createStatement();
		String query="select name from city where districtid = "+district_id+" limit 20";
		ResultSet rs=stmt.executeQuery(query);

        out.println("<p> Some cities in this district are (upto 20 districts shown): <br>");
		while(rs.next()){
            out.println(rs.getString(1)+"<br>");
		 }
        out.println("</p>");
	
    }
	catch(Exception e){
	    out.println(e);
	}
%>