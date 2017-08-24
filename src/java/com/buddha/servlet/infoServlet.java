/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.buddha.servlet;

import com.buddha.bean.info;
import com.buddha.dao.futsalconnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lama
 */
public class infoServlet extends HttpServlet {

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
            
            LocalDate date = LocalDate.now();
            
            String dateS = date.toString(); 
            
            Connection con = null;
            info infoObject = new info();
            int nooffutsal = 0;
            int playTime = 13;
            int occupied =0;
            int totalavailable;
            try {
                 con = futsalconnection.getConnectionObject();
                 PreparedStatement ps = con.prepareStatement("SELECT COUNT(FutsalName) from futsalarena");
                 ResultSet rs =ps.executeQuery();
                 
                 while(rs.next()){
//                     out.print(rs.getInt(1));
                     nooffutsal = rs.getInt(1);
//                     out.print(nooffutsal);
                    infoObject.setNoOfFutsals(nooffutsal);
                     
                 }
                 
                 
            } catch (SQLException e) {
            }finally{
                     try {
                            con.close();
                } catch (SQLException e) {
                }
            }
            
            
            try {
                con = futsalconnection.getConnectionObject();
                PreparedStatement ps = con.prepareStatement("select sum(diff) from record WHERE  Date =?");
                ps.setString(1, dateS);
                
                ResultSet rs = ps.executeQuery();
                
                while(rs.next()){
                    
//                    out.print(rs.getInt(1));
                    occupied = rs.getInt(1);
//                    out.print(occupied);
                     infoObject.setTotaloccupied(occupied);
                     
                    
                    
                }
                
                
            } catch (SQLException e) {
            }finally{
                        try {
                                con.close();
                } catch (SQLException e) {
                }
            }
            
            
            
            
            infoObject.setPlayingTime(playTime);
            
            totalavailable = (infoObject.getNoOfFutsals() * infoObject.getPlayingTime()) - infoObject.getTotaloccupied();
            infoObject.setTotalavailable(totalavailable);
            
            request.setAttribute("infoServlet", infoObject);
            request.getRequestDispatcher("test.jsp").forward(request, response);
            
             
            
            
            
            
            
            
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
