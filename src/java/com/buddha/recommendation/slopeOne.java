/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.buddha.recommendation;

import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.*;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;


/**
 *
 * @author Lama
 */
public class slopeOne {
   
    int maxItemsId = 0;
    float mteste[][];
    int mFreq[][];
    Map<Integer,Map<Integer,Float>> usersMatrix;
    
    public static void main(String[] args) {
        
        slopeOne so = new slopeOne();
        
        
    }
    
    
    

    //start of slope one method
    
        public slopeOne(){

        readInput();
        buildDiffMatrix();


        /* Print the output */
        try{
            FileOutputStream output = new FileOutputStream("slope-intermidiary-output.txt");
            /* Print the maximum number of items */
            output.write(String.valueOf(maxItemsId).getBytes());
            output.write( String.valueOf("\n").getBytes()  );

            for(int i = 1; i <= maxItemsId; i++){
                for(int j = 1; j <= maxItemsId; j++){

                    if(!Float.isNaN (mteste[i][j])){
                        /* Print the rates */
                        output.write( String.valueOf(i).getBytes()  );
                        output.write( String.valueOf("\t").getBytes()  );
                        output.write( String.valueOf(j).getBytes()  );
                        output.write( String.valueOf("\t").getBytes()  );
                        output.write( String.valueOf( mteste[i][j] ).getBytes());
                        output.write( String.valueOf("\n").getBytes()  );

                        /* Print the frequencies */
                        output.write( String.valueOf(i).getBytes()  );
                        output.write( String.valueOf("\t").getBytes()  );
                        output.write( String.valueOf(j).getBytes()  );
                        output.write( String.valueOf("\t").getBytes()  );
                        output.write( String.valueOf( mFreq[i][j] ).getBytes());
                        output.write( String.valueOf("\n").getBytes()  );
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    
    
    //end of slope one method
        
        
        
        
        
    public void readInput() {
    
        //import data from db  user-item-rating
        
        
        
        int i;
        int j;
        
        
        
        usersMatrix = new HashMap<Integer,Map<Integer,Float>>();
        String line;

        try {
            
            System.out.println("before dbconnection");
            
            Connection con = dbconnection.getConnectionObject();
            PreparedStatement ps = con.prepareStatement("select * from rating ORDER BY userid ");
            
            ResultSet rs = ps.executeQuery();
            
            
            
//            fis = new FileInputStream(file);
//            bis = new BufferedInputStream(fis);
//            dis = new DataInputStream(bis);
//
//            line = dis.readLine();

            /*
             * First get all ratings from one user, 
             * calculate the diffs for this user and save them 
             * in the mDiffMatrix
             */
            rs.next();
            while (rs!= null)/* dis.available() != 0*/ {
                   System.out.println("loop");
//              StringTokenizer t = new StringTokenizer(line, ","); 
                
                int user = rs.getInt("userid");
                
                System.out.print("user:" + user + "\n");
                
                
                int tempUser = user;

                usersMatrix.put(user, new HashMap<Integer,Float>());

                // Read all lines for one user
                while(user == tempUser){

                    /* Get item */
                    i = rs.getInt("futsalId");
                    
                    System.out.println("FutsalId:" + i + "\n");
                    
                    /* Get the quantity of items by finding the maximun value
                    * of itemId */
                    maxItemsId = maxItemsId < i ? i : maxItemsId;
                    
                    /* Save rating */
                    usersMatrix.get(user).put(i, rs.getFloat("rating"));

                    if(rs.next()){
                        
                        tempUser = rs.getInt("userid");
                    
                    }
                   else
                        tempUser = -1;

                }
            }

//            fis.close();
//            bis.close();
//            dis.close();

        } catch(SQLException | NullPointerException ex){
            
        }
        
    }
    
    //end of readInput
    
    
    
    //start of difference matrix
    public  void buildDiffMatrix() {
        
        

        mteste = new float[maxItemsId+1][maxItemsId+1];
        mFreq = new int[maxItemsId+1][maxItemsId+1];

        for(int i = 1; i <= maxItemsId; i++)
            for(int j = 1; j <= maxItemsId; j++){
                mteste[i][j] = 0;
                mFreq[i][j] = 0;
            }
        
    /*show data in the map*/ 
    
    System.out.println("### show data in map ###") ;
        for(int cUser : usersMatrix.keySet()){
            
            //test
            System.out.println("###for  user" + cUser +"###") ;
            
            
            for(int i: usersMatrix.get(cUser).keySet()){
                for(int j : usersMatrix.get(cUser).keySet() ){


                    System.out.println(usersMatrix.get(cUser));
                    System.out.println(usersMatrix.get(cUser).get(j));
//                    mteste[i][j] =  mteste[i][j]  +
//                                   ( usersMatrix.get(cUser).get(i).floatValue() - (usersMatrix.get(cUser).get(j).floatValue()));
//                    mFreq[i][j] = mFreq[i][j] + 1;
//                    
//                    
                    

//test
                    
//                    System.out.print("mteste["+i+"]"+"["+j+"]:" + mteste[i][j] + "\t");
//                    System.out.print("mFreq["+i+"]"+"["+j+"]:" + mFreq[i][j] + "\n");
                    
                    
                }
            }
        }
        
        
        
        
        
        
        
        
        /* Iterate through all users, and then, through all items do calculate the diffs */
        for(int cUser : usersMatrix.keySet()){
            
            //test
            System.out.println("###for  user" + cUser +"###") ;
            
            
            for(int i: usersMatrix.get(cUser).keySet()){
                for(int j : usersMatrix.get(cUser).keySet() ){
                    mteste[i][j] =  mteste[i][j]  +
                                   ( usersMatrix.get(cUser).get(i).floatValue() - (usersMatrix.get(cUser).get(j).floatValue()));
                    mFreq[i][j] = mFreq[i][j] + 1;
                    
                    
                    //test
                    
                    System.out.print("mteste["+i+"]"+"["+j+"]:" + mteste[i][j] + "\t");
                    System.out.print("mFreq["+i+"]"+"["+j+"]:" + mFreq[i][j] + "\n");
                    
                    
                }
            }
        }
        System.out.println("\n ### taking average ###");
        /*  Calculate the averages (diff/freqs) */
        for(int i = 1; i<= maxItemsId; i++){
            for(int j = 1; j <= maxItemsId; j++){
                if(mFreq[i][j] > 0){
                    
                    
                    
                    
                    
                    
                    mteste[i][j] = mteste[i][j] / mFreq[i][j];
//                    
                    //test
//                    System.out.println("mteste["+i+"]"+"["+j+"]:" + "mteste[" + i + "]["+j+"] " + "/" + "mFreq["+i+"]["+j+"]");
//                    System.out.println("mteste["+i+"]"+"["+j+"]:" + mteste[i][j] + "/" + mFreq[i][j]  );
                    System.out.println("mteste["+i+"]"+"["+j+"]:" + mteste[i][j] );
                    
//                    //test
//                    System.out.println(" the average: " + mteste[i][j]);
                
                    System.out.print("\n");
                }
            }
        }
    }
    
    }
    

