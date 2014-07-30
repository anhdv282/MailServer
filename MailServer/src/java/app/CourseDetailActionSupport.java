/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app;

import DAO.CourseDAO;
import com.opensymphony.xwork2.ActionSupport;
import entities.Course;

/**
 *
 * @author DANG
 */
public class CourseDetailActionSupport extends ActionSupport {
    Course course;
    int id;

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
    
    public CourseDetailActionSupport() {
    }
    
    public String execute() throws Exception {
        CourseDAO courseDAO = new CourseDAO();
        //lam tiep
        return "success";
    }
    
}
