/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app;

import DAO.LoginDAO;
import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author DANG
 */
public class LoginActionSupport extends ActionSupport {
    
    String user;
    String pass;
    LoginDAO dp = new LoginDAO();

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    
    public LoginActionSupport() {
    }
    
    public String execute() throws Exception {
        if(dp.checkStudent(user, pass)){
            return "student";
        }
        if(dp.checkAdmin(user, pass)){
            return "admin";
        }
        if(dp.checkStaff(user, pass)){
            return "staff";
        }
        else{
            return "fail";
        }
    }
    
}
