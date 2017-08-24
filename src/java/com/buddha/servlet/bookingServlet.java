/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.buddha.servlet;

import com.buddha.dao.futsalconnection;
import jamaGmail.JavaGmail;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Lama
 */
public class bookingServlet extends HttpServlet {

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
            
            String futsalName = request.getParameter("futsalName");
//            out.print(futsalName+"<br>");
            
            String futsalemail = null;
            
            String bookerName = request.getParameter("bookerName");
//            out.print(bookerName+"<br>");
            
            String bookerPhoneNumber = request.getParameter("phonenumber");
//            out.print(bookerPhoneNumber+"<br>");
            
            String from = request.getParameter("from");
            int fint = Integer.parseInt(from);
//            out.print(fint+"<br>");
            
            String fromampm = request.getParameter("fromampm");
//            out.print(fromampm+"<br>");
            
            String to = request.getParameter("to");
            int tint = Integer.parseInt(to);
//            out.print(tint+"<br>");
            
            String toampm = request.getParameter("toampm");
//            out.print(toampm+"<br>");
            
            LocalDate date = LocalDate.now();
            String dateS = date.toString();
            
//            out.print(dateS+"<br>");
            
            
            //USER INFORMATIONS
            HttpSession session = request.getSession();
            
            
            String userId = (String) session.getAttribute("uerid");
            
            
            
//            
//            int diff = 0;
//                int temp;
//                if(tint > fint){
//                        diff= tint-fint;
//                    }
//                else if(fint> tint){
//                      temp= tint+12;
//                      diff = temp - fint;
//                }
            
            try {
                    Connection con = futsalconnection.getConnectionObject();
                    
                    PreparedStatement ps = con.prepareStatement(
                    "select CustomerName FROM record WHERE Date=? and fromHour =? and fromampm =? and toHour=? and toampm=? and  FutsalName =? ");
                    ps.setString(1,dateS);
                    ps.setInt(2,fint);
                    ps.setString(3,fromampm);
                    ps.setInt(4,tint);
                    ps.setString(5,toampm);
                    ps.setString(6,futsalName);                    
                    ResultSet rs = ps.executeQuery();
                    
                   
                    
                    if(!rs.isBeforeFirst()){/* if empty sends mail else books futsal */
                        
                        //send mail to the futsal
//                        out.print("inside if");
                        
                        Connection conn = futsalconnection.getConnectionObject();
                        PreparedStatement ps1 = con.prepareStatement("select email from futsalarena where FutsalName = ?");
                        ps1.setString(1,futsalName);
                        ResultSet rs1 = ps1.executeQuery();
                        
                        while(rs1.next()){
                            futsalemail = rs1.getString("email");
//                            out.print("<br>"+futsalemail);
                        
                        }
                        
                        String message = "Booked by:"+ bookerName+"\n"
                                          +"Time:"+ from+fromampm+" to "+to+toampm
                                          +"\n Contact:"+ bookerPhoneNumber
                                          +"\n \n \n"
                                          +"*note*"
                                          +"\n"
                                          +"thank you"
                                ;
                        
//                        out.print("message:\n"+ message);
                        
                        
                        //object creation
                        JavaGmail mailObj = new JavaGmail();
                       mailObj.sendMail(futsalemail,futsalName, message);
                       out.print("<br>mailsent");
                       request.getRequestDispatcher("booksubmit.jsp").forward(request,response);
                        
                    }else{
                       
                       request.getRequestDispatcher("recommendedFutsal").forward(request,response);
                        
                    }
                    
                    
                    con.close();
                
            } catch (SQLException ex) {
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
