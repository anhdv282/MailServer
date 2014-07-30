/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app;

import DAO.EventDAO;
import com.opensymphony.xwork2.ActionSupport;
import entities.Event;

/**
 *
 * @author DANG
 */

public class EventDetailActionSupport extends ActionSupport {
    Event event;
    int id;

    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public EventDetailActionSupport() {
    }
    
    public String execute() throws Exception {
        EventDAO eventDAO = new EventDAO();
        event = eventDAO.loadEventById(id);
        return "success";
    }
    
}
