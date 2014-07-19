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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
                Event event = new Event(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
                lst.add(event);
            }
            
            conn.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(EventDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lst;
    }
}
