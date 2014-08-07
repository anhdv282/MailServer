/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app;

import DAO.CourseDAO;
import DAO.StudentDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import entities.Account;
import entities.Course;
import entities.Student;
import java.util.List;
import java.util.Map;

/**
 *
 * @author DANG
 */
public class ViewStudentByCourseActionSupport extends ActionSupport {
    
    int id;
    Course course;

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public ViewStudentByCourseActionSupport() {
    }
    
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        Account account = (Account)session.get("User");
        course = new CourseDAO().getCourseById(id);
        if(account!= null && account.getAccType().equalsIgnoreCase("admin"))
        {
            return "admin";
        }
        return "success";
    }
    
}
