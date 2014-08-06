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
public class UpdateStaffActionSupport extends ActionSupport {
    String name;
    String address;
    String dob;
    String photo;

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
    
    public UpdateStaffActionSupport() {
    }
    
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        Account account = (Account)session.get("User");
        StaffDAO staffDAO = new StaffDAO();
        Staff s = new Staff();
        s.setEmailId(account.getEmail());
        s.setDob(dob);
        s.setPhoto(photo);
        s.setName(name);
        s.setAddress(address);
        boolean result = staffDAO.updateStaff(s);
        if(result){
            return account.getAccType();
        }
        return "fail";
    }
    
}
