/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app;

import DAO.LoginDAO;
import com.opensymphony.xwork2.ActionSupport;
import entities.Account;

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
        Account account = new Account();
        account.setEmail(user);
        account.setPass(pass);
        if(dp.checkLogin(account)){
            return account.getRole();
        }
        return "fail";
    }
    
}
