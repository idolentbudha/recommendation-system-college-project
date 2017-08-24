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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Lama
 */
public class preUpdate extends HttpServlet {

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
            
            HttpSession session = request.getSession();
            String sessionUser =(String) session.getAttribute("user");
            Connection con = null;
            List userInformation = new ArrayList();
            
            try {
                con = futsalconnection.getConnectionObject();
                PreparedStatement ps = con.prepareStatement("SELECT username, firstName, middleName, lastName, email, phonenumber FROM users WHERE username = ?");
                ps.setString(1,sessionUser);
                
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    
                    
                    userInformation.add(rs.getString("firstName"));
                    userInformation.add(rs.getString("middleName"));
                    userInformation.add(rs.getString("lastName"));
                    
                    userInformation.add(rs.getString("email"));
                    
                    userInformation.add(rs.getString("username"));
                    userInformation.add(rs.getString("phonenumber"));
                    
                    
                con.close();
                }
            } catch (Exception e) {
            }
                request.setAttribute("userInformation",userInformation);    
                RequestDispatcher dispatcher = request.getRequestDispatcher("editInfo.jsp");
                                     if(dispatcher != null){
                                         dispatcher.include(request, response);
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
