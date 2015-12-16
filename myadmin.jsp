<%@ page import="java.sql.*" %>
<%@ page import="outils.*" %>
<head>
  <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
  <meta charset="utf-8">
  <title>Index</title>
</head>
<body>
  <h1> Liste des tables </h1>

  <%
   Class.forName("org.postgresql.Driver");
    Connection con = BDDTools.getConnect();
    Statement stmt = con.createStatement();
    String query = "SELECT tablename FROM pg_catalog.pg_tables where tableowner = 'leo';";
    ResultSet rs = stmt.executeQuery(query);
    out.println("<ul>");
    while(rs.next())
    {
      out.println("<li> <a href='Select.jsp?table="+rs.getString("tablename")+"'>"+rs.getString("tablename")+"</a> </li>");
    }
    out.println("</ul>");
  %>
</body>
