package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entity.Expense;
import com.entity.User;

public class ExpenseDao {
	private SessionFactory factory = null;
	private Session session = null;
	private Transaction tx = null;

	public ExpenseDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	public boolean saveExpense(Expense ex) {
		boolean f = false;
		try {
			session = factory.openSession();
			tx = session.beginTransaction();
			session.save(ex);

			tx.commit();
			f = true;
		} catch (Exception e) {
			// TODO: handle exception
			if (tx != null) {
				f = false;
				e.printStackTrace();
			}

		}
		return f;
	}

	public List<Expense> getAllExpenseByUser(User user) {
		List<Expense> list = new ArrayList<>();
		try {
			session = factory.openSession();
			// Use typed query with named parameter :us
			Query<Expense> q = session.createQuery("from Expense where user = :us", Expense.class);
			q.setParameter("us", user); // set named parameter properly
			list = q.list(); // no arguments here
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public Expense getExpenseById(int id) {
		Expense ex = null;
		try {
			session = factory.openSession();
			Query q = session.createQuery("from Expense where id=:id");

			q.setParameter("id", id);
			ex = (Expense) q.uniqueResult();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return ex;
	}

	public boolean updateExpense(Expense ex) {
		boolean f = false;
		try {
			session = factory.openSession();
			tx = session.beginTransaction();
			session.saveOrUpdate(ex);

			tx.commit();
			f = true;
		} catch (Exception e) {
			// TODO: handle exception
			if (tx != null) {
				f = false;
				e.printStackTrace();
			}

		}
		return f;
	}

	public boolean deleteExpense(int id) {
		boolean f = false;
		try {
			session = factory.openSession();
			tx = session.beginTransaction();
			Expense ex = session.get(Expense.class, id);
			session.delete(ex);
			tx.commit();
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}

		return f;
	}
}