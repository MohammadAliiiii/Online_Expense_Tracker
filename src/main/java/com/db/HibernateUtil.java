package com.db;

import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import com.entity.Expense;
import com.entity.User;

public class HibernateUtil {

	private static SessionFactory sessionFactory;

	public static SessionFactory getSessionFactory() {
		if (sessionFactory == null) {
			try {
				Configuration configuration = new Configuration();

				// ✅ Essential 20% Properties that matter the most
				Properties settings = new Properties();
				settings.put(Environment.DRIVER, "com.mysql.cj.jdbc.Driver");
				settings.put(Environment.URL, "jdbc:mysql://db4free.net:3306/expensetracker?useSSL=false");
				settings.put(Environment.USER, "aliuser6756");
				settings.put(Environment.PASS, "Ali@123456");
				settings.put(Environment.DIALECT, "org.hibernate.dialect.MySQL8Dialect");

				settings.put(Environment.SHOW_SQL, "true");
				settings.put(Environment.FORMAT_SQL, "true");
				settings.put(Environment.HBM2DDL_AUTO, "update");

				configuration.setProperties(settings);

				// ✅ Adding annotated entity classes
				configuration.addAnnotatedClass(User.class);
				configuration.addAnnotatedClass(Expense.class);

				ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
						.applySettings(configuration.getProperties()).build();

				sessionFactory = configuration.buildSessionFactory(serviceRegistry);

			} catch (Exception e) {
				System.err.println("🔥 Hibernate Configuration Failed:");
				e.printStackTrace(); // 🔍 Vital for debugging DB or config issues
			}
		}
		return sessionFactory;
	}
}
