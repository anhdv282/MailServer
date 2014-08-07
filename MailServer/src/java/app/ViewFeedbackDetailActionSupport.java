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
public class ViewFeedbackDetailActionSupport extends ActionSupport {
    Feedback feedback;
    int id;

    public Feedback getFeedback() {
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        feedback = feedbackDAO.getFeedbackById(id);
        return feedback;
    }

    public void setFeedback(Feedback feedback) {
        this.feedback = feedback;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public ViewFeedbackDetailActionSupport() {
    }
    
    public String execute() throws Exception {
        return "success";
    }
    
}
