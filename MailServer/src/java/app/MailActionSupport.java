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
import java.util.Map;

/**
 *
 * @author DucNM
 */
public class MailActionSupport extends ActionSupport {
    
    String receiver;
    String subject;
    String content;

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String Receiver) {
        this.receiver = Receiver;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String Subject) {
        this.subject = Subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String Content) {
        this.content = Content;
    }
    
    public MailActionSupport() {
    }
    
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        Account send = (Account)session.get("User");
        Account receive = new Account();
        receive.setEmail(receiver);
        Mail mail = new Mail();
        mail.setSender(send);
        mail.getReceivers().add(receive);
        mail.setSubject(subject);
        mail.setContent(content);
        MailDAO dAO = new MailDAO();
        boolean check = dAO.composeMail(mail);
        System.out.println(check);
        if (check) {
            dAO.sendMail(mail);
            return "success";
        }
        return "fail";
    }

    @Override
    public void validate() {
        if (getReceiver().length() == 0) {
            addFieldError("receiver", getText("receiver required"));
        }
    }
}
