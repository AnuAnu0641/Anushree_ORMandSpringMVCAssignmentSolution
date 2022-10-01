package com.gl.customer.controller;

import org.springframework.stereotype.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gl.customer.entity.Customer;
import com.gl.customer.service.CustomerService;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping("/list")
	public String getCustomerList(Model theModel){
		List<Customer> customerList = customerService.findAll();
		theModel.addAttribute("ListOfCustomer", customerList);
		return "customer-list";
	}
	
	@RequestMapping("/displayList")
	public String displayCustomerList(Model theModel) {
		List<Customer> customerList = customerService.findAll();
		theModel.addAttribute("CustomerList", customerList);
		return "display-list";
	}
	
	@RequestMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel) {
		Customer theCustomer = new Customer();
		theModel.addAttribute("AddOrUpdateCustomer", theCustomer);
		return "customer-form";
	}
	
	@RequestMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("customerId") int theId, Model theModel) {
		Customer theCustomer = customerService.findById(theId);
		theModel.addAttribute("AddOrUpdateCustomer", theCustomer);
		return "customer-form";
	}
	
	@PostMapping("/save")
	public String saveStudent(@RequestParam("customerId") int id, @RequestParam("customerFirstName") String firstName, 
							  @RequestParam("customerLastName") String lastName,  @RequestParam("customerEmail") String email) {
		System.out.println("Id is : "+id);
		Customer theCustomer;
		if(id != 0) {
			theCustomer = customerService.findById(id);
			theCustomer.setFirstName(firstName);
			theCustomer.setLastName(lastName);
			theCustomer.setEmail(email);
		}
		else
			theCustomer = new Customer(firstName, lastName, email);
		
		customerService.save(theCustomer);
		return "redirect:/customer/list";
	}
	
	@RequestMapping("/delete")
	public String deleteCustomer(@RequestParam("customerId") int theId) {
		customerService.deleteById(theId);
		return "redirect:/customer/list";
	}

}
