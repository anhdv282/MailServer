/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import entities.Student;
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
public class StudentDAO {

    private DbUtil util = new DbUtil();

    public List<Student> loadAllStudent() {
        List<Student> lst = new ArrayList<Student>();
        try {
                
            Connection conn = util.getConnection();
            CallableStatement stm = conn.prepareCall("{call GetAllStudent}");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt(1));
                s.setEmailId(rs.getString(2));
                s.setName(rs.getString(3));
                s.setAddress(rs.getString(4));
                s.setDob(rs.getString(5));
                s.setPhoto(rs.getString(6));
                s.setCreated(rs.getString(7));
                s.setStatus(rs.getInt(8));
                lst.add(s);
                
                
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lst;
    }
    
    public Student studentById(int id){
        
        try {
            Connection conn = util.getConnection();
            CallableStatement stm = conn.prepareCall("{call GetStudentById(?)}");
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                Student s = new Student();
                s.setId(rs.getInt(1));
                s.setEmailId(rs.getString(2));
                s.setName(rs.getString(3));
                s.setAddress(rs.getString(4));
                s.setDob(rs.getString(5));
                s.setPhoto(rs.getString(6));
                s.setCreated(rs.getString(7));
                s.setStatus(rs.getInt(8));
                conn.close();
                return s;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public Student studentByMail(String mailId){
        
        try {
            Connection conn = util.getConnection();
            CallableStatement stm = conn.prepareCall("{call GetStudentByMail(?)}");
            stm.setString(1, mailId);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                Student s = new Student();
                s.setId(rs.getInt(1));
                s.setEmailId(rs.getString(2));
                s.setName(rs.getString(3));
                s.setAddress(rs.getString(4));
                s.setDob(rs.getString(5));
                s.setPhoto(rs.getString(6));
                s.setCreated(rs.getString(7));
                s.setStatus(rs.getInt(8));
                conn.close();
                return s;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public boolean updateStudent(Student s){
        try {
            Connection conn = util.getConnection();
            CallableStatement stm = conn.prepareCall("{call UpdateStudent(?,?,?,?,?)}");
            stm.setString(1, s.getEmailId());
            stm.setString(2,s.getName());
            stm.setString(3, s.getAddress());
            stm.setString(4, s.getDob());
            stm.setString(5, s.getPhoto());
            stm.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public List<Student> loadStudentByCourse(int id){
        List<Student> lst = new ArrayList<Student>();
        try {
            Connection conn = util.getConnection();
            CallableStatement stm = conn.prepareCall("{call GetStudentsByCourse(?)}");
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Student s = studentById(rs.getInt(3));
                lst.add(s);    
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lst;
    }
    
    public boolean addStudent(Student s){
        try {
            Connection conn = util.getConnection();
            CallableStatement stm = conn.prepareCall("{call AddStudent(?,?,?,?,?)}");
            stm.setString(1, s.getEmailId());
            stm.setString(2,s.getName());
            stm.setString(3, s.getAddress());
            stm.setString(4, s.getDob());
            stm.setString(5, s.getPhoto());
            stm.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
