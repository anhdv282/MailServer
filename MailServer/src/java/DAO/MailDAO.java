/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import entities.Account;
import entities.Mail;
import entities.Student;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.DbUtil;

/**
 *
 * @author DucNM
 */
public class MailDAO {
    private DbUtil util = new DbUtil();
    
    public List<Mail> loadInbox(Account account) {
        List<Mail> mails = new ArrayList<>();
        try {
            Connection con = util.getConnection();
            CallableStatement stm = con.prepareCall("{call LoadInboxMail(?)}");
            stm.setString(1, account.getEmail());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Mail mail = new Mail();
                mail.setId(rs.getInt(1));
                mail.setSubject(rs.getString(2));
                mail.setContent(rs.getString(3));
                mail.setDate(rs.getString(4));
                mail.setStatus(rs.getInt(1));
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
            stm.setString(1, account.getEmail());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Mail mail = new Mail();
                mail.setId(rs.getInt(1));
                mail.setSubject(rs.getString(2));
                mail.setContent(rs.getString(3));
                mail.setDate(rs.getString(4));
                mail.setStatus(rs.getInt(1));
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
            CallableStatement stm = con.prepareCall("{? = call InsertMail(?,?,?)}");
            stm.registerOutParameter(1, Types.INTEGER);
            stm.setString(2, mail.getSender().getEmail());
            stm.setString(3, mail.getSubject());
            stm.setString(4, mail.getContent());
            stm.executeUpdate();
            mail.setId(stm.getInt(1));
            con.close();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(MailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public void sendMail(Mail mail) {
        try {
            Connection con = util.getConnection();
            con.setAutoCommit(false);
            CallableStatement stm = con.prepareCall("{call SendMail(?,?)}");
            for (Account a : mail.getReceivers()) {
                stm.setInt(1, mail.getId());
                stm.setString(2, a.getEmail());
                stm.addBatch();
            }
            stm.executeBatch();
            con.commit();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(MailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
