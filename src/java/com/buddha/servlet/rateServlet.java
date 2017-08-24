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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Lama
 */
public class rateServlet extends HttpServlet {

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
            
            //futsal to rate
            
            String futsalName =request.getParameter("futsalname");
            
            out.print("futsalName:" + futsalName +"<br>");
            
            int futsalid = 0;
            
            //current user
            
            HttpSession session = request.getSession();
            String username =(String) session.getAttribute("user");
            out.print("username:"+username +"<br>");
            
            int userid = (int) session.getAttribute("userid");
            
            out.print("userid:" + userid);
            String rating = request.getParameter("rate");
            
            out.print("String rating:"+rating);
            
            int rateValue = Integer.parseInt(rating);
            out.print("<br>rated value:"+rateValue);
            
            if(username == null || username.isEmpty() ){
                
                out.print("no user");
            }else{
                //store tthe rating of the current user for the futsal
                out.print("inside 1st else");
                try {
                    
                    Connection con = futsalconnection.getConnectionObject();
                    
                    PreparedStatement ps = con.prepareStatement("SELECT futsalId from rating where futsalName = ?  and username = ? ");
                    PreparedStatement ps1 = null;
                    PreparedStatement ps2 = null;
                    PreparedStatement ps3 = null;
                    
                    ps.setString(1, futsalName);
                    ps.setString(2, username);
                    ResultSet rs = ps.executeQuery();
                    while(rs.next()){
                        futsalid = rs.getInt("futsalId");
                    }
                    
                    out.print("futsalid:" + futsalid);
                    
                     if(futsalid != 0){
                         //already rated futsal
                            out.print("\n" + "already rated");
                            
                         ps1 = con.prepareStatement("UPDATE rating SET rating =? WHERE futsalId =? and username =? ");
                         ps1.setInt(1,rateValue);
                         ps1.setInt(2,futsalid);
                         ps1.setString(3, username);
                         ps1.executeUpdate();
                     }else{
                     //futsal not rated
                        out.print("<br>futsal not rated");
                            
                            ps2 = con.prepareStatement("SELECT futsalId FROM futsalarena WHERE FutsalName = ?");
                            ps2.setString(1, futsalName);
                            ResultSet rs1 = ps2.executeQuery();
                            
                            out.print("<br>outside loop");
                            
                            while(rs1.next()){
                                out.print("inside loop"); 
                                futsalid = rs1.getInt("futsalId"); 
                                 
                            }
                            
                            out.print("<br>futsalid:" + futsalid);
                            if(futsalid != 0){
                                
                                out.print("inside ps3");
                                
                                ps3 = con.prepareStatement("INSERT INTO rating(userid,username,futsalId,futsalName,rating) VALUES(?,?,?,?,?) ");
                                ps3.setInt(1,userid);
                                ps3.setString(2,username );
                                ps3.setInt(3,futsalid );
                                ps3.setString(4, futsalName);
                                ps3.setInt(5,rateValue);
                                ps3.executeUpdate();
                            
                            }
                            
                     
                     }
                     ps1.close();
                     ps2.close();
                     ps3.close();
                    
                    
                } catch (Exception e) {
                }
            }
            response.sendRedirect("arenaServlet");
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
