/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.buddha.recommendation;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Lama
 */
public class pmodel {

        Map<Integer,Float> opset = new HashMap<Integer, Float>();
        int[] recommendatedFutsalId;
        int i = 0;
        
        
    public void Setmodel(Map<Integer,Float> set){
        
        opset = set;
    
    }   
    public Map<Integer, Float> getModel(){
    
        return opset;
    }
    
//    public int[] getRecommendatedFutsalId(){
//        //returns futsalid whose predicted rating in ascending order.So, the highest predicted futsal is at last and so on
//        for (int j : opset.keySet()) {
//            
//            System.out.println( "###sopset### \n"+j + " " + opset.get(j).floatValue());
//            recommendatedFutsalId[i] = j; 
//            i++;
//        }
//            return recommendatedFutsalId;
//    }
}
