/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.buddha.recommendation;

import com.buddha.bean.userSessionInfo;
import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

/**
 *
 * @author Lama
 */
public class Predict {
    
    Map<Integer,Float> user = new HashMap<Integer, Float>();
    
    //store unsorted only prediction
    Map<Integer,Float> pset = new HashMap<Integer, Float>();
    
    //sorted predictions
    Map<Integer, Float> opset = new HashMap<Integer, Float>();
    
    HashMap<Integer,Float> predictions = new HashMap<Integer,Float>();
    /* User to whom the prediction will be made */
    
//    userSessionInfo uinfo = new userSessionInfo();
//    
//    
//    int targetUser = 2;
    
    
    
    float mDiff[][];
    float mFreq[][];
    /* Contains the maximun number of items */
    int maxItem;

//    public static void main(String args []){
//        long start = System.currentTimeMillis();
//        Predict newPrediction = new Predict();
//        /* Estimates time */
//        long end = System.currentTimeMillis();
//        System.out.println("\nExecution time was "+(end-start)+" ms.");
//    }
    
    //predict function 
    
        public pmodel  runPredict() {
            
//        System.out.print("targetedUser:" + targetUser );
//        getUser(targetUser);
//        readDiffs();
        float totalFreq[] =  new float [maxItem+1];

        /* Start prediction */
        
        System.out.println("\n start prediction:");
        
        for (int j=1; j <= maxItem; j++) {
            predictions.put(j,0.0f);
            totalFreq[j] = 0;
        }

        for (int j : user.keySet()) {
            for (int k = 1; k <= maxItem; k++) {
                if( j != k) {
                    /* Only for items the user has not seen */
                    if(!user.containsKey(k)){
                        float newVal = 0;
                        if(k < j) {
                            newVal = mFreq[k][j] * (mDiff[k][j] + user.get(j).floatValue());
                            
                            //test
                            
                            System.out.println("### for k <j ###");
                            System.out.println("newVal ="+"mFreq"+"["+k+"]"+"["+j+"]"+"*"+"(" +"mDiff["+k+"]"+"["+j+"] + " + "user.get("+j+").floatValue()"+")" );
                            System.out.println("newVal =" +  mFreq[k][j] +"* ("+ mDiff[k][j]   +"+"+ user.get(j).floatValue()+")" );
                            System.out.println("newVal =" + newVal);
                        }
                        else {
                            newVal = mFreq[j][k] * (-1 * mDiff[j][k] + user.get(j).floatValue());
                            
                            //test
                            System.out.println("### for k>j ###");
                            System.out.println("newVal ="+"mFreq"+"["+j+"]"+"["+k+"]"+"*"+"(" +"mDiff["+j+"]"+"["+k+"] + " + "user.get("+j+").floatValue()"+")" );
                            System.out.println("newVal =" +  mFreq[j][k] +"* ("+ mDiff[j][k]   +"+"+ user.get(j).floatValue()+")" );
                            System.out.println("newVal =" + newVal);
                            
                            
                        }
                        totalFreq[k] = totalFreq[k] + mFreq[k][j];
                        predictions.put(k, predictions.get(k).floatValue() + newVal);
                    
                        System.out.println("#################");
                        System.out.println("newVal: " + newVal);
                        
                        System.out.println("totalFreq"+"["+k+"] : "+"totalFreq["+k+"]" + "+" + "mFreq["+ j +"]" +"["+k+"]" );
                        System.out.println("totalFreq"+"["+k+"] : " + totalFreq[k] + "+" + mFreq[j][k] );
                        System.out.println("totalFreq"+"["+k+"] : "+totalFreq[k]);
                    
                    }
                } 
            }
        }
        
        

        /* Calculate the average */
         System.out.println("\n" + "####Calculate the average #### ");
        for (int j : predictions.keySet()) {
            predictions.put(j, predictions.get(j).floatValue()/(totalFreq[j] ));
            System.out.println( j + " " + predictions.get(j).floatValue());
            
            if(predictions.get(j).isNaN()){}else{
                pset.put(j, predictions.get(j).floatValue());
                
                System.out.println("pset:"+ j + " " + pset.get(j).floatValue());
            }
            
            
        }

        /* Fill the predictions vector with the already known rating values */
        System.out.println("\n" + "#### Filling Predictions #### ");
        for (int j : user.keySet()) {
            predictions.put(j, user.get(j));
            System.out.println( j + " " + predictions.get(j).floatValue());
            
            
        }

        /* Print predictions */
        System.out.println("\n" + "#### Predictions #### ");
        for (int j : predictions.keySet()) {
            System.out.println( j + " " + predictions.get(j).floatValue());
        }
        
        
        /* get sorted neighbour and stored in opset  */
        Neighbour n = new Neighbour();
        opset = n.sortByValue(pset);
        
        for (int j : opset.keySet()) {
            System.out.println( "###sopset### \n"+j + " " + opset.get(j).floatValue());
        }
        
        /*set sorted neighbour to the model for servlet use */
        pmodel s = new pmodel();
        s.Setmodel(pset);
       
      return s;  
    } 
        
        
        /*
     * Function readDiff()
     * Read the precalculated Diffs between items
     *
     */
    public void readDiffs(){
        
        System.out.print("\n readDiffs() executed:<br>");

        File foutput = new File("slope-intermidiary-output.txt");
        FileInputStream fis = null;
        BufferedInputStream bis = null;
        DataInputStream dis = null;

        try {
            fis = new FileInputStream(foutput);
            bis = new BufferedInputStream(fis);
            dis = new DataInputStream(bis);

            String line = dis.readLine();
            StringTokenizer t = new StringTokenizer(line, "\t");
            maxItem = Integer.parseInt(t.nextToken());
            
            //test maxItem
            System.out.println(" \n maxItem:" + maxItem);
            
            
            mDiff = new float[maxItem + 1][maxItem + 1];
            mFreq = new float[maxItem + 1][maxItem + 1];

            
            for(int i = 1; i <= maxItem; i++)
              for(int j = 1; j <= maxItem; j++){
                mDiff[i][j] = 0;
                mFreq[i][j] = 0;
              }

            System.out.println("\n" + "####  read Diffs #### ");

            while(dis.available() != 0){

                line = dis.readLine();
                t = new StringTokenizer(line, "\t");
                int itemID1 = Integer.parseInt(t.nextToken());
                int itemID2 = Integer.parseInt(t.nextToken());
                
                
                

                mDiff[itemID1][itemID2] = Float.parseFloat(t.nextToken());
                
               //test 
                
                System.out.println("mdiff"+"["+itemID1+"]"+"["+itemID2+"] = "+mDiff[itemID1][itemID2]);

                line = dis.readLine();
                t = new StringTokenizer(line, "\t");
                itemID1 = Integer.parseInt(t.nextToken());
                itemID2 = Integer.parseInt(t.nextToken());

                
                
                mFreq[itemID1][itemID2] = Float.parseFloat(t.nextToken());
                
                //test
                
                System.out.println("mFreq"+"["+itemID1+"]"+"["+itemID2+"] = "+mFreq[itemID1][itemID2]);
            }

            fis.close();
            bis.close();
            dis.close();

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    
    
    /*
     * Function getUser()
     * Get already known user preferences
     *
     */
    public  void getUser( int userID ) {

        System.out.print(" \n getUser executed:"+ userID);

        System.out.println("\n" + "#### Initial User x Item x Rating #### ");
        try {
            
            System.out.println("before dbconnection");
            
            Connection con = dbconnection.getConnectionObject();
            PreparedStatement ps = con.prepareStatement("select * from rating");
            
            ResultSet rs = ps.executeQuery();    
            rs.next();
            
            System.out.println("this gets the targeted user information");
            
            while(rs!= null){
                System.out.print("inside while:");

                int tempUser = rs.getInt("userid");
                
                System.out.println("tempuser:"+tempUser);
                
                while(tempUser == userID){
                    
                    System.out.print("inside another while:");
                    
                    System.out.print("user:" + rs.getInt("userid") + "\t");
                    
                    System.out.print("itemcode:"+ rs.getFloat("futsalId") + "    ");
                    System.out.println("rating:" + rs.getFloat("rating"));
                    
                    user.put(rs.getInt("futsalId"),rs.getFloat("rating"));
                    
                    rs.next();
                    tempUser = rs.getInt("userid");
                }
                rs.next();
            }

           

        }catch(Exception e){}
    }
    
    
}
