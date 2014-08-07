/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app;

import DAO.FeedbackDAO;
import com.opensymphony.xwork2.ActionSupport;
import entities.Feedback;

/**
 *
 * @author DANG
 */
public class AddFeedbackActionSupport extends ActionSupport {
    String name;
    String title;
    String content;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    
    public AddFeedbackActionSupport() {
    }
    
    public String execute() throws Exception {
        Feedback feedback = new Feedback();
        feedback.setEmail(name);
        feedback.setTitle(title);
        feedback.setContent(content);
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        feedbackDAO.sentFeedBack(feedback);
        return "success";
    }
    
}
