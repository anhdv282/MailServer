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
import java.util.Map;

/**
 *
 * @author DANG
 */
public class ViewStaffDetailActionSupport extends ActionSupport {
    Staff staff;
    int id;

    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public ViewStaffDetailActionSupport() {
    }
    
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        Account account = (Account)session.get("User");
        StaffDAO staffDAO = new StaffDAO();
        staff = staffDAO.getStaffById(id);
        if(account!= null && account.getAccType().equalsIgnoreCase("admin"))
        {
            return "admin";
        }
        return "success";
    }
    
}
