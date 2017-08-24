/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.buddha.servlet;

import com.buddha.bean.user;
import com.buddha.recommendation.slopeOne;
import static com.buddha.bean.user.getHash;
import com.buddha.bean.userSessionInfo;
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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Lama
 */
public class futsalservlet extends HttpServlet {

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
            throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            List list;
            list = new ArrayList();
           
            if(request.getParameter("adminlogin") != null && request.getParameter("adminlogin").equals("adminlogin")){
                
                    String name = request.getParameter("username");
                    String password = request.getParameter("password");
                    String userHash;

                
                    futsalconnection c = new futsalconnection();
                    
                    
                    
                    userHash = getHash(password);
                  
                    
                    
                    user u = c.checkAuthentication(name,userHash); 
                    
                  
                
                    String username= u.getName();
                    String useremail =u.getEmail();
                    String userpassword =u.getPassword();
                    
                    
                
                        if(name.equals(useremail) && userHash.equals(userpassword)){



                          Cookie ck = new Cookie("username", username);
                          ck.setMaxAge(600);
                          response.addCookie(ck);


                          HttpSession session = request.getSession();

                          session.setAttribute("admin",username);
                          response.sendRedirect("display.jsp");


                        }
                        else{
                           response.sendRedirect("index.jsp");
                        } 
                
            }else if(request.getParameter("register") != null && request.getParameter("register").equals("register")){
                
                String futsalName = request.getParameter("futsalName");
                
//                 out.print(futsalName+"<br>");
                
                String location = request.getParameter("location");
                
//                out.print(location+"<br>");
                
//                String ownername = request.getParameter("ownername");
              
//                out.print(ownername+"<br>");
                
//                String time = request.getParameter("time");
                
//                out.print(time+"<br>");
                
//                String price = request.getParameter("price");
//                long prices = Long.parseLong(price);
                
//                out.print(prices+"<br>");
                
                String description = request.getParameter("describe");
                
//                out.print(description+"<br>");
                
                
                
                String emailReg = request.getParameter("mail");
                
//                out.print(emailReg+"<br>");
                
                String password0 = request.getParameter("password");
                
//                out.print(password0  +"<br>");
        
                
                String password1 = request.getParameter("password_confirmation");
                
//                out.print(password1  +"<br>");
                
                String phoneNumber = request.getParameter("number");
                

                long number = Long.parseLong(phoneNumber);
//                  out.print(number+"<br>"); 

                
                
                
                user u = new user();
                u.setName(futsalName);
                u.setNumber(number);
                
                u.setLocation(location);
//                u.setPrice(prices);
//                u.setTime(time);
                u.setDescribe(description);
//                u.setOwnername(ownername);
                u.setPassword(password0);
                u.setEmail(emailReg);
                
//                out.print("set to user");
                 
                
                
                
                futsalconnection con = new futsalconnection();
                
//                out.print("connecting.....");
                con.registerUser(u);
                
                
                
               
                
              request.getRequestDispatcher("registerSubmit.jsp").forward(request, response);
             
            }else if( request.getParameter("userlogin") != null && request.getParameter("userlogin").equals("userlogin")){
                        
//                        out.print("jhrewra");
                
                       String uname = request.getParameter("username");
//                       out.print("username:" +uname);
                       String upassword = request.getParameter("password");
//                       out.print("password:" + upassword);
                       String dusername = null;
                       String dpassword = null;
                       String useremail = null;
                       Long userphone = null;
                       int userid = 0;
//                       out.print("sdfds");
                       try {
                           Connection con = futsalconnection.getConnectionObject();
                           
                           PreparedStatement ps = con.prepareStatement("select * from users where username = ? and password =  ?");
                           ps.setString(1,uname);
                           ps.setString(2, upassword);
                           
                           ResultSet rs = ps.executeQuery();
                           
                           while(rs.next()){
                               
                               userid = rs.getInt("userid");
                               useremail = rs.getString("email");
                               userphone = rs.getLong("phonenumber");
                               dusername= rs.getString("username");
                               dpassword = rs.getString("password");
                               list.add(rs.getInt("userid"));
                               list.add(rs.getString("firstName"));
                               list.add(rs.getString("middleName"));
                               list.add(rs.getString("lastName"));
                               list.add(rs.getString("email"));
                               list.add(rs.getLong("phonenumber"));
                           }
                           
//                           out.print("<br>asdf");
                           
                } catch (Exception e) {
                }
//                       out.print("<br>this");
//                       out.print("<br>dusername:" +dusername);
//                       out.print("<br>dpassword:" + dpassword);
                       
                    if( dusername == null || dpassword == null ){
                        response.sendRedirect("loginError.jsp");
                    }else{
                        
                            if (dusername.equals(uname) && dpassword.equals(upassword)) {

//                                    out.print("inside if");
                                    
                                    //after user login is valid...set the userId in userSession modal...this is for recommendation 
                                    
                                    userSessionInfo uid = new userSessionInfo();
                                    
                                    

                                    HttpSession session = request.getSession();
                                        
                                   session.setAttribute("user",uname);
                                   session.setAttribute("userid", userid);
                                   
                                   


                                   session.setAttribute("userinfo", list);

                                   
                                   
//                                   RequestDispatcher dispatcher = request.getRequestDispatcher("booking.jsp");
//                                     if(dispatcher != null){
//                                         dispatcher.include(request, response);
//                                     }
                                  response.sendRedirect("bServlet");  
                            }
                            
                            
                            
                    }
              }else if(request.getParameter("registerUser") != null && request.getParameter("registerUser").equals("registerUser")){
                
                String firstName = request.getParameter("fName");
                String mName = request.getParameter("mName");
                String lName = request.getParameter("lName");
                
                String uName = request.getParameter("uName");
                
//                 out.print(futsalName+"\n");
                
                String location = request.getParameter("address");
                
//                out.print(location+"\n");
                
                String emailReg = request.getParameter("email");
                
//                out.print(emailReg+"\n");
                
                String password0 = request.getParameter("password0");
                
//                out.print(password0  +"\n");
                
                String password1 = request.getParameter("password1");
                
//                out.print(password1  +"\n");
                
                String phoneNumber = request.getParameter("pnumber");
//                out.print(phoneNumber);

                long number = Long.parseLong(phoneNumber);
//                  out.print(number); 
                
                
                try {
                                Connection con = futsalconnection.getConnectionObject();
                    
                                PreparedStatement ps = con.prepareStatement("INSERT INTO users(username,firstName,middleName,lastName,password,email,phonenumber) VALUES(?,?,?,?,?,?,?) ");
                                ps.setString(1,uName); 
                                ps.setString(2,firstName);
                                ps.setString(3, mName);
                                ps.setString(4, lName);
                                ps.setString(5, password0);
                                ps.setString(6, emailReg);
                                ps.setLong(7,number);
                                

                                ps.executeUpdate();
                    
                    
                } catch (Exception e) {
                }
 
                
                
              request.getRequestDispatcher("login.jsp").forward(request, response);
             
            }



//user[]  u = fcon.futsalInformation();
//out.print("got u");
//
//
//
//
//if(u != null){
//out.print("hello");
//        
//        
//
//        int count = u[0].getCount();
//        for(int i=0; i<10;i++){
//                    out.print(u[i].getName());
//                    out.print(u[i].getLocation());
//                    out.print(u[i].getNumber());
//        }
//        
////    request.setAttribute("futsalinfo", u);
////    request.getRequestDispatcher("arena.jsp").forward(request, response);
//}else{
// out.print("else");
//}






            
            
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
