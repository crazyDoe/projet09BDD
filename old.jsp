<%@ page import="java.sql.*" %>
<%@ page import="outils.*" %>
<%
  Class.forName("org.postgresql.Driver");
  Connection con = BDDTools.getConnect();
  Statement stmt = con.createStatement();
  String query = "SELECT nom FROM personne ORDER BY datenaiss  FETCH FIRST 3 ROWS ONLY;";
  ResultSet rs = stmt.executeQuery(query);
  while(rs.next())
  {
    out.println(rs.getString("nom"));
  }
  con.close();

%>
