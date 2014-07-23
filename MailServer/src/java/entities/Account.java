/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entities;

/**
 *
 * @author DucNM
 */
public class Account {
    
    private String email;
    private String pass;
    private String accType;
    private boolean changePass;
    private int status;

    public Account() {
    }

    public Account(String email, String pass, String accType, boolean changePass, int status) {
        this.email = email;
        this.pass = pass;
        this.accType = accType;
        this.changePass = changePass;
        this.status = status;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getAccType() {
        return accType;
    }

    public void setAccType(String accType) {
        this.accType = accType;
    }

    public boolean isChangePass() {
        return changePass;
    }

    public void setChangePass(boolean changePass) {
        this.changePass = changePass;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    public boolean login(String email, String pass) {
        return false;
    }
}
