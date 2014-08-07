/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app;

import DAO.StaffDAO;
import com.opensymphony.xwork2.ActionSupport;
import entities.Staff;

/**
 *
 * @author DANG
 */
public class DeleteStaffActionSupport extends ActionSupport {
    String emailId;

    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }
    
    public DeleteStaffActionSupport() {
    }
    
    public String execute() throws Exception {
        StaffDAO staffDAO = new StaffDAO();
        Staff staff = new Staff();
        staff.setEmailId(emailId);
        if(staffDAO.deleteStaff(staff)){
            return "success";
        }
        return "fail";
    }
    
}
