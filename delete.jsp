<%@ page import="java.sql.*" %>
<%@ page import="outils.*" %>
<%
  Connection con = BDDTools.getConnect();
  Statement stmt = con.createStatement();
  String select = "SELECT * FROM "+request.getParameter("table")+";";
  ResultSet rs = stmt.executeQuery(select);
  ResultSetMetaData rsmd = rs.getMetaData();
  String query = "DELETE FROM "+request.getParameter("table")+" WHERE "+rsmd.getColumnName(1)+" = "+request.getParameter("id")+";";
  out.println(query);
  stmt.executeUpdate(query);
  con.close();
%>
