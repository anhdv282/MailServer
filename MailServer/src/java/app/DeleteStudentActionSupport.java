/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app;

import DAO.StudentDAO;
import com.opensymphony.xwork2.ActionSupport;
import entities.Student;

/**
 *
 * @author DANG
 */
public class DeleteStudentActionSupport extends ActionSupport {
    String emailId;

    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }
    
    public DeleteStudentActionSupport() {
    }
    
    public String execute() throws Exception {
        StudentDAO studentDAO = new StudentDAO();
        Student student = new Student();
        student.setEmailId(emailId);
        if(studentDAO.deleteStudent(student)){
            return "success";
        }
        return "fail";
    }
    
}
