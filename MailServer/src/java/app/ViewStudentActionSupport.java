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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author DANG
 */
public class ViewStudentActionSupport extends ActionSupport {
    private List<Student> lst;
    
    public List<Student> getLst() {
        StudentDAO studentDAO = new StudentDAO();
        lst = studentDAO.loadAllStudent();
        return lst;
    }

    public void setLst(List<Student> lst) {
        this.lst = lst;
    }
    
    public ViewStudentActionSupport() {
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
