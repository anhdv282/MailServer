/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app;

import DAO.CourseDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import entities.Account;
import entities.Course;
import java.util.List;
import java.util.Map;

/**
 *
 * @author DANG
 */
public class ViewCourseActionSupport extends ActionSupport {
    private List<Course> lst;

    public List<Course> getLst() {
        CourseDAO dAO = new CourseDAO();
        lst = dAO.getCourse();
        return lst;
    }

    public void setLst(List<Course> lst) {
        this.lst = lst;
    }
    
    public ViewCourseActionSupport() {
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
