/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.buddha.dao;


import com.buddha.bean.user;
import static com.buddha.bean.user.getHash;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 *
 * @author Lama
 */
public class futsalconnection {
    
    
    
     public static Connection getConnectionObject(){
         
        try{
            Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/futsalnepal","root","");
//            PreparedStatement ps = con.prepareStatement("insert into demo (name,address)values(\"buddha\",\"lama\");");
//            ps.executeUpdate();
            return con;
        }catch(Exception ex){ System.out.print(ex);}
        return null;
    }
     
    public void registerUser( user u){
        
        try{
        
         Connection con = getConnectionObject();
         
         String futsalName = u.getName();
        long phoneNumber = u.getNumber();
        String location = u.getLocation();
        String password0 = u.getPassword();
        String hash= getHash(password0);
        
        
        String emailReg = u.getEmail();
        
        System.out.print(futsalName);
        System.out.print(location);
        System.out.print(hash);
        System.out.print(emailReg);
        
         
         PreparedStatement ps = con.prepareStatement("insert into futsalarena(FutsalName,phonenumber,email,password,address) values (?,?,?,?,?)");
         
         ps.setString(1,futsalName);
         ps.setLong(2, phoneNumber);
         ps.setString(3, emailReg);
         ps.setString(4, hash);
         ps.setString(5, location);
         
         ps.executeUpdate();
        
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
         
        
      
    }
     
    public  user checkAuthentication(String e,String p){
        user u = new user();
        
        
        try{
            Connection con = getConnectionObject();
            PreparedStatement  ps = con.prepareStatement("select * from futsalarena where email=? and password=?");
            ps.setString(1,e);
            ps.setString(2, p);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
             
             u.setName(rs.getString("FutsalName"));
             u.setEmail(rs.getString("email"));
             u.setPassword(rs.getString("password"));
             
            }
            
            
            
        }catch(SQLException ex){}
       return u;
    }
    
//    public  user[] futsalInformation(){
//        
//            try{
//             Connection con = getConnectionObject();
//             
//             
//             
//             
//             PreparedStatement ps = con.prepareStatement("select * from futsalarena");
//             
//             ResultSet rs = ps.executeQuery();
//             int rowCount =0;
//             if(rs != null){
//                if(rs.last()){
//                    rowCount = rs.getRow();
//                    rs.beforeFirst();
//                }
//             }
//             
//                         
//             user[] u = new user [rowCount];
//             u[0].setCount(rowCount);
//              int i = 0;
//             while(rs.next()){
//                
//                   u[i].setName(rs.getString("FutsalName"));
//                   u[i].setNumber(rs.getLong("phonenumber"));
//                   u[i].setLocation(rs.getString("address"));
//                i++;
//             }
//             return u;
//            }catch( SQLException e){}
//             
//             
//        
//             
//    return null;
//    }
//    
//    public int count(){
//       int a = 0;
//        
//        try{
//             Connection con = getConnectionObject();
//             PreparedStatement ps = con.prepareStatement("select count(*)from futsalarena");
//             ResultSet rs = ps.executeQuery();
//              while(rs.first()){
//                  a = rs.getInt(1);
//              }
//         
//        
//        }catch( Exception ex){}
//    return a;
//    }
    
    
    
    
}
