<%@ page import="java.sql.*" %>
<%
 Class.forName("org.postgresql.Driver");
  String url = "jdbc:postgresql://sqlserv/da2i";
  String nom = "vuylstel";
  String mdp = "moi";
  Connection con = DriverManager.getConnection(url,nom,mdp);
  Statement stmt = con.createStatement();
  String query = "SELECT nom FROM personne ORDER BY datenaiss DESC  FETCH FIRST 3 ROWS ONLY;";
  ResultSet rs = stmt.executeQuery(query);
  while(rs.next())
  {
    out.println(rs.getString("nom"));
  }
  con.close();

%>
