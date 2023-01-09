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
		String password=request.getParameter("password");
		Statement stmt=con.createStatement();
		String query="select * from userdata where user_id ='"+user_id+"'";
		ResultSet rs=stmt.executeQuery(query);
		if(!rs.next()){
		out.println("Invalid UserID");
		}
		else{
			if(password != ""){
				try{
					if(rs.getString("password").equals(password))
						out.println("You are logged in!");
					else
						out.println("Wrong password.");
				}
				catch(Exception e){
					out.println(e);
				}
			}
			else{
				out.println("Password cannot be empty.");
			}
		}

		con.close();
	
	}
	catch(Exception e){
		out.println(e);
	}
%>