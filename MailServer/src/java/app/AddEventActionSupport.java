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
public class AddEventActionSupport extends ActionSupport {
    private String title;
    private String author;
    private String content;
    private String photo;
    EventDAO dAO = new EventDAO();
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }
    public AddEventActionSupport() {
    }
    
    public String execute() throws Exception {
        Event event = new Event();
        event.setTitle(title);
        event.setAuthor(author);
        event.setContent(content);
        event.setPhoto(photo);
        if(dAO.addEvent(event)){
            return "success";
        }
        return "fail";
    }

    @Override
    public void validate() {
        if(getTitle().length()==0){
            addFieldError("title", "title required");
        }
    }
    
}
