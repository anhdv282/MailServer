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
public class ViewStudentDetailActionSupport extends ActionSupport {
    Student student;
    int id;

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public ViewStudentDetailActionSupport() {
    }
    
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        Account account = (Account)session.get("User");
        StudentDAO studentDAO = new StudentDAO();
        if(account!= null && account.getAccType().equalsIgnoreCase("admin"))
        {
            student = studentDAO.studentById(id);
            return account.getAccType();
        }
        if(account!= null && account.getAccType().equalsIgnoreCase("student"))
        {
            student = studentDAO.studentByMail(account.getEmail());
            return account.getAccType();
        }
        return "fail";
    }
    
}
