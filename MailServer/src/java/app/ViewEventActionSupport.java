/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app;

import DAO.EventDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import entities.Account;
import entities.Event;
import java.util.List;
import java.util.Map;

/**
 *
 * @author DANG
 */
public class ViewEventActionSupport extends ActionSupport {
    private List<Event> lst;
    public ViewEventActionSupport() {
    }

    public List<Event> getLst() {
        EventDAO dAO = new EventDAO();
        lst = dAO.ViewEvents();
        return lst;
    }

    public void setLst(List<Event> lst) {
        this.lst = lst;
    }
    
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        Account account = (Account)session.get("User");
        if(account!= null && account.getAccType().equalsIgnoreCase("admin"))
        {
            return "admin";
        }
        return "success";
    }
    
}
