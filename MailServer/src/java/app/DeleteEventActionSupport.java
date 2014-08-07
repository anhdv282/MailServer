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
public class DeleteEventActionSupport extends ActionSupport {
    private int eventId;

    EventDAO dAO = new EventDAO();
    public DeleteEventActionSupport() {
    }
    
    public String execute() throws Exception {
        Event event = new Event();
        event.setEventId(eventId);
        if(dAO.deleteEvent(event)){
            return "success";
        }
        return "fail";
    }

    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }
    
}
