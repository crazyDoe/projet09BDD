// Servlet Test.java  de test de la configuration
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import outils.*;

@WebServlet("/servlet/exercice3")
public class exercice3 extends HttpServlet
{
  public void service( HttpServletRequest req, HttpServletResponse res )
       throws ServletException, IOException
  {
    PrintWriter out = res.getWriter();
    res.setContentType( "text/xml" );
    Connection con = null;

   try {
      con = BDDTools.getConnect();
     // Exécution de la requête:
     Statement stmt = con.createStatement();
			String query ="select * FROM personne where id = "+req.getParameter("id")+";";
			ResultSet rs = stmt.executeQuery(query);

			while(rs.next()){

				int id = rs.getInt("id");
				String login = rs.getString("login");
				String nom = rs.getString("nom");
				String prenom = rs.getString("prenom");
				String date = rs.getString("datenaiss");

				out.println("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>");
				out.println("<personne>");
					out.println("<id>"+id+"</id>");
					out.println("<login>"+login+"</login>");
					out.println("<nom>"+nom+"</nom>");
					out.println("<prenom>"+prenom+"</prenom>");
					out.println("<datenaiss>"+date+"</datenaiss>");
				out.println("</personne>");

			}



		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		}

  }
