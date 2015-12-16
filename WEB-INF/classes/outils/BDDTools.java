package outils;

import java.sql.*;
import java.io.IOException;

public class BDDTools{
  private static String url= "jdbc:postgresql://localhost/da2i";
  private static String nom =  "leo";
  private static String mdp ="lapin";
  private static Connection con =null;

  public static Connection getConnect()
  {
    try{
      Class.forName("org.postgresql.Driver");
      con = DriverManager.getConnection(url,nom,mdp);
      return con;
    }
    catch (Exception e)
    {
      e.printStackTrace();
      return null;
    }
  }
}
