/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app;

import DAO.MailDAO;
import com.opensymphony.xwork2.ActionSupport;
import entities.Mail;
import java.util.List;

/**
 *
 * @author DANG
 */
public class ViewInboxActionSupport extends ActionSupport {
    private List<Mail> lst;

    public List<Mail> getLst() {
        MailDAO mailDAO = new MailDAO();
        lst = mailDAO.loadInbox(null);
        return lst;
    }

    public void setLst(List<Mail> lst) {
        this.lst = lst;
    }
    
    public ViewInboxActionSupport() {
    }
    
    public String execute() throws Exception {
        return "success";
    }
    
}
