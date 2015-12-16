<%@ page import="java.sql.*" %>
<%@ page import="outils.*" %>
<%
  Class.forName("org.postgresql.Driver");
  String url = "jdbc:postgresql://sqlserv/da2i";
  String nom = "vuylstel";
  String mdp = "moi";
  Connection con = DriverManager.getConnection(url,nom,mdp);
  Statement stmt = con.createStatement();
  String query = "select count(*) as cpt from personne";
  ResultSet rs = stmt.executeQuery(query);
  rs.next();
  out.println("La table contient "+rs.getString("cpt")+" personnes !");
  con.close();
%>
