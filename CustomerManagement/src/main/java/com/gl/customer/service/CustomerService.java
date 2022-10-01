package com.gl.customer.service;

import java.util.List;

import com.gl.customer.entity.Customer;

public interface CustomerService {

	public List<Customer> findAll();

	public Customer findById(int id);

	public void save(Customer theCustomer);

	public void deleteById(int id);

}
