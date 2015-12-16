<%@ page import="java.sql.*" %>
<%@ page import="outils.*" %>
<%
 Class.forName("org.postgresql.Driver");
  Connection con = BDDTools.getConnect();
  Statement stmt = con.createStatement();
  String query = "select * FROM personne WHERE id ="+request.getParameter("id")+";";
  ResultSet rs = stmt.executeQuery(query);
  rs.next();
%>
<?xml version = "1.0" encoding="UTF-8" standalone="yes" ?>
<personne>
  <id><%= rs.getInt("id") %> </id>
  <login><%= rs.getString("login") %></login>
  <nom><%= rs.getString("nom") %></nom>
  <prenom><%= rs.getString("prenom")%></prenom>
  <dateN><%= rs.getString("datenaiss")%></dateN>
</personne>
