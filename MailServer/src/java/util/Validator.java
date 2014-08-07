/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author DucNM
 */
public class Validator {
    
    public boolean checkEmail(String email) {
        //this method is used to validate email data
        Pattern p = Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
        Matcher m = p.matcher(email);
        return m.matches();
    }
    
    public boolean checkNumber(String number) {
        //this method is used to validate number data (product stock, product quantity in each order)
        Pattern p = Pattern.compile("[0-9]*");
        Matcher m = p.matcher(number);
        return m.matches();
    }
    
    public boolean checkMoney(String money) {
        //this method is used to validate money data (employee salary, product price)
        Pattern p = Pattern.compile("[0-9]*(\\.[0-9])?");
        Matcher m = p.matcher(money);
        return m.matches();
    }
}
