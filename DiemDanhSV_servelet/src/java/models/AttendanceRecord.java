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
public class AttendanceRecord {

     private int attendanceID;
    private int teacherID;
    private int studentID;
    private String courseName;
    private String className;
    private int slot;
    private Date date;
    private Integer isPresent;
    private String StudentName;
private int countIsZero;
    private int totalRecords;
    private double zeroPercentage;
    
    // Các getter và setter cho các thuộc tính mới
    public int getCountIsZero() {
        return countIsZero;
    }

    public void setCountIsZero(int countIsZero) {
        this.countIsZero = countIsZero;
    }

    public int getTotalRecords() {
        return totalRecords;
    }

    public void setTotalRecords(int totalRecords) {
        this.totalRecords = totalRecords;
    }

    public double getZeroPercentage() {
        return zeroPercentage;
    }

    public void setZeroPercentage(double zeroPercentage) {
        this.zeroPercentage = zeroPercentage;
    }
    public String getStudentName() {
        return StudentName;
    }

    public void setStudentName(String StudentName) {
        this.StudentName = StudentName;
    }

    public AttendanceRecord(int attendanceID, int teacherID, int studentID, String courseName, String className, int slot, Date date, Integer isPresent, String StudentName) {
        this.attendanceID = attendanceID;
        this.teacherID = teacherID;
        this.studentID = studentID;
        this.courseName = courseName;
        this.className = className;
        this.slot = slot;
        this.date = date;
        this.isPresent = isPresent;
        this.StudentName = StudentName;
    }
    
    public int getAttendanceID() {
        return attendanceID;
    }

    public void setAttendanceID(int attendanceID) {
        this.attendanceID = attendanceID;
    }

    public int getTeacherID() {
        return teacherID;
    }

    public void setTeacherID(int teacherID) {
        this.teacherID = teacherID;
    }

    public int getStudentID() {
        return studentID;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public int getSlot() {
        return slot;
    }

    public void setSlot(int slot) {
        this.slot = slot;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getIsPresent() {
        return isPresent;
    }

    public void setIsPresent(Integer isPresent) {
        this.isPresent = isPresent;
    }

    public AttendanceRecord(int attendanceID, int teacherID, int studentID, String courseName, String className, int slot, Date date, Integer isPresent) {
        this.attendanceID = attendanceID;
        this.teacherID = teacherID;
        this.studentID = studentID;
        this.courseName = courseName;
        this.className = className;
        this.slot = slot;
        this.date = date;
        this.isPresent = isPresent;
    }
    public AttendanceRecord() {
    }

   

    
}
