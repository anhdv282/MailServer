/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import entities.Account;
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
 * @author DucNM
 */
public class AccountDAO {
    private DbUtil util = new DbUtil();
    
    public boolean checkMail(String mail) {
        boolean check = false;
        try {
            Connection conn = util.getConnection();
            CallableStatement stm = conn.prepareCall("{call CheckMail(?)}");
            stm.setString(1, mail);
            ResultSet rs = stm.executeQuery();
            check = rs.next();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }
}
