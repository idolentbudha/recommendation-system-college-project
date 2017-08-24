/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.buddha.servlet;

import com.buddha.bean.userSessionInfo;
import com.buddha.dao.futsalconnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.buddha.recommendation.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Lama
 */
public class recommendedFutsal extends HttpServlet {

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
            
            out.print("here");
            //initialization
            int recommendatedFutsalIds[] = null; //it is used to stored the recommendated futsalids received from pmodel
            int targetedUser;
            
            HttpSession sess = request.getSession();
            targetedUser = (int) sess.getAttribute("userid");
            
            List<List> recommendedFutsals = new ArrayList<List>();
            List recommendedFutsal = new ArrayList() ; 
            
            
            Map<Integer, Float> oset = new HashMap<Integer, Float>();
            
            //run slope one algo
            new slopeOne();
            
            //run predict
            out.print("<br>here");
            
            
           Predict predict = new Predict();
           predict.getUser(targetedUser);
           predict.readDiffs();
           
           
           pmodel set = new pmodel();
           set = predict.runPredict();
           
           
           
           
           
           
           
           out.print("<br>here");
           
          oset = set.getModel();
          
          out.print("<br>after oset");
          
          
            out.print("<br>outsideloop");
            //get recommendated futsals from pmodel
                       out.print("<br>here");
            //
            
            try {
            out.print("<br>here");    
                Connection con = futsalconnection.getConnectionObject();
                PreparedStatement ps = null;
                out.print("<br>here");
                
                
                
//                int i=0;int t;
//                for (int j : oset.keySet()) {
//                    
//                    out.print("<br> i="+ i++);
//                    t=j;
//                    recommendatedFutsalIds[i]= t;
//                    out.print(recommendatedFutsalIds[i]);
//                
//                }
                
                
                for (int j : oset.keySet()) {
                    
                    out.print("inside loop<br>");
                    ps = con.prepareStatement("SELECT FutsalName,phonenumber, email, address FROM futsalarena WHERE futsalId = ?");
                    ps.setInt(1,j);
                    ResultSet rs = ps.executeQuery();
                    
                    while(rs.next()){
                         
                        
                        out.print("################");
                         out.print(rs.getString("FutsalName"));   
                         out.print(rs.getLong("phonenumber"));
                         out.print(rs.getString("email"));
                         out.print(rs.getString("address"));
                         out.print("<br>");
                         out.print("<br>");
                         
                         recommendedFutsal.add(rs.getString("FutsalName"));
                         recommendedFutsal.add(rs.getLong("phonenumber"));
                         recommendedFutsal.add(rs.getString("email"));
                         recommendedFutsal.add(rs.getString("address"));
                         
                    }
                    
                } recommendedFutsals.add(recommendedFutsal);
                
            } catch (Exception e) {
            
            }
            request.setAttribute("rfutsal", recommendedFutsals);
            RequestDispatcher dispatcher = request.getRequestDispatcher("recommendation.jsp");
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
