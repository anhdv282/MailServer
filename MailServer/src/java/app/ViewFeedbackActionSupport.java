/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app;

import DAO.FeedbackDAO;
import com.opensymphony.xwork2.ActionSupport;
import entities.Feedback;
import java.util.List;

/**
 *
 * @author DANG
 */
public class ViewFeedbackActionSupport extends ActionSupport {
    List<Feedback> lst;

    public List<Feedback> getLst() {
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        lst = feedbackDAO.loadFeedback();
        return lst;
    }

    public void setLst(List<Feedback> lst) {
        this.lst = lst;
    }
    
    public ViewFeedbackActionSupport() {
    }
    
    public String execute() throws Exception {
        return "success";
    }
    
}
