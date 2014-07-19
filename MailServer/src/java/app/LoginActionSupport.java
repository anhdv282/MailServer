/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app;

import DAO.LoginDAO;
import com.opensymphony.xwork2.ActionSupport;
import entities.Account;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
/**
 *
 * @author DANG
 */
public class LoginActionSupport extends ActionSupport implements SessionAware{
    
    String user;
    String pass;
    LoginDAO dp = new LoginDAO();
    Account account = new Account();
    
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
        
        account.setEmail(user);
        account.setPass(pass);
        
        if(dp.checkLogin(account)){
            session.put("User", account);
            return account.getRole();
        }
        return "fail";
    }
    
    Map<String,Object> session ;
    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }

    @Override
    public void validate() {
        if(getUser().length() == 0){
            addFieldError("username", getText("email.required"));
        }
        else if(getPass().length() == 0){
            addFieldError("password", getText("password.required"));
        }
    }
    
}
