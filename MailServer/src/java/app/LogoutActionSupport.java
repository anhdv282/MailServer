/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;

/**
 *
 * @author DANG
 */
public class LogoutActionSupport extends ActionSupport {
    
    public LogoutActionSupport() {
    }
    
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        session.remove("User");
        return "success";
    }
    
}
