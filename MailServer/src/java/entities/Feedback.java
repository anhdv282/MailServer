/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entities;

/**
 *
 * @author DANG
 */
public class Feedback {
    private int feedId;
    private String email;
    private String title;
    private String content;
    private String date;
    private int status;

    public int getFeedId() {
        return feedId;
    }

    public void setFeedId(int feedId) {
        this.feedId = feedId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public Feedback(int feedId, String email, String title, String content, String date, int status) {
        this.feedId = feedId;
        this.email = email;
        this.title = title;
        this.content = content;
        this.date = date;
        this.status = status;
    }

    public Feedback() {
    }
    
}
