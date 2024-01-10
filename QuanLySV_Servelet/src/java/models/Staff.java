/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.sql.Date;

/**
 *
 * @author asus
 */
public class Staff {

    private int id;
    private String fullName;
    private Date dateOfBirth;
    private String gender;
    private String email;
    private String phone;
    private String address;
    private String department;
    private int role;
    private String Password;
    private int status;
    private int request_Type;

    public int getRequest_Type() {
        return request_Type;
    }

    public void setRequest_Type(int request_Type) {
        this.request_Type = request_Type;
    }

    public Staff(int id, String fullName, Date dateOfBirth, String gender, String email, String phone, String address, String department, int role, String Password, int status, int request_Type) {
        this.id = id;
        this.fullName = fullName;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.department = department;
        this.role = role;
        this.Password = Password;
        this.status = status;
        this.request_Type = request_Type;
    }

    

    
   
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Staff(int id, String fullName, Date dateOfBirth, String gender, String email, String phone, String address, String department, int role, String Password, int status) {
        this.id = id;
        this.fullName = fullName;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.department = department;
        this.role = role;
        this.Password = Password;
        this.status = status;
    }

    public Staff(int id, String fullName, Date dateOfBirth, String gender, String email, String phone, String address, String department, int role, String Password) {
        this.id = id;
        this.fullName = fullName;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.department = department;
        this.role = role;
        this.Password = Password;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public Staff() {
    }

    public Staff(int id, String fullName, Date dateOfBirth, String gender, String email, String phone, String address, String department, int role) {
        this.id = id;
        this.fullName = fullName;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.department = department;
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

}
