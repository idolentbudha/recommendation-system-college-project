/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.buddha.bean;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author Lama
 */
public class user implements java.io.Serializable {
    
    String futsalName;
    String email;
    String ownername;

   
    String password;
    long number;
    int count;
    String time;
    long price;
    String describe;
    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
   
    String location;
    
    public void setName(String name){
     this.futsalName = name;
    }
    public String getName(){return futsalName;}
    
    public void setEmail(String email){this.email = email;}
    public String getEmail(){return email;}
    
    public void setPassword(String password){this.password = password;}
    public String getPassword(){return password; }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }
    
    public String getOwnername() {
        return ownername;
    }

    public void setOwnername(String ownername) {
        this.ownername = ownername;
    }
    
    public void setNumber(long number){ this.number = number;}
    public long getNumber(){return number;}
    
    public void setLocation(String location){this.location = location;}
    public String getLocation(){return location;}
    
    public static String getHash(String password){
        String hash="";
        
        try{
            
            byte[] receivedPassword, digestedBytes;
            receivedPassword = password.getBytes();
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            
            md.update(receivedPassword);
            digestedBytes = md.digest();
            
            hash = DatatypeConverter.printHexBinary(digestedBytes).toLowerCase();
            
            
            
        }catch(NoSuchAlgorithmException ex){
        }
        
        
        
    return hash;
    }
    
    
}
