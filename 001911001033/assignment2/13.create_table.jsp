<%@ page import="java.sql.*, java.util.*"%>
<%! String db_url = "jdbc:mysql://localhost:3306/test";
    String db_user = "root";
    String db_password="12345";
%>

<%!
  private String build(){
    try{
      // load the Driver
      Class.forName("com.mysql.jdbc.Driver");
      // create a connection
      Connection con = DriverManager.getConnection(db_url, db_user, db_password);
      // make a statement object
      Statement st = con.createStatement();

      String query = "CREATE TABLE HDD("
                    + "manufacturer VARCHAR(50) NOT NULL,"
                    + "price INT(4) NOT NULL,"
                    + "model VARCHAR(20) NOT NULL,"
                    + "PRIMARY KEY(manufacturer, model)"
                    + ")";
      st.executeUpdate(query);

      query = "CREATE TABLE MBOARD("
                    + "manufacturer VARCHAR(50) NOT NULL,"
                    + "price INT(4) NOT NULL,"
                    + "model VARCHAR(20) NOT NULL,"
                    + "PRIMARY KEY(manufacturer, model)"
                    + ")";
      st.executeUpdate(query);

      query = "CREATE TABLE RAM("
                    + "manufacturer VARCHAR(50) NOT NULL,"
                    + "price INT(4) NOT NULL,"
                    + "model VARCHAR(20) NOT NULL,"
                    + "PRIMARY KEY(manufacturer, model)"
                    + ")";
      st.executeUpdate(query);

      query = "CREATE TABLE MONITOR("
                    + "manufacturer VARCHAR(50) NOT NULL,"
                    + "price INT(4) NOT NULL,"
                    + "model VARCHAR(20) NOT NULL,"
                    + "PRIMARY KEY(manufacturer, model)"
                    + ")";
      st.executeUpdate(query);

      con.close();
      return "SUCCESSFULLY CREATED!";
    }catch(Exception e){
      return "Failure!";
    }
  }

  private String populateData(){
    try{
      // load the Driver
      Class.forName("com.mysql.jdbc.Driver");
      // create a connection
      Connection con = DriverManager.getConnection(db_url, db_user, db_password);
      // make a statement object
      PreparedStatement insertHDD = con.prepareStatement(
        "INSERT INTO HDD VALUES(?, ?, ?)");

      PreparedStatement insertMONITOR = con.prepareStatement(
        "INSERT INTO MONITOR VALUES(?, ?, ?)");

      PreparedStatement insertRAM = con.prepareStatement(
        "INSERT INTO RAM VALUES(?, ?, ?)");
      
      PreparedStatement insertMBOARD = con.prepareStatement(
        "INSERT INTO MBOARD VALUES(?, ?, ?)");

      String[] makers = {"SAMSUNG", "HP", "DIGISOL", "DELL"};
      String[] models = {"M-1", "M-2", "M-3", "M-4"};

      for(int j = 0; j < makers.length; j++){
        for(int i = 0; i < models.length; i++){
          insertHDD.setString(1, makers[j]);
          insertHDD.setInt(2, new Random().nextInt(5000)+1);
          insertHDD.setString(3, models[i]);
          insertHDD.executeUpdate();

          insertMONITOR.setString(1, makers[j]);
          insertMONITOR.setInt(2, new Random().nextInt(5000)+1);
          insertMONITOR.setString(3, models[i]);
          insertMONITOR.executeUpdate();

          insertRAM.setString(1, makers[j]);
          insertRAM.setInt(2, new Random().nextInt(5000)+1);
          insertRAM.setString(3, models[i]);
          insertRAM.executeUpdate();

          insertMBOARD.setString(1, makers[j]);
          insertMBOARD.setInt(2, new Random().nextInt(5000)+1);
          insertMBOARD.setString(3, models[i]);
          insertMBOARD.executeUpdate();
        }
      }

      con.close();
      return "SUCCESSFULLY INSERTED!";
    }catch(Exception e){
      return "Failure!";
    }
  }
%>

<%
  out.println(build());
  out.println(populateData());
%>