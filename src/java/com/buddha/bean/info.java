/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.buddha.bean;

import java.io.Serializable;

/**
 *
 * @author Lama
 */
public class info  implements Serializable{
    int noOfFutsals;
    int playingTime;
    int totaloccupied;
    int totalavailable;

    public int getTotaloccupied() {
        return totaloccupied;
    }

    public void setTotaloccupied(int totaloccupied) {
        this.totaloccupied = totaloccupied;
    }

    public int getTotalavailable() {
        return totalavailable;
    }

    public void setTotalavailable(int totalavailable) {
        this.totalavailable = totalavailable;
    }
    

    public int getNoOfFutsals() {
        return noOfFutsals;
    }

    public void setNoOfFutsals(int noOfFutsals) {
        this.noOfFutsals = noOfFutsals;
    }

    public int getPlayingTime() {
        return playingTime;
    }

    public void setPlayingTime(int playingTime) {
        this.playingTime = playingTime;
    }

    
    
    
    
}
