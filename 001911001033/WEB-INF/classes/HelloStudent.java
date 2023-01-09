import java.io.*;
import java.lang.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class HelloStudent extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String s = request.getParameter("substring");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "12345");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from student");
			StringBuilder str = new StringBuilder(
					"<html><head><title>Student Details</title></head><body><table><tr><th>ROLL</th><th>NAME</th><th>DEPT_ID</th></tr>");

			while (rs.next()) {
				if (rs.getString(2).contains(s))
					str.append("<tr><td>" + rs.getInt(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3)
							+ "</td></tr>");
			}
			// out.println(rs.getInt(1)+" "+rs.getString(2)+" "+rs.getString(3)+"
			// "+rs.getInt(4) );
			str.append("</table></body></html>");
			out.println(str);
			con.close();
		} catch (Exception e) {
			out.println(e);
		}

		out.close();
	}
}