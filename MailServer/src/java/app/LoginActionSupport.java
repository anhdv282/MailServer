/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app;

import DAO.LoginDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import entities.Account;
import java.util.Map;
import util.Validator;
/**
 *
 * @author DANG
 */
public class LoginActionSupport extends ActionSupport {
    
    String user;
    String pass;
    
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
        LoginDAO loginDAO = new LoginDAO();
        if(loginDAO.checkLogin(account)){
            Map session = ActionContext.getContext().getSession();
            session.put("User", account);
//            if(account.isChangePass()){
                return account.getAccType();
//            }
//            else
//                return "changePass";
        }
        return "fail";
    }
    
    @Override
    public void validate() {
        if(getUser().length() == 0){
            addFieldError("user", "Email is required!");
        } else if (!new Validator().checkEmail(getUser())){
            addFieldError("user", "Invalid Email!");
        }
        if(getPass().length() == 0){
            addFieldError("pass", "Password is required!");
        }
        if(getUser().length() != 0 && getPass().length() != 0) {
            Account account = new Account();
            account.setEmail(user);
            account.setPass(pass);
            if(!new LoginDAO().checkLogin(account)) {
                addFieldError("pass", "Wrong email or password!");
            }
        }
    }
    
}
