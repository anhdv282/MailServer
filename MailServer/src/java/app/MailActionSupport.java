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
import util.Validator;

/**
 *
 * @author DucNM
 */
public class MailActionSupport extends ActionSupport {
    
    String url;
    String[] receivers;
    String subject;
    String content;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String[] getReceivers() {
        return receivers;
    }

    public void setReceivers(String Receivers) {
        this.receivers= Receivers.split(";");
    }
    
    public void setReceivers(String[] Receivers) {
        this.receivers= Receivers;
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
        Mail mail = new Mail();
        mail.setSender(send);
        for (String string : receivers) {
            Account receive = new Account();
            receive.setEmail(string);
            mail.getReceivers().add(receive);
        }
        mail.setSubject(subject);
        mail.setContent(content);
        MailDAO dAO = new MailDAO();
        boolean check = dAO.composeMail(mail);
        System.out.println(check);
        if (check) {
            dAO.sendMail(mail);            
            return send.getAccType();
        }
        return "fail";
    }

    @Override
    public void validate() {
        if (getReceivers().length == 0) {
            addFieldError("receivers", "receiver required!");
        } else {
            for (String mail : receivers) {
                if (!new Validator().checkEmail(mail)) {
                    addFieldError("receivers", "Invalid Email!");
                    break;
                }
            }
        }
    }
}
