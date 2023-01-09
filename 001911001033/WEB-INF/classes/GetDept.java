import java.io.*;
import java.lang.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class GetDept extends HttpServlet{
		
		public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException,ServletException{
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/test","root","12345");
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("select id, name from department");
			StringBuilder s=new StringBuilder("");
			while(rs.next()){
			s.append("<option value='"+rs.getString(1)+"'>"+rs.getString(2)+"</option>");
		}
		out.println(s);
		con.close();
			}
			catch(Exception e){
			out.println(e);}
				
				
				out.close();
		}
}