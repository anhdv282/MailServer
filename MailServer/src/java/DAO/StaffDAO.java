/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import entities.Staff;
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
public class StaffDAO {
    private DbUtil util = new DbUtil();

    public List<Staff> loadAllStaff() {
        List<Staff> lst = new ArrayList<Staff>();
        try {
                
            Connection conn = util.getConnection();
            CallableStatement stm = conn.prepareCall("{call GetAllStaff}");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Staff s = new Staff();
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
}
