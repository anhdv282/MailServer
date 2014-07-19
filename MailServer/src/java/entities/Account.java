/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entities;

/**
 *
 * @author DucNM
 */
public class Account {
    private int id;
    private String email;
    private String role;
    private String pass;
    private String name;
    private String address;
    private String dob;
    private String photo;
    private String date;
    private int status;

    public Account() {
    }

    public Account(int id, String email, String role, String pass, String name, String address, String dob, String photo, String date, int status) {
        this.id = id;
        this.email = email;
        this.role = role;
        this.pass = pass;
        this.name = name;
        this.address = address;
        this.dob = dob;
        this.photo = photo;
        this.date = date;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
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

    @Override
    public String toString() {
        return this.name; //To change body of generated methods, choose Tools | Templates.
    }
    
}
