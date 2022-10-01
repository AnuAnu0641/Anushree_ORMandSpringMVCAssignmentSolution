package com.gl.customer.service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.HibernateException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gl.customer.entity.Customer;

@Repository
public class CustomerServiceImpl implements CustomerService {
	
	private SessionFactory sessionFactory;
	private Session session;
	
	@Autowired
	public CustomerServiceImpl(SessionFactory sessionFactory) {
		this.sessionFactory=sessionFactory;
		try {
			this.session=sessionFactory.getCurrentSession();
		}
		catch(HibernateException e) {
			this.session=sessionFactory.openSession();
		}
	}

	@Override
	public List<Customer> findAll() {
		List<Customer> customerList = session.createQuery("from Customer").list();
		return customerList;
	}

	@Override
	public Customer findById(int theId) {
		Customer customer = new Customer();
		customer = session.get(Customer.class, theId);
		return customer;
	}

	@Override
	@Transactional
	public void save(Customer theCustomer) {
		Transaction tx = session.beginTransaction();
		try {			
			session.saveOrUpdate(theCustomer);
			tx.commit();
		}
		catch(HibernateException e) {
			e.printStackTrace();
			tx.rollback();
		}
	}

	@Override
	@Transactional
	public void deleteById(int theId) {
		Transaction tx = session.beginTransaction();
		try {
			Customer customer = session.get(Customer.class, theId);
			session.delete(customer);
			tx.commit();
		}
		catch(HibernateException e) {
			e.printStackTrace();
			tx.rollback();
		}
	}

}
