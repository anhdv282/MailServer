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

/**
 *
 * @author DANG
 */
public class ChangePassActionSupport extends ActionSupport {

    String pass;

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    
    public ChangePassActionSupport() {
    }
    
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        Account account = (Account)session.get("User");
        account.setPass(pass);
        LoginDAO loginDAO = new LoginDAO();
        if(loginDAO.changePass(account))
        {
            return "success";
        }
        return "fail";
    }
    
}
