/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author asus
 */
public class StudentClasses {
      private int id;
    private int studentId;
    private String className;
    private String classCode;

    public StudentClasses() {
    }

    public StudentClasses(int id, int studentId, String className, String classCode) {
        this.id = id;
        this.studentId = studentId;
        this.className = className;
        this.classCode = classCode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getClassCode() {
        return classCode;
    }

    public void setClassCode(String classCode) {
        this.classCode = classCode;
    }
    
    
}
