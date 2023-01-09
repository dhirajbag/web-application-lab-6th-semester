<%@page import="java.sql.*"%>

<%! String db_url = "jdbc:mysql://localhost:3306/test";
    String db_user = "root";
    String db_password="12345";
%>

<%

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(db_url, db_user, db_password);
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("select id, name from department");
    StringBuilder str = new StringBuilder();

    while (rs.next()) {
        str.append("<option value='"+rs.getString(1)+"'>"+rs.getString(2)+"</option>");
    }
    
    out.println(str);
    con.close();
} catch (Exception e) {
    out.println(e);
}



 %>