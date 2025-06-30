package com.infosys.RestAPI.model;

public class Employee {

    private String empId;
    private String empname;
    private String empDept;
    private String empSalary;


    public Employee(){}

    public Employee(String empId, String empname, String empDept, String empSalary) {
        this.empId = empId;
        this.empname = empname;
        this.empDept = empDept;
        this.empSalary = empSalary;
    }

    public String getEmpId() {
        return empId;
    }

    public void setEmpId(String empId) {
        this.empId = empId;
    }

    public String getEmpname() {
        return empname;
    }

    public void setEmpname(String empname) {
        this.empname = empname;
    }

    public String getEmpDept() {
        return empDept;
    }

    public void setEmpDept(String empDept) {
        this.empDept = empDept;
    }

    public String getEmpSalary() {
        return empSalary;
    }

    public void setEmpSalary(String empSalary) {
        this.empSalary = empSalary;
    }
}
