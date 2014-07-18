/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app;

import DAO.EventDAO;
import com.opensymphony.xwork2.ActionSupport;
import entities.Event;
import java.util.List;

/**
 *
 * @author DANG
 */
public class ViewEventActionSupport extends ActionSupport {
    private List<Event> lst;
    public ViewEventActionSupport() {
    }

    public List<Event> getLst() {
        EventDAO dAO = new EventDAO();
        lst = dAO.ViewEvents();
        return lst;
    }

    public void setLst(List<Event> lst) {
        this.lst = lst;
    }
    
    public String execute() throws Exception {
        return "success";
    }
    
}
