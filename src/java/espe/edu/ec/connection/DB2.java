/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package espe.edu.ec.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.SQLException;

/**
 *
 * @author david
 */
public class DB2 {
    private Connection connection=null;
    private static DB2 Instancia;
    private String server;
    private String port;
    private String database;
    private String user;
    private String password;
    private Vendor vendor;
    public static DB2 getInstancia()
    {
        if(Instancia==null)
        {
            Instancia = new DB2();
        }
        return Instancia;
    }
      public enum Vendor
    {
        ORACLE,
        POSTGRES,
        MYSQL
    }
    public Connection getConnection() throws Exception
    {
             
       try{
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            //DataSource dsd = (DataSource) envContext.lookup("jdbc/PROD");
            DataSource dsd = (DataSource) envContext.lookup("jdbc/UTIC");
            connection = dsd.getConnection();     
        }catch (NamingException | SQLException ex) {
            System.err.println(ex);
        }
        return connection;
    }
    
    public void closeConexion() throws Exception 
    {
       connection.close();
    }
    
    public Connection getConnectionPAS8() throws Exception
    {
             
       try{
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            DataSource dsd = (DataSource) envContext.lookup("jdbc/UTIC");
            connection = dsd.getConnection();     
        }catch (NamingException | SQLException ex) {
            System.err.println(ex);
        }
        return connection;
    }
    
    public void closeConexionPAS8() throws Exception 
    {
       connection.close();
    }
    
    public Connection getConnectionWF() throws Exception
    {
      /*  Class.forName("oracle.jdbc.driver.OracleDriver");
        connection=(Connection)DriverManager.getConnection("jdbc:oracle:thin:@"+server+':'+port+':'+database, user, password);
        return connection;*/
       
       try{
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            DataSource dsd = (DataSource) envContext.lookup("jdbc/UTIC");
            connection = dsd.getConnection();     
        }catch (NamingException | SQLException ex) {
            System.err.println(ex);
        }
        return connection;
    }
    
    public void closeConexionWF() throws Exception 
    {
       connection.close();
    }

    public String getServer() {
        return server;
    }

    public void setServer(String server) {
        this.server = server;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public String getDatabase() {
        return database;
    }

    public void setDatabase(String database) {
        this.database = database;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
