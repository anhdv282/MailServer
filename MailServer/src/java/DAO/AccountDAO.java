/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import entities.Account;
import java.util.ArrayList;
import java.util.List;
import util.dbUtil;

/**
 *
 * @author DucNM
 */
public class AccountDAO {
    private dbUtil util = new dbUtil();
    
    public List<Account> getAllStudents() {
        List<Account> accounts = new ArrayList<>();
        return accounts;
    }
    
    public List<Account> getAllStaffs() {
        List<Account> accounts = new ArrayList<>();
        return accounts;
    }
}