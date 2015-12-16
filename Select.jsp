<%@ page import="java.sql.*" %>
<%@ page import="outils.*" %>
<!DOCTYPE html>
<html>
  <head>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <meta charset="utf-8">
    <title>Select</title>
  </head>
  <body>
    <%
    String table= request.getParameter("table");

    out.println("<!doctype html>");
    out.println("<head><title>Formulaire de Saisie </title></head><body><center> ");
    out.println("<link rel='stylesheet' type='text/css' href='"+request.getContextPath()+"/bootstrap/css/bootstrap.css'/>");
    Connection con = null;

    try {
      Class.forName("org.postgresql.Driver");
      con = BDDTools.getConnect();
      // Exécution de la requête:
      Statement stmt = con.createStatement();
      String requete = "SELECT * FROM "+table;
      ResultSet rs = stmt.executeQuery(requete);

      ResultSetMetaData rsmd = rs.getMetaData();
      int nbCols = rsmd.getColumnCount();
      out.println("<div id='wrapper'>");
      out.println("<div class='col-lg-2'>");
      out.println("</div>");
      out.print("<div class='col-offset-6 col-lg-8 centered'>");
      out.println("<h2 id='table'>"+table+"</h2>");
        out.println("<div class='row'>");
          out.println("<div class='panel-body'>");
          out.println("<div class='table-responsive'>");
            out.println("<table class='table table-striped table-bordered table-hover'>");
                out.println("<tr>");
                for(int i = 1; i <= nbCols; i++)
                {
                  out.println("<th>"+rsmd.getColumnName(i)+"</th>");
                }
                out.println("<th> Delete </th>");
                out.println("</tr>");
                while(rs.next())
                {
                  out.println("<tr id='"+rs.getString(rsmd.getColumnName(1))+"'>");
                  for(int i = 1; i <= nbCols; i++)
                  {
                    out.println("<td>"+rs.getString(rsmd.getColumnName(i))+"</td>");
                  }
                  out.println("<td> <a href=# class='delete' id="+rs.getString(rsmd.getColumnName(1))+"> Delete </a> </td>");
                  out.println("</tr>");
                }
            out.println("</table>");
            out.println("</div>");
            out.println("<h2> <a href=index.html> Home Page </a><BR></h2>");
            out.println("<h2><a href=myadmin.jsp> Home Admin </a></h2>");
            out.println("</div>");
            out.println("</div>");
        out.println("</div");
      out.println("</div>");



    } catch (Exception e) {
      out.println(e);
      e.printStackTrace();
    }
    finally{
      try {
        con.close();
      } catch (Exception e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
      }
    }
    %>
<script>
  $('.delete').on("click",function(){
    //console.log(this.id);
    //console.log($('#table').text());
    $.ajax({
             type: "GET",
             url: "delete.jsp?id="+this.id+"&table="+$('#table').text(),
             success: function()
             {

             }
           });
           $("tr").remove("#"+this.id);
    });
</script>
