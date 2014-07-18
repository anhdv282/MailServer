/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entities;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DucNM
 */
public class Mail {
    
    public static int READED = 1;
    public static int UNREADED = 0;
    
    private int id;
    private Account sender;
    private List<Account> receivers;
    private String subject;
    private String content;
    private String date;
    private int status;

    public Mail() {
        this.id = 0;
        this.sender = new Account();
        this.receivers = new ArrayList<>();
        this.subject = "";
        this.content = "";
        this.date = "";
        this.status = UNREADED;
    }

    public Mail(int id, Account sender, List<Account> receivers, String subject, String content, String date, int status) {
        this.id = id;
        this.sender = sender;
        this.receivers = receivers;
        this.subject = subject;
        this.content = content;
        this.date = date;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Account getSender() {
        return sender;
    }

    public void setSender(Account sender) {
        this.sender = sender;
    }

    public List<Account> getReceivers() {
        return receivers;
    }

    public void setReceivers(List<Account> receivers) {
        this.receivers = receivers;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
}
