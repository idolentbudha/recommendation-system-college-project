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
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Lama
 */
public class displayServlet extends HttpServlet {

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
            
            HttpSession session = request.getSession();
            String sessionUser = (String) session.getAttribute("admin");
            //addboker
            
//            String addBooker = request.getParameter("submit");
//            
//            String dateS = date.toString();
//            List record;
//            record = new ArrayList();
            
            
            //bokerlist
            
            String dates = date.toString();
            
             List list1;
            list1 = new ArrayList();
            try{
                Connection con = futsalconnection.getConnectionObject();
                
                PreparedStatement ps = con.prepareStatement(
                        " select record.CustomerName,record.CustomerPhoneno,record.fromHour,record.fromampm,record.toHour,record.toampm \n" +
                        "from record\n" +
                        "INNER JOIN futsalarena \n" +
                        "ON futsalarena.FutsalName = record.FutsalName WHERE futsalarena.FutsalName = ? AND record.Date= ? " );
                ps.setString(1,sessionUser);
                ps.setString(2, dates);
                ResultSet rs = ps.executeQuery();
                
                //`Date`, `CustomerName`, `CustomerPhoneno`, `fromHour`, `fromampm`, `toHour`, `toampm`, `FutsalName
                
                while(rs.next()){
                        list1.add(rs.getString("CustomerName"));
                        list1.add(rs.getLong("CustomerPhoneno"));
                        list1.add(rs.getString("fromHour"));
                        list1.add(rs.getString("fromampm"));
                        list1.add(rs.getString("toHour"));
                        list1.add(rs.getString("toampm"));
                }
                
                
            }catch(SQLException ex){
            }
            
            
            request.setAttribute("info1",list1);
            request.getRequestDispatcher("dashboard.jsp").forward(request,response);
            
            
            
            
            
            
            
            
            
            
            
            
            

            
            
            
            
            
            
            
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
