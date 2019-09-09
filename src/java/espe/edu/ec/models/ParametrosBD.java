/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package espe.edu.ec.models;

/**
 *
 * @author david
 */
public final class ParametrosBD {
    
//    LOCAL
    private static String server;
    private static String port;
    private static String serviceName;
    private static String user;
    private static String password;

    public ParametrosBD()
    {
        
    }
    public String getServer() {
        return server;
    }

    public void setServer(String aServer) {
        server = aServer;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String aPort) {
        port = aPort;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String aServiceName) {
        serviceName = aServiceName;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String aUser) {
        user = aUser;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String aPassword) {
        password = aPassword;
    }
    
}

