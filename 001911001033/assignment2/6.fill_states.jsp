<%@page import="java.sql.*"%>

<%! String db_url = "jdbc:mysql://localhost:3306/test";
    String db_user = "root";
    String db_password="12345";
%>

<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(db_url, db_user, db_password);
		
		Statement stmt=con.createStatement();
		String query="select state_id, state_title from state";
		ResultSet rs=stmt.executeQuery(query);

        out.println("<option>Select State</option>");
		while(rs.next()){
            out.println("<option value=\""+rs.getString(1)+"\">"+ rs.getString(2)+"</option>");
		 }
	
    }
	catch(Exception e){
	    out.println(e);
	}
%>