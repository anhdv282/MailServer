/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app;

import DAO.StaffDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import entities.Account;
import entities.Staff;
import java.util.List;
import java.util.Map;

/**
 *
 * @author DANG
 */
public class ViewStaffActionSupport extends ActionSupport {
    private List<Staff> lst;

    public List<Staff> getLst() {
        StaffDAO staffDAO = new StaffDAO();
        lst = staffDAO.loadAllStaff();
        return lst;
    }

    public void setLst(List<Staff> lst) {
        this.lst = lst;
    }
    
    public ViewStaffActionSupport() {
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
