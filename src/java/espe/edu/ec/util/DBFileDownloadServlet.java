/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package espe.edu.ec.util;

import espe.edu.ec.connection.DB;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
 
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
 

@WebServlet("/downloadFileServlet")
public class DBFileDownloadServlet extends HttpServlet {
 
    
    private static final int BUFFER_SIZE = 1024;   
     
    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
     
         
       Connection co = null;
         
        try {
        
            DB con = DB.getInstancia();
            co = con.getConnection();
            int PIDM = Integer.parseInt(request.getParameter("pidm"));
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            int codForm = Integer.parseInt(request.getParameter("codForm"));
            int codPreg = Integer.parseInt(request.getParameter("pregunta"));
            int iter= Integer.parseInt(request.getParameter("iter"));
            
            //JOptionPane.showMessageDialog(null, "PIDM "+PIDM);
            //JOptionPane.showMessageDialog(null, "code "+codigo);
            //JOptionPane.showMessageDialog(null, "codPer"+codForm);

            //PIDM = 64;
            //codigo = 66;
            //codForm = 46; 
                    
            
            String sql = "SELECT UZGTARCHIVO_VALOR,UZGTRESPUESTAS_VALOR,uzgtmime FROM UZGTRESPUESTAS WHERE CODIGO_UZGTFORMULARIOS ="+codigo+" AND CODIGO_UZGTFORMULARIOS_PERSONA = "+codForm+"AND SPRIDEN_PIDM = "+PIDM+" AND CODIGO_UZGTPREGUNTAS = "+codPreg+"AND uzgtrespuestas_iteracion= "+iter;
            PreparedStatement statement = co.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            if (result.next()) {
                Blob blob = result.getBlob(1);
                InputStream inputStream = blob.getBinaryStream();
                String fileName = result.getString(2);
                 String mime = result.getString(3);
                int fileLength = (int)blob.length();
               // JOptionPane.showMessageDialog(null, "filemime = " + mime);
                 
               // System.out.println("fileLength = " + fileLength);
               
 
                ServletContext context = getServletContext();
 
                // sets MIME type for the file download
               /* String mimeType = context.getMimeType(mime);
                if (mimeType == null) {        
                    mimeType = "application/octet-stream";
                } */             
                 
                // set content properties and header attributes for the response
                response.setContentType(mime);
                response.setContentLength(fileLength);
                String headerKey = "Content-Disposition";
                String headerValue = String.format("attachment; filename=\"%s\"",fileName);
                response.setHeader(headerKey, headerValue);
 
                // writes the file to the client
                OutputStream outStream = response.getOutputStream();
                 
                byte[] buffer = new byte[BUFFER_SIZE];
                int bytesRead = -1;
                 
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outStream.write(buffer, 0, bytesRead);
                }
                 
                inputStream.close();
                outStream.close(); 
                con.closeConexion();
                
            } else {
                // no file found
                response.getWriter().print("Lo sentimos no se encontro el archivo");  
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            response.getWriter().print("SQL Error: " + ex.getMessage());
       
        } finally {
            if (co != null) {
                // closes the database connection
                try {
                    co.close();
                    
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }          
        }
        
    }
}
