/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package espe.edu.ec.connection;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author david
 */
public class DB
{
    private Connection connection=null;
    private static DB Instancia;
    private String server;
    private String port;
    private String database;
    private String user;
    private String password;
    private Vendor vendor;
    public static DB getInstancia()
    {
        if(Instancia==null)
        {
            Instancia = new DB();
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
            DataSource dsd = (DataSource)envContext.lookup("jdbc/utic");
            //DataSource dsd = (DataSource)envContext.lookup("jdbc/PRODP");
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