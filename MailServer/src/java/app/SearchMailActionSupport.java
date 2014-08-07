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
 * @author DucNM
 */
public class SearchMailActionSupport extends ActionSupport {
    
    String search;
    String action;

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }
    
    private List<Mail> mails;

    public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search;
    }

    public List<Mail> getMails() {
        return mails;
    }

    public void setMails(List<Mail> mails) {
        this.mails = mails;
    }
    
    public SearchMailActionSupport() {
    }
    
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        Account account = (Account)session.get("User");
        MailDAO mailDAO = new MailDAO();
        
        if(action.equalsIgnoreCase("sent")){
            mails = mailDAO.searchSent(account, search);
        }
        else if(action.equalsIgnoreCase("inbox")){
            mails = mailDAO.searchInbox(account, search);
        }
            
        return "success";
    }
    
}
