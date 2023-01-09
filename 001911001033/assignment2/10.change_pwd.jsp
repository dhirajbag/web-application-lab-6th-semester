<%@page import="java.sql.*"%>

<%! String db_url = "jdbc:mysql://172.16.4.50:3306/test";
    String db_user = "be1933";
    String db_password="ZoNLIAeD";
%>

<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("db_url, db_user, db_password);
		String user_id=request.getParameter("user_id");
		String old="";
		String new1="";
		String new2="";
		old=request.getParameter("old");
		new1=request.getParameter("new1");
		new2=request.getParameter("new2");
		Statement stmt=con.createStatement();
		String query="select (username, password) from login where username ='"+user_id+"'";
		ResultSet rs=stmt.executeQuery(query);
		if(!rs.next()){
		out.println("Invalid UserID");
		}
		else{
			if(old!=""){
			try{
			 if(rs.getString("password").equals(old)){
					if(new1!=""){
						if(new1.equals(new2)){
						query="update login set password='"+ new1 +"' where username ='"+ user_id +"';";
						stmt.executeUpdate(query);
							out.println("password changed");
						}
						else
							out.println("Password should be same in the last 2 fields");
					} 
					else{
						out.println("Password cannot be empty");
				}
			}
			
			else
				out.println("Incorrect password entered");
		}
		catch(Exception e){
		out.println(e);
	}
		}
		else{
		
	}
		}
		con.close();
	
}
	catch(Exception e){
	out.println(e);
	
	}
%>