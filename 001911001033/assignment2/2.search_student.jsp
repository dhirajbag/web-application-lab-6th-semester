<%@page import="java.sql.*"%>

<%! String db_url = "jdbc:mysql://localhost:3306/test";
    String db_user = "root";
    String db_password="12345";
%>

<%
String s = request.getParameter("substring");
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(db_url, db_user, db_password);
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("select * from student");
    StringBuilder str = new StringBuilder(
            "<html><head><title>Student Details</title></head><body><table><tr><th>Roll</th><th>Name</th><th>Dept_Id</th></tr>");

    while (rs.next()) {
        String name = rs.getString(2);

        if (name.contains(s))
            str.append("<tr><td>" + rs.getString(1) + "</td><td>" + name + "</td><td>" + rs.getString(3)
                    + "</td></tr>");
    }
    

    str.append("</table></body></html>");
    out.println(str);
    con.close();
} catch (Exception e) {
    out.println(e);
}



 %>