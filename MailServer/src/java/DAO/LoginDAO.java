/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.dbUtil;

/**
 *
 * @author DANG
 */
public class LoginDAO {
    dbUtil util = new dbUtil();
    public boolean checkStudent(String u, String p) {
        boolean check = false;
        String sql = "select * from tblAccount where emailId = ? and pass = ? and roleId = 3";
        try {
            PreparedStatement stm = util.getConnection().prepareStatement(sql);
            stm.setString(1, u);
            stm.setString(2, p);
            ResultSet rs = stm.executeQuery();
            check = rs.next();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(LoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }
    
    public boolean checkAdmin(String u,String p){
        boolean result = false;
        String sql = "SELECT * FROM tblAccount WHERE emailId = ? and pass = ? and roleId = 1";
        try {
            PreparedStatement ps = util.getConnection().prepareStatement(sql);
            ps.setString(1, u);
            ps.setString(2, p);
            ResultSet rs = ps.executeQuery();
            result = rs.next();
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(LoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public boolean checkStaff(String u,String p){
        boolean result = false;
        String sql = "SELECT * FROM tblAccount WHERE emailId = ? and pass = ? and roleId = 2";
        try {
            PreparedStatement ps = util.getConnection().prepareStatement(sql);
            ps.setString(1, u);
            ps.setString(2, p);
            ResultSet rs = ps.executeQuery();
            result = rs.next();
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(LoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}
