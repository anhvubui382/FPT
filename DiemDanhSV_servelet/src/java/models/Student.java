/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author asus
 */
public class Student {

    private int studentID;
    private String studentName;
    private String email;
    private String password;
    private String gender;
    private String mobilePhone;

    public Student(int studentID, String studentName, String email, String password, String gender, String mobilePhone) {
        this.studentID = studentID;
        this.studentName = studentName;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.mobilePhone = mobilePhone;
    }

    public String getMobilePhone() {
        return mobilePhone;
    }

    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
    }
    
    public Student() {
    }

    public Student(int studentID, String studentName, String email, String password, String gender) {
        this.studentID = studentID;
        this.studentName = studentName;
        this.email = email;
        this.password = password;
        this.gender = gender;
    }

    public int getStudentID() {
        return studentID;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

}
