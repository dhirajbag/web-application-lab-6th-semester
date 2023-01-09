<%@page import="java.sql.*"%>

<%! String db_url = "jdbc:mysql://172.16.4.50:3306/test";
    String db_user = "be1933";
    String db_password="ZoNLIAeD";
%>

<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(db_url, db_user, db_password);
		String user_id=request.getParameter("user_id");
		String password=request.getParameter("password");
		Statement stmt=con.createStatement();
		String query="select * from login_33 where id ='"+user_id+"'";
		ResultSet rs=stmt.executeQuery(query);
		if(!rs.next()){
		    out.println("Invalid UserID: User ID not registered.");
		}
		else{
			if(password != ""){
				try{
					if(rs.getString("pwd").equals(password))
						out.println("Verified! You are successfully logged in.");
					else
						out.println("Wrong password.");
				}
				catch(Exception e){
					out.println(e);
				}
			}
			else{
				out.println("Received password is empty !");
			}
		}

		con.close();
	
	}
	catch(Exception e){
		out.println(e);
	}
%>