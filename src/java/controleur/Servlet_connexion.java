/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mleqsiou
 */
public class Servlet_connexion extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Servlet01</title>");            
            out.println("</head>");
            out.println("<body>");
            Connection conn=null;
            Statement stmt=null;
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
            }catch(Exception e){out.print(e);}
            
            try{
                String jdbc="jdbc:mysql://localhost:3306/jee";
                String root="root";
                String mdp="";
                conn=DriverManager.getConnection(jdbc,root,mdp);
                stmt=conn.createStatement();
            }catch(Exception e){out.print(e);}
            
            String login = request.getParameter("login");
            String mdp = request.getParameter("password");
            
            String sel="SELECT * from exo16 where login like '"+ login +"' and password like '"+mdp+"'";
            //String sel="SELECT * from exo16 where login like ? and password like ?";
            
            PreparedStatement st=conn.prepareStatement(sel);
            //st.setString(1, "'"+login+"'");
            //st.setString(2, "'"+mdp+"'");
            ResultSet res=st.executeQuery();
            
            if (res.next() == true) {
                //session.setAttribute("login", login);
                request.setAttribute("login", login);
                response.sendRedirect("intranet.jsp");
            }
            else
                response.sendRedirect("index.jsp");
            out.println("<h1>Servlet Servlet01 at " + request.getContextPath() + "</h1>");
            out.println("prénom = "+request.getParameter("prenom")+" nom : "+request.getParameter("nom"));
            out.println("</body>");
            out.println("</html>");
        } catch (SQLException ex) {
            Logger.getLogger(Servlet_connexion.class.getName()).log(Level.SEVERE, null, ex);
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
        processRequest(request, response);
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

}
