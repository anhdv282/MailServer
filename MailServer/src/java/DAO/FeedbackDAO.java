/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import entities.Feedback;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.DbUtil;

/**
 *
 * @author DANG
 */
public class FeedbackDAO {
    DbUtil util = new DbUtil();
    public boolean sentFeedBack(Feedback feedback){
        try {
            Connection conn = util.getConnection();
            CallableStatement stm = conn.prepareCall("{call SentFeedBack(?,?,?)}");
            stm.setString(1, feedback.getEmail());
            stm.setString(2, feedback.getTitle());
            stm.setString(3, feedback.getContent());
            stm.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public List<Feedback> loadFeedback(){
        List<Feedback> lst = new ArrayList<Feedback>();
        try {
            Connection conn = util.getConnection();
            CallableStatement stm = conn.prepareCall("{call GetAllFeedback}");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setFeedId(rs.getInt(1));
                feedback.setEmail(rs.getString(2));
                feedback.setTitle(rs.getString(3));
                feedback.setDate(rs.getString(4));
                lst.add(feedback);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lst;
    }
    
    public Feedback getFeedbackById(int id){
        try {
            Connection conn = util.getConnection();
            CallableStatement stm = conn.prepareCall("{call GetFeedbackById(?)}");
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                Feedback feedback = new Feedback();
                feedback.setEmail(rs.getString(1));
                feedback.setTitle(rs.getString(2));
                feedback.setContent(rs.getString(3));
                feedback.setDate(rs.getString(4));
                conn.close();
                return feedback;
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
