<%@ page import="java.sql.*" %>

<%! String db_url = "jdbc:mysql://localhost:3306/test";
    String db_user = "root";
    String db_password="12345";
%>

<%
  int score = 0;

  try{
    // load and register the Driver
    Class.forName("com.mysql.jdbc.Driver");
    // make a connection
    Connection con = DriverManager.getConnection(db_url, db_user, db_password);
    // make a statement object
    String query = "SELECT iscorrect from options where question_no=? and option_no=?";
    PreparedStatement ps = con.prepareStatement(query);

    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT question_no from questions");

    while(rs.next()){
      String currentOptionSelected = request.getParameter(rs.getString("question_no"));

      ps.setString(1, rs.getString("question_no"));
      ps.setInt(2, Integer.parseInt(currentOptionSelected));
      ResultSet result = ps.executeQuery();

      while(result.next())
        if(result.getInt("iscorrect") == 1) score++;
    }
  }catch(Exception e){
    out.println(e);
  }
%>

<div style="display: flex; flex-direction: column">
  <p style="color: blue; margin: auto"> Thanks for taking the test! </p><br>
  <p style="color: green; margin: auto;">Your score is <b> <%=score%> </b> </p>
</div>