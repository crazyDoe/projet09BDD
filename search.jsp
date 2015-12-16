<%@ page import="java.sql.*" %>
<%@ page import="outils.*" %>
<%
 Class.forName("org.postgresql.Driver");
  Connection con = BDDTools.getConnect();
  Statement stmt = con.createStatement();
  String query = "select nom FROM personne WHERE nom LIKE '"+request.getParameter("name")+"%';";
  ResultSet rs = stmt.executeQuery(query);
  while(rs.next())
  {
    out.println(rs.getString("nom"));
  }
  con.close();

%>
