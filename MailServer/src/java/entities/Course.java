/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entities;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DANG
 */
public class Course {
    private int courseId;
    private String courseName;
    private Staff teacher;
    private List<Student> students;

    public Course() {
        this.courseId = -1;
        this.courseName = "";
        this.teacher = new Staff();
        this.students = new ArrayList<>();
    }

    public Course(int courseId, String courseName, Staff teacher, List<Student> students) {
        this.courseId = courseId;
        this.courseName = courseName;
        this.teacher = teacher;
        this.students = students;
    }
    
    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public Staff getTeacher() {
        return teacher;
    }

    public void setTeacher(Staff teacher) {
        this.teacher = teacher;
    }

    public List<Student> getStudents() {
        return students;
    }

    public void setStudents(List<Student> students) {
        this.students = students;
    }
    
}
