/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import entities.Account;
import java.sql.CallableStatement;
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
    
    public boolean checkLogin(Account account) {
        boolean check = false;
        
        try {
            Connection con = util.getConnection();
            CallableStatement stm = con.prepareCall("{call CheckLogin(?,?)}");            
            stm.setString(1, account.getEmail());
            stm.setString(2, account.getPass());
            ResultSet rs = stm.executeQuery();
            check = rs.next();
            if (check){
                account.setId(rs.getInt(1));
                account.setRole(rs.getString(2));
                account.setName(rs.getString(5));
                account.setAddress(rs.getString(6));
                account.setDob(rs.getString(7));
                account.setPhoto(rs.getString(8));
                account.setDate(rs.getString(9));
                account.setStatus(rs.getInt(10));
            }
            rs.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(LoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }
    
}
