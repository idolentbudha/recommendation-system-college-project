/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.buddha.servlet;

import com.buddha.dao.futsalconnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lama
 */
public class individualServlet extends HttpServlet {

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
            
            String futsalName =request.getParameter("futsalname");
            
            out.print("futsalName:" + futsalName +"<br>");
            
            List list;
            list = new ArrayList();
            
            try {
                    Connection con = futsalconnection.getConnectionObject();
                    
                    PreparedStatement ps = con.prepareStatement("SELECT * from futsalarena where futsalName = ? ");
                    ps.setString(1,futsalName);
                    ResultSet rs = ps.executeQuery();
                    
                
                while(rs.next()){
                        
                        list.add(rs.getString("FutsalName"));  
                        list.add(rs.getLong("phonenumber"));
                        list.add(rs.getString("address"));
                        list.add(rs.getString("email"));
                        
                }
                    
            } catch (Exception e) {
            }
            request.setAttribute("individual",list);
            RequestDispatcher dispatcher = request.getRequestDispatcher("futsalInfo.jsp");
                    if(dispatcher != null){
                        dispatcher.forward(request, response);
                    }
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
