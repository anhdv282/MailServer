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
    String page;
    ArrayList<Integer> arr;

    public ArrayList<Integer> getArr() {
        StudentDAO studentDAO = new StudentDAO();
        int i = 1;
        while(i<studentDAO.getTotal()){
            arr.add(i);
            i++;
        }
        return arr;
    }

    public void setArr(ArrayList<Integer> arr) {
        this.arr = arr;
    }
    
    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }
    
    public List<Student> getLst() {
        StudentDAO studentDAO = new StudentDAO();
        if(page.isEmpty()){
            page = "1";
        }
        lst = studentDAO.loadAllStudent(page);
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
