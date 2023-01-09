import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class GetStudent extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String dept_id = request.getParameter("dept_id");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","12345");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select name from student where dept_id ='" + dept_id + "';");
			StringBuilder s = new StringBuilder("<html><head><title>Student Name</title></head><body>");
			while (rs.next()) {
				s.append("<p>" + rs.getString(1) + "</p>");
			}
			s.append("</body></html>");
			out.println(s);
			con.close();
		} catch (Exception e) {
			out.println(e);
		}

		out.close();
	}
}