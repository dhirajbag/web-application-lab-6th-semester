<%@page import="java.sql.*"%>

<%! String db_url = "jdbc:mysql://localhost:3306/test";
    String db_user = "root";
    String db_password="12345";
%>

<%
	try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(db_url, db_user, db_password);
            String name=request.getParameter("user_name");
            String user_id=request.getParameter("user_id");
            String password=request.getParameter("password");
            Statement stmt=con.createStatement();
            String query="select * from login where user_id='"+user_id+"'";
            ResultSet rs=stmt.executeQuery(query);

            if(rs.next()){
                out.println("UserID already taken");
		}
		else{
            if(password =="" || name ==""){
                out.println("Password or Username cannot be empty.");
            }
			else{
                try{
                 query="insert into login values('"+user_id+"', '"+password+"', '"+ name +"')";

                 stmt.executeUpdate(query);
                 out.println("User registered");
                }
                    catch(Exception e){
                    out.println(e);
                }
		    }
            
		}

		con.close();
	
    }
	catch(Exception e){
	    out.println(e);
	}
%>