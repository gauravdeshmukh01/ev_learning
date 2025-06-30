package com.infosys.RestAPI.controller;

import com.infosys.RestAPI.model.Employee;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/employee")
public class EmployeeAPIService {

    Employee employee;

    @GetMapping("{empId}")
    public Employee getEmployeeDetails(@PathVariable String empId){
        return employee;
    }

    @PostMapping
    public String createEmployee(@RequestBody Employee employee){
        this.employee = employee;
        return "employee created successfully";
    }

    @PutMapping
    public String updateEmployeeDetails(@RequestBody Employee employee){
        this.employee = employee;
        return "employee updated successfuly";
    }

    @DeleteMapping("{empId}")
    public String deleteEmployeeById(String empId){
        this.employee = null;
        return "employee deleted successfully";
    }

}
