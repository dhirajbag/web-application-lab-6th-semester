<%@ page import="java.sql.*, java.util.*"%>

<%! String db_url = "jdbc:mysql://localhost:3306/test";
    String db_user = "root";
    String db_password="12345";
%>

<%
  try{
    // load the Driver
    Class.forName("com.mysql.jdbc.Driver");
    // create a connection
    Connection con = DriverManager.getConnection(db_url, db_user, db_password);
    // make a statement object
    Statement st = con.createStatement();
    
    // get the request parameters
    String tableName = request.getParameter("component");
    String manufacturer = request.getParameter("manufacturer");
    String model = request.getParameter("model");
    
    ResultSet rs = st.executeQuery(
      "SELECT price from " + tableName 
      + " WHERE manufacturer = '" + manufacturer + "' and model = '" + model + "'");

    while(rs.next())
      out.println(rs.getInt("price"));
    
  }catch(Exception e){
    out.println(e);
  }
%>