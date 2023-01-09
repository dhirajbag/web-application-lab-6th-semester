<%@page import="java.sql.*"%>

<%! String db_url = "jdbc:mysql://localhost:3306/test";
    String db_user = "root";
    String db_password="12345";
%>

<%

String dept_id = request.getParameter("dept");
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(db_url, db_user, db_password);
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("select * from student where dept_id="+dept_id);
    StringBuilder str = new StringBuilder(
            "<html><head><title>Student Details</title></head><body><table><tr><th>ROLL</th><th>NAME</th><th>DEPT_ID</th></tr>");

    while (rs.next()) {
        str.append("<tr><td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3)
                    + "</td></tr>");
    }
    

    str.append("</table></body></html>");
    out.println(str);
    con.close();
} catch (Exception e) {
    out.println(e);
}



 %>