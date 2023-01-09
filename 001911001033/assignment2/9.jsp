<%@ page import="java.sql.*, java.util.*" %>

<%! String db_url = "jdbc:mysql://localhost:3306/test";
    String db_user = "root";
    String db_password="12345";
%>

<%!
  private String build(){
    try{
      // load and register the Driver
      Class.forName("com.mysql.jdbc.Driver");
      // make a connection
      Connection con = DriverManager.getConnection(db_url, db_user, db_password);
      // make a statement object
      Statement st = con.createStatement();

      String query = "CREATE TABLE questions("
                     + "question_no VARCHAR(20) PRIMARY KEY,"
                     + "question VARCHAR(200)"
                     + ")";
      st.executeUpdate(query);

      query = "CREATE TABLE options("
              + "option_no INT(2) NOT NULL,"
              + "option_val VARCHAR(120) NOT NULL,"
              + "question_no VARCHAR(20) NOT NULL,"
              + "iscorrect INT(1) NOT NULL,"
              + "PRIMARY KEY (option_no, question_no),"
              + "FOREIGN KEY (question_no) REFERENCES questions(question_no)"
              + ")";
      st.executeUpdate(query);

      con.close();
      return "success";
    }catch(Exception e){
      return "failure";
    }
  }

  private void insertSampleData(){
    try{
      // load and register the Driver
      Class.forName("com.mysql.jdbc.Driver");
      // make a connection
      Connection con = DriverManager.getConnection(db_url, db_user, db_password);
      // make a statement object
      String insertOptions = "INSERT INTO options VALUES(?, ?, ?, ?)";
      PreparedStatement insertOpt = con.prepareStatement(insertOptions);

      String insertQuestion = "INSERT INTO questions VALUES(?, ?)";
      PreparedStatement insertQst = con.prepareStatement(insertQuestion);

      insertQst.setString(1, "q1");
      insertQst.setString(2, "What is the full form of JDBC?");
      insertQst.executeUpdate();

      insertOpt.setInt(1, 1);
      insertOpt.setString(2, "JAVA DATABASE COMMITMENT");
      insertOpt.setString(3, "q1");
      insertOpt.setInt(4, 0);
      insertOpt.executeUpdate();

      insertOpt.setInt(1, 2);
      insertOpt.setString(2, "JAVA DATABASE CONNECTIVITY");
      insertOpt.setString(3, "q1");
      insertOpt.setInt(4, 1);
      insertOpt.executeUpdate();

      insertOpt.setInt(1, 3);
      insertOpt.setString(2, "JAVA DATAMINE CONNECTION");
      insertOpt.setString(3, "q1");
      insertOpt.setInt(4, 0);
      insertOpt.executeUpdate();


      insertQst.setString(1, "q2");
      insertQst.setString(2, "What is the full form of HTML?");
      insertQst.executeUpdate();

      insertOpt.setInt(1, 1);
      insertOpt.setString(2, "HYPER TEXT MARKUP LANGUAGE");
      insertOpt.setString(3, "q2");
      insertOpt.setInt(4, 1);
      insertOpt.executeUpdate();

      insertOpt.setInt(1, 2);
      insertOpt.setString(2, "HYPER TEXT MACHINE LANGUAGE");
      insertOpt.setString(3, "q2");
      insertOpt.setInt(4, 0);
      insertOpt.executeUpdate();

      insertOpt.setInt(1, 3);
      insertOpt.setString(2, "HYPER TEST MARKUP LANGUAGE");
      insertOpt.setString(3, "q2");
      insertOpt.setInt(4, 0);
      insertOpt.executeUpdate();
      
    }catch(Exception e){

    }
  }
%>

<form method="POST" action="9.result.jsp">

  <%
  try{
      // out.println(build());
      // insertSampleData();

      // load and register the Driver
      Class.forName("com.mysql.jdbc.Driver");
      // make a connection
      Connection con = DriverManager.getConnection(db_url, db_user, db_password);
      // make a statement object
      String optionsQuery = "SELECT option_val, option_no from options where question_no=?";
      PreparedStatement opt = con.prepareStatement(optionsQuery);

      Statement st = con.createStatement();

      ResultSet rs = st.executeQuery("SELECT * from questions");
      while(rs.next()){
        String q_no = rs.getString("question_no");
        String qst  = rs.getString("question");

        out.println("<b>" + q_no + ".&nbsp;</b>");
        out.println("<i>" + qst + "</i><br><br>");
        
        opt.setString(1, q_no);
        ResultSet options = opt.executeQuery();

        while(options.next())
          out.println(
            "<input type=\"radio\" name=\"" + q_no + "\"value=\""
             + options.getString("option_no") + "\">" + options.getString("option_val") + "<br>");
        
        out.println("<br><hr>");
      }
      con.close();
    }catch(Exception e){
      out.println(e);
    }
  %>

  <button type="submit">submit</button>

</form>