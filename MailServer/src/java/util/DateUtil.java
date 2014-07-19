/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package util;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 *
 * @author DucNM
 */
public class DateUtil {
    
    public static String getDate() {
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        Calendar c = Calendar.getInstance();
        String date = dateFormat.format(c.getTime());
        return date;
    }
    
    public static String getDateConvert(java.util.Date date) {
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        String dateConvert = dateFormat.format(date.getTime());
        return dateConvert;
    }
    
    //this method is used to convert sqldate to string format date
    public static String getDate(Date sqlDate) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String date = dateFormat.format(sqlDate.getTime());
        return date;
    }
    
    //this method is used to get current sqldate in dd/mm/yy format
    public static Date getSQLDate() {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar c = Calendar.getInstance();
        String date = dateFormat.format(c.getTime());
        Date sqlDate = Date.valueOf(date);
        return sqlDate;
    } 
    
    //this method is used to convert string format date to sqldate
    public static Date getSQLDate(String date) {
        String[] datePart = date.split("/");
        String cDate = datePart[2] + "-" + datePart[1] + "-" + datePart[0];
        Date sqlDate = Date.valueOf(cDate);
        return sqlDate;
    }
    
}
