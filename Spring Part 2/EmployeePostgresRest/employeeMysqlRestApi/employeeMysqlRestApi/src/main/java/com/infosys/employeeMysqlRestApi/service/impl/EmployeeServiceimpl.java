package com.infosys.employeeMysqlRestApi.service.impl;

import com.infosys.employeeMysqlRestApi.model.Employee;
import com.infosys.employeeMysqlRestApi.repository.EmployeeRepository;
import com.infosys.employeeMysqlRestApi.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceimpl implements EmployeeService {

    @Autowired
    EmployeeRepository employeeRepository;

    @Override
    public String createEmployee(Employee employee) {
        employeeRepository.save(employee);
        return "success";
    }

    @Override
    public String updateEmployee(Employee employee) {
        employeeRepository.save(employee);
        return "success";
    }

    @Override
    public String deleteEmployee(String employeeId) {
        employeeRepository.deleteById(employeeId);
        return "success";
    }

    @Override
    public Employee getEmployee(String employeeId) {
        return employeeRepository.findById(employeeId).orElse(null);
    }

    @Override
    public List<Employee> getAllEmployee() {
        return employeeRepository.findAll();
    }
}
