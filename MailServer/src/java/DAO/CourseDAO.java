/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import entities.Course;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.DbUtil;

/**
 *
 * @author DANG
 */
public class CourseDAO {
    private DbUtil util = new DbUtil();
    public List<Course> getCourse(){
        try {
            List<Course> lst = new ArrayList<>();
            Connection conn = util.getConnection();
            CallableStatement stm = conn.prepareCall("{call GetCourse}");
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Course course = new Course();                
                course.setCourseName(rs.getString(1)); 
                course.setCourseId(rs.getInt(2));
                lst.add(course);
            }
            conn.close();
            return lst;
        } catch (SQLException ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public Course getCourseById(int id){
        Course course = new Course();
        try {
            Connection con = util.getConnection();
            CallableStatement stm = con.prepareCall("{call GetCourseById(?)}");
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()){
                course.setCourseId(rs.getInt(1));
                course.setCourseName(rs.getString(2));
                course.setTeacher(new StaffDAO().getStaffById(rs.getInt(3)));
                course.getStudents().add(new StudentDAO().studentById(rs.getInt(4)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return course;
    }
}
