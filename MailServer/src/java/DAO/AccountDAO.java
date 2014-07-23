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
    
    public List<Account> getAllStudents() {
        List<Account> accounts = new ArrayList<>();
        try {
            Connection conn = util.getConnection();
            CallableStatement stm = conn.prepareCall("{call GetAllStudent}");
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Account account = new Account();
                accounts.add(account);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return accounts;
    }
    
    public List<Account> getAllStaffs() {
        List<Account> accounts = new ArrayList<>();
        try {
            Connection conn = util.getConnection();
            CallableStatement stm = conn.prepareCall("{call GetAllStaff}");
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Account account = new Account();
                accounts.add(account);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return accounts;
    }
}
