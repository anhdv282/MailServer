/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app;

import DAO.MailDAO;
import com.opensymphony.xwork2.ActionSupport;
import entities.Mail;

/**
 *
 * @author DANG
 */
public class MailDetailActionSupport extends ActionSupport {
    Mail mail;
    int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public Mail getMail() {
        return mail;
    }

    public void setMail(Mail mail) {
        this.mail = mail;
    }
    public MailDetailActionSupport() {
    }
    
    public String execute() throws Exception {
        MailDAO mailDAO = new MailDAO();
        mail = mailDAO.getMailByID(id);
        return "success";
    }
    
}
