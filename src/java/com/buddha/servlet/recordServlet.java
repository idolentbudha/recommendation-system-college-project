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
import java.util.Iterator;
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
public class recordServlet extends HttpServlet {

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
            
            
            String addBooker = request.getParameter("submit");
            LocalDate date = LocalDate.now();
            String dateS = date.toString();
            List record;
            record = new ArrayList();
            
            
            
            
            
            if(addBooker.equals("Add_Booker")){
//                out.println("hello");
                String from = request.getParameter("from");
                int fint = Integer.parseInt(from);
                String to = request.getParameter("to");
                int tint = Integer.parseInt(to);
                
                String Booker = request.getParameter("booker");
                String BookerPhone= request.getParameter("phone");
                String fromampm = request.getParameter("fromampm");
                String toampm = request.getParameter("toampm");
                
                
                //substration
                int diff = 0;
                int temp;
                if(tint > fint){
                        diff= tint-fint;
                    }
                else if(fint> tint){
                      temp= tint+12;
                      diff = temp - fint;
                }
                
                
                        
                
                
                
                
                HttpSession session = request.getSession();
                
                String fname = (String) session.getAttribute("admin"); 
                Connection conn = null;
                
//                out.println(from);
//                out.println(fromampm);
//                out.println(to);
//                out.println(toampm);
//                out.println(Booker);
//                out.println(BookerPhone);
//                out.println(date);
//                out.print(fname);
                
                
                        
                        try{
                            
                             conn = futsalconnection.getConnectionObject();

                            PreparedStatement ps = conn.prepareStatement("insert into record (Date,CustomerName,CustomerPhoneno,fromHour,fromampm,toHour,toampm,diff,FutsalName) values(?,?,?,?,?,?,?,?,?)");
                            ps.setString(1, dateS);
                            ps.setString(2,Booker);
                            ps.setLong(3,Long.parseLong(BookerPhone));
                            ps.setInt(4, Integer.parseInt(from));
                            ps.setString(5,fromampm);
                            ps.setInt(6,Integer.parseInt(to));
                            ps.setString(7,toampm);
                            ps.setInt(8,diff);
                            ps.setString(9,fname);
                            
                            ps.executeUpdate();

                        }
                        catch(NumberFormatException | SQLException ex){
                            
                        }
                        finally{
                            try{
                                if(conn != null){
                                    conn.close();
                                }
                            }catch(SQLException ex){}
                        }

            }
            response.sendRedirect("display.jsp");
            
//            //bookerlist
//            
//                         List list1;
//            list1 = new ArrayList();
//            try{
//                Connection con = futsalconnection.getConnectionObject();
//                
//                PreparedStatement ps = con.prepareStatement(" SELECT * FROM `record` WHERE Date = \"2017-06-04\" " );
//                ResultSet rs = ps.executeQuery();
//                
//                //`Date`, `CustomerName`, `CustomerPhoneno`, `fromHour`, `fromampm`, `toHour`, `toampm`, `FutsalName
//                
//                while(rs.next()){
//                        list1.add(rs.getString("fromHour"));
//                        list1.add(rs.getString("fromampm"));
//                        list1.add(rs.getString("toHour"));
//                        list1.add(rs.getString("toampm"));
//                        list1.add(rs.getString("CustomerName"));
//                        list1.add(rs.getLong("CustomerPhoneno"));
//                        
//                }
//                
//                
//            }catch(SQLException ex){
//            }
//            
//            
//            request.setAttribute("info1",list1);
            
            
//            request.getRequestDispatcher("dashboard.jsp").forward(request,response);
                
                
                
            
            
                
            
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
