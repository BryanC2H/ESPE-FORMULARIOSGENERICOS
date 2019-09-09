/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package espe.edu.ec.util;

import espe.edu.ec.connection.DB;
import espe.edu.ec.connection.DB2;
import espe.edu.ec.decrypt.DecryptSmAtrix;
import espe.edu.ec.models.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author D4ve
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final static Logger LOGGER = Logger.getLogger("bitacora.subnivel.Control");

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out;
        out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            Usuario user = new Usuario();
            DecryptSmAtrix dec = new DecryptSmAtrix();
            String id = request.getParameter("param");
            //id = new String(dec.decrypt(id));
            id = "L00001826";

            //int PIDM = obtenerPIDM(id);

            int PIDM = 2401;
            //String param = "bccd67a1d7973a4109ab65c82680c115";
            user.setPIDM(PIDM);


            HttpSession session = request.getSession(true);
            String action = (request.getPathInfo() != null ? request.getPathInfo() : "");
            if (PIDM == 7683 || PIDM == 334571 || PIDM == 2401 || PIDM == 12646 || PIDM == 294223) {       //if (isValid(user)) {
                session.setAttribute("currentSessionUser", user);
                response.sendRedirect("mostrarFormulario.jsp"); //logged-in page   
            } else { 
            if (PIDM == 12649 || PIDM == 385472 || PIDM == 14266 || PIDM == 12653) {       //if (isValid(user)) {
                session.setAttribute("currentSessionUser", user);
                response.sendRedirect("mostrarFormularioHD.jsp"); //logged-in page   
            } else { 
                session.setAttribute("userSessionUser", user);
                response.sendRedirect("GRes_Usuarios.jsp?param=" + request.getParameter("param"));
            }//error page 
            }
            if (action.equals("uploadServlet")) {
                session.invalidate();
                response.sendRedirect("mostrarGRes.jsp?param=" + request.getParameter("param"));
            }
        }catch (Exception e) {
            System.out.println(e);
            LOGGER.log(Level.WARNING, "theException", e);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public boolean isValid(Usuario user) throws Exception {
        boolean isValid = false;
        try {
            DB con = DB.getInstancia();
            Connection co = con.getConnection();
            Integer pidm = user.getPIDM();
            if (pidm != null) {
                ResultSet rs = co.prepareStatement("SELECT COUNT(UZTUSER_PIDM) FROM UZTPRUS WHERE UZTUSER_PIDM = " + pidm + "AND UZTPROC_ID=1 AND UZTPRUS_ESTADO='A' AND UZTSIST_ID=6").executeQuery();

                LOGGER.log(Level.INFO, "user.getPIDM() {}", user.getPIDM());

                int rows = 0;

                if (rs.next()) {
                    rows = rs.getInt(1);
                }
                LOGGER.log(Level.INFO, "ROWS {}", rows);
                if (rows > 0) {
                    isValid = true;
                    LOGGER.log(Level.INFO, "Usuario Administrador");
                } else {
                    LOGGER.log(Level.INFO, "Usuario comun");
                }
            } else {
                LOGGER.log(Level.INFO, "Pidem nulo");
            }
            con.closeConexion();
        } catch (SQLException e) {
            LOGGER.log(Level.WARNING, "not isValid", e);
        }

        return isValid;
    }

    public int obtenerPIDM(String id) throws SQLException, Exception {
        int PIDM = 0;
        LOGGER.log(Level.INFO, "obtenerPIDM id: {} ", id);
        DB2 con = DB2.getInstancia();

        try {

            if (!id.isEmpty()) {

                Connection co = con.getConnection();
                LOGGER.log(Level.INFO, "getConnection: {}", co);
                ResultSet rs = co.prepareStatement("SELECT DISTINCT SPRIDEN_PIDM as estPIDM FROM SPRIDEN WHERE SPRIDEN.SPRIDEN_ID = '" + id + "' AND SPRIDEN.SPRIDEN_CHANGE_IND IS NULL").executeQuery();
                if (rs.next()) {
                    PIDM = rs.getInt(1);
                }
                LOGGER.log(Level.INFO, "getInt: {}", rs.getInt(1));
                LOGGER.log(Level.INFO, "PIDM: {}", PIDM);

            } else {
                LOGGER.log(Level.INFO, "Id es nulo: {}", id);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.WARNING, "obtenerPIDM {}", e);
        }
        con.closeConexion();
        return PIDM;
    }
}
