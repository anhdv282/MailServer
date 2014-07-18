/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import entities.Account;
import entities.Mail;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.dbUtil;

/**
 *
 * @author DucNM
 */
public class MailDAO {
    dbUtil util = new dbUtil();
    
    public List<Mail> loadInbox(Account account) {
        List<Mail> mails = new ArrayList<>();
        try {
            Connection con = util.getConnection();
            CallableStatement stm = con.prepareCall("{call LoadInboxMail(?)}");
            stm.setInt(1, 1);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Mail mail = new Mail();
                mail.setId(stm.getInt(1));
                mail.setSubject(stm.getString(2));
                mail.setContent(stm.getString(3));
                mail.setDate(stm.getString(4));
                mail.setStatus(stm.getInt(1));
                mails.add(mail);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(MailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return mails;
    }
    
    public List<Mail> loadSent(Account account) {
        List<Mail> mails = new ArrayList<>();
        try {
            Connection con = util.getConnection();
            CallableStatement stm = con.prepareCall("{call LoadSentMail(?)}");
            stm.setInt(1, 1);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Mail mail = new Mail();
                mail.setId(stm.getInt(1));
                mail.setSubject(stm.getString(2));
                mail.setContent(stm.getString(3));
                mail.setDate(stm.getString(4));
                mail.setStatus(stm.getInt(1));
                mails.add(mail);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(MailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return mails;
    }
    
    public boolean composeMail(Mail mail) {
        try {
            Connection con = util.getConnection();
            CallableStatement stm = con.prepareCall("{? = call InsertMail(?,?)}");
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(MailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public void sendMail(Mail mail, List<Account> accounts) {
        try {
            Connection con = util.getConnection();
            CallableStatement stm = con.prepareCall("{call SendMail(?,?,?)}");
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(MailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
