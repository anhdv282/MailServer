/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app;

import DAO.StudentDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import entities.Account;
import entities.Student;
import java.util.Map;

/**
 *
 * @author DANG
 */
public class UpdateStudentActionSupport extends ActionSupport {

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
    
    public UpdateStudentActionSupport() {
    }
    
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        Account account = (Account)session.get("User");
        StudentDAO studentDAO = new StudentDAO();
        Student s = new Student();
        s.setEmailId(account.getEmail());
        s.setDob(dob);
        s.setPhoto(photo);
        s.setName(name);
        s.setAddress(address);
        boolean result = studentDAO.updateStudent(s);
        if(result){
            return account.getAccType();
        }
        return "fail";
    }
    
    @Override
    public void validate() {
        if (getName().length() == 0) {
            addFieldError("name", "Name is required!");
        }
        if (getAddress().length() == 0) {
            addFieldError("address", "Address is required!");
        }
        if (getDob().length() == 0) {
            addFieldError("dob", "Birthday is required!");
        }
    }
}
