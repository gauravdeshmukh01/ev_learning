package com.infosys.employeeMysqlRestApi.controller;

import com.infosys.employeeMysqlRestApi.model.Employee;
import com.infosys.employeeMysqlRestApi.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    @GetMapping("{employeeId}")
    public Employee getEmployee(@PathVariable("employeeId") String employeeId){
        return employeeService.getEmployee(employeeId);
    }

    @GetMapping
    public List<Employee> getAllEmployee(){
        return employeeService.getAllEmployee();
    }

    @PostMapping
    public String createEmployee(@RequestBody Employee employee){
        employeeService.createEmployee(employee);
        return "employee created successfully";
    }

    @PutMapping
    public String updateEmployee(@RequestBody Employee employee){
        employeeService.updateEmployee(employee);
        return "employee updated successfully";
    }

    @DeleteMapping("{employeeId}")
    public String deleteEmployee(@PathVariable("employeeId") String employeeId){
        employeeService.deleteEmployee(employeeId);
        return "employee deleted successfully";
    }
}
