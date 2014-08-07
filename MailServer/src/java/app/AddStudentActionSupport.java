/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app;

import DAO.AccountDAO;
import DAO.StudentDAO;
import com.opensymphony.xwork2.ActionSupport;
import entities.Student;
import util.Validator;

/**
 *
 * @author DANG
 */
public class AddStudentActionSupport extends ActionSupport {
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
    
    public AddStudentActionSupport() {
    }
    
    public String execute() throws Exception {
        StudentDAO studentDAO = new StudentDAO();
        Student s = new Student();
        s.setEmailId(emailId);
        s.setName(name);
        s.setAddress(address);
        s.setDob(dob);
        s.setPhoto(photo);
        if(studentDAO.addStudent(s))
        {
            return "success";
        }
        return "fail";
    }

    @Override
    public void validate() {
        if (getEmailId().length() == 0) {
            addFieldError("emailId", "Email is required!");
        } else if (!new Validator().checkEmail(getEmailId())) {
            addFieldError("emailId", "Invalid Email!");
        } else if (new AccountDAO().checkMail(getEmailId())) {
            addFieldError("emailId", "Email Used!");
        }
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
