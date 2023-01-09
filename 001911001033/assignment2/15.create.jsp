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
            String name=request.getParameter("name");
            String email=request.getParameter("email");
            String phone=request.getParameter("phone");
            
            Statement stmt=con.createStatement();
            String query="select * from userdata where user_id='"+user_id+"'";
            ResultSet rs=stmt.executeQuery(query);

            if(rs.next()){
                out.println("UserID already taken");
		}
		else{

                try{
                 query="insert into userdata values('"+user_id+"', '"+password+"', '"+ name+"','"+email+"','"+phone +"')";

                 stmt.executeUpdate(query);
                 out.println("User registered.<br/>");
                 out.println("You can now login. <a href=\"./15.loginpage.html\">Go To Login Page</a> ");
                }
                    catch(Exception e){
                    out.println(e);
                }
            
		}

		con.close();
	
    }
	catch(Exception e){
	    out.println(e);
	}
%>