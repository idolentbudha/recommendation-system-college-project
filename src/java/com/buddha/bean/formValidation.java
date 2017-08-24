/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.buddha.bean;

/**
 *
 * @author Lama
 */
public class formValidation implements java.io.Serializable {
    
    String vFutsalName;
    long vPhoneNumber;
    String vEmail;

    public String getvFutsalName() {
        return vFutsalName;
    }

    public void setvFutsalName(String vFutsalName) {
        this.vFutsalName = vFutsalName;
    }

    public long getvPhoneNumber() {
        return vPhoneNumber;
    }

    public void setvPhoneNumber(long vPhoneNumber) {
        this.vPhoneNumber = vPhoneNumber;
    }

    public String getvEmail() {
        return vEmail;
    }

    public void setvEmail(String vEmail) {
        this.vEmail = vEmail;
    }
    
    
    
}
