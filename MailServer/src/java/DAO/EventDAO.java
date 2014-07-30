/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import entities.Event;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.DateUtil;
import util.DbUtil;

/**
 *
 * @author DANG
 */
public class EventDAO {
    
    DbUtil util = new DbUtil();
    
    public List<Event> ViewEvents(){
        List<Event> lst = new ArrayList<>();
        try {
            Connection conn = util.getConnection();
            CallableStatement stm = conn.prepareCall("{call LoadEvents}");
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Event event = new Event();
                event.setEventId(rs.getInt(1));
                event.setTitle(rs.getString(2));
                event.setAuthor(rs.getString(3));
                event.setContent(rs.getString(4));
                event.setPhoto(rs.getString(5));
                event.setDate(DateUtil.getDateConvert(rs.getDate(6)));
                lst.add(event);
            }
            conn.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(EventDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lst;
    }
    
    public boolean addEvent(Event event) {
        try {
            Connection conn = util.getConnection();
//            CallableStatement stm = conn.prepareCall("AddNewEvent(?,?,?,?)");
            CallableStatement stm = conn.prepareCall("{? = call AddNewEvent(?,?,?,?)}");
            stm.registerOutParameter(1, Types.INTEGER);
            stm.setString(2, event.getTitle());
            stm.setString(3, event.getAuthor());
            stm.setString(4, event.getContent());
            stm.setString(5, event.getPhoto());
            stm.executeUpdate();
            event.setEventId(stm.getInt(1));
            conn.close();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(EventDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean updateEvent(Event event) {
        try {
            Connection conn = util.getConnection();
            CallableStatement stm = conn.prepareCall("{call UpdateEvent(?,?,?,?,?)}");
            stm.setInt(1, event.getEventId());
            stm.setString(2, event.getTitle());
            stm.setString(3, event.getAuthor());
            stm.setString(4, event.getContent());
            stm.setString(5, event.getPhoto());
            stm.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(EventDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean deleteEvent(Event event) {
        try {
            Connection conn = util.getConnection();
            CallableStatement stm = conn.prepareCall("{call DeleteEvents(?)}");
            stm.setInt(1, event.getEventId());
            stm.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(EventDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public Event loadEventById(int id){
        try {
            Connection conn = util.getConnection();
            CallableStatement stm = conn.prepareCall("{call LoadEventDetailById(?)}");
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                Event event = new Event();
                event.setEventId(rs.getInt(1));
                event.setTitle(rs.getString(2));
                event.setAuthor(rs.getString(3));
                event.setContent(rs.getString(4));
                event.setDate(rs.getString(5));
                event.setPhoto(rs.getString(6));
                conn.close();
                return event;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(EventDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
