/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app;

import DAO.MailDAO;
import com.opensymphony.xwork2.ActionSupport;
import entities.Account;
import entities.Mail;
import java.util.List;

/**
 *
 * @author DANG
 */
public class ViewInboxActionSupport extends ActionSupport {
    
    private List<Mail> mails;

    public List<Mail> getMails() {
        return mails;
    }

    public void setMails(List<Mail> mails) {
        this.mails = mails;
    }
    
    public ViewInboxActionSupport() {
    }
    
    public String execute() throws Exception {
        Account account = new Account();
        account.setEmail("staff1@fpt.com");
        MailDAO mailDAO = new MailDAO();
        mails = mailDAO.loadInbox(account);
        return "success";
    }
    
}
