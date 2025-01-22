package com.farmfresh1.model;

public class Custormer {
    private String Address;
    private String City;
    private String Contact_no;
    private String Email_Id;
    private String Fullname;
    private String password;
    private String State;

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getCity() {
        return City;
    }

    public void setCity(String city) {
        City = city;
    }

    public String getContact_no() {
        return Contact_no;
    }

    public void setContact_no(String contact_no) {
        Contact_no = contact_no;
    }

    public String getEmail_id() {
        return Email_Id;
    }

    public void setEmail_id(String Email_Id) {
        System.out.println("Email::::::"+Email_Id);
        this.Email_Id = Email_Id;
    }

    public String getFullname() {
        return Fullname;
    }

    public void setFullname(String fullname) {
        Fullname = fullname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getState() {
        return State;
    }

    public void setState(String state) {
        State = state;
    }

}
