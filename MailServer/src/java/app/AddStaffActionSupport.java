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
public class AddStaffActionSupport extends ActionSupport {
    String emailId;
    String name;
    String address;
    String dob;
    String photo;

    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }
    
    public AddStaffActionSupport() {
    }
    
    public String execute() throws Exception {
        StaffDAO staffDAO = new StaffDAO();
        Staff s = new Staff();
        s.setEmailId(emailId);
        s.setName(name);
        s.setAddress(address);
        s.setDob(dob);
        s.setPhoto(photo);
        if(staffDAO.addStaff(s)){
            return "success";
        }
        return "fail";
    }
    
}
