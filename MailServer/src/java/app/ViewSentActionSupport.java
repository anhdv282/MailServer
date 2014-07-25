/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app;

import DAO.MailDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import entities.Account;
import entities.Mail;
import java.util.List;
import java.util.Map;

/**
 *
 * @author DANG
 */
public class ViewSentActionSupport extends ActionSupport {
    private List<Mail> mails;

    public List<Mail> getMails() {
        return mails;
    }

    public void setMails(List<Mail> mails) {
        this.mails = mails;
    }
    
    public ViewSentActionSupport() {
    }
    
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        Account account = (Account)session.get("User");
        MailDAO mailDAO = new MailDAO();
        mails = mailDAO.loadSent(account);
        return "success";
    }
    
}
