/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.buddha.recommendation;


import java.sql.*;

/**
 *
 * @author Lama
 */
public class dbconnection {
    
    
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
    
}
