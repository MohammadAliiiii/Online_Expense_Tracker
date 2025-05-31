<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="com.dao.ExpenseDao"%>
<%@page import="com.entity.Expense"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Collections"%>
<%@page import="java.text.NumberFormat"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@include file="../components/all_css.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard - Expense Tracker</title>
</head>
<body>
	<%@include file="../components/navbar.jsp"%>

	<div class="container mt-5">
		<h2 class="text-center text-primary mb-4">Dashboard & Analysis</h2>

		<%
			User user = (User) session.getAttribute("loginUser");
			if (user == null) {
				response.sendRedirect("../login.jsp");
				return;
			}
			ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());
			List<Expense> expenses = dao.getAllExpenseByUser(user);

			NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new java.util.Locale("en", "IN"));

			double total = 0;
			double max = 0;
			int count = expenses.size();

			List<Expense> expensesCopy = new ArrayList<Expense>(expenses);

			for (Expense e : expenses) {
				double price = 0;
				try {
					price = Double.parseDouble(e.getPrice());
				} catch (Exception ex) {
					price = 0;
				}
				total += price;
				if (price > max) max = price;
			}
			double avg = count > 0 ? total / count : 0;

			// Sort expenses by price descending (simple bubble sort for compatibility)
			for (int i = 0; i < expensesCopy.size() - 1; i++) {
				for (int j = 0; j < expensesCopy.size() - i - 1; j++) {
					double p1 = 0, p2 = 0;
					try {
						p1 = Double.parseDouble(expensesCopy.get(j).getPrice());
						p2 = Double.parseDouble(expensesCopy.get(j + 1).getPrice());
					} catch (Exception ex) {}
					if (p1 < p2) {
						Expense temp = expensesCopy.get(j);
						expensesCopy.set(j, expensesCopy.get(j + 1));
						expensesCopy.set(j + 1, temp);
					}
				}
			}

			List<Expense> top3 = new ArrayList<Expense>();
			for (int i = 0; i < Math.min(3, expensesCopy.size()); i++) {
				top3.add(expensesCopy.get(i));
			}

			// Monthly totals
			Map<String, Double> monthlyTotals = new HashMap<String, Double>();
			SimpleDateFormat sdfInput = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat sdfMonth = new SimpleDateFormat("yyyy-MM");
			for (Expense e : expenses) {
				String dateStr = e.getDate();
				Date date = null;
				try {
					date = sdfInput.parse(dateStr);
				} catch (Exception ex) {
					date = new Date();
				}
				String month = sdfMonth.format(date);
				double price = 0;
				try {
					price = Double.parseDouble(e.getPrice());
				} catch (Exception ex) {
					price = 0;
				}
				if (monthlyTotals.containsKey(month)) {
					monthlyTotals.put(month, monthlyTotals.get(month) + price);
				} else {
					monthlyTotals.put(month, price);
				}
			}

			List<String> monthsSorted = new ArrayList<String>(monthlyTotals.keySet());
			Collections.sort(monthsSorted);

			// Analysis 1: Top 3 percentage of total
			double top3Total = 0;
			for (Expense e : top3) {
				try {
					top3Total += Double.parseDouble(e.getPrice());
				} catch (Exception ex) {}
			}
			double top3Percent = total > 0 ? (top3Total / total) * 100 : 0;

			// Analysis 2: Trend detection (compare last month to previous)
			String lastMonth = null, prevMonth = null;
			if (monthsSorted.size() >= 2) {
				lastMonth = monthsSorted.get(monthsSorted.size() - 1);
				prevMonth = monthsSorted.get(monthsSorted.size() - 2);
			}
			double lastMonthTotal = lastMonth != null ? monthlyTotals.get(lastMonth) : 0;
			double prevMonthTotal = prevMonth != null ? monthlyTotals.get(prevMonth) : 0;
			String trend = "No sufficient data";
			if (prevMonth != null) {
				if (lastMonthTotal > prevMonthTotal) trend = "Spending ↑ (Increase)";
				else if (lastMonthTotal < prevMonthTotal) trend = "Spending ↓ (Decrease)";
				else trend = "Spending Stable";
			}

			// Analysis 3: Alert for heavy average expense
			String alertMsg = "";
			double alertThreshold = 1000;
			if (avg > alertThreshold) {
				alertMsg = "Alert: Your average expense is above ₹" + alertThreshold + ". Consider reviewing your spending.";
			}

			request.setAttribute("totalExpense", total);
			request.setAttribute("maxExpense", max);
			request.setAttribute("avgExpense", avg);
			request.setAttribute("monthlyTotals", monthlyTotals);
			request.setAttribute("monthsSorted", monthsSorted);
			request.setAttribute("top3", top3);
			request.setAttribute("count", count);
			request.setAttribute("currencyFormat", currencyFormat);
			request.setAttribute("top3Percent", top3Percent);
			request.setAttribute("trend", trend);
			request.setAttribute("alertMsg", alertMsg);
			request.setAttribute("lastMonth", lastMonth);
			request.setAttribute("prevMonth", prevMonth);
		%>

		<!-- Summary cards -->
		<div class="row text-center mb-4">
			<div class="col-md-3">
				<div class="card border-primary shadow-sm">
					<div class="card-body">
						<h5 class="card-title">Total Expenses</h5>
						<p class="card-text display-6 text-success"><%= currencyFormat.format(total) %></p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card border-info shadow-sm">
					<div class="card-body">
						<h5 class="card-title">Average Expense</h5>
						<p class="card-text display-6 text-info"><%= currencyFormat.format(avg) %></p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card border-success shadow-sm">
					<div class="card-body">
						<h5 class="card-title">Max Expense</h5>
						<p class="card-text display-6 text-warning"><%= currencyFormat.format(max) %></p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card border-secondary shadow-sm">
					<div class="card-body">
						<h5 class="card-title">Number of Expenses</h5>
						<p class="card-text display-6 text-muted"><%= count %></p>
					</div>
				</div>
			</div>
		</div>

		<!-- Analysis section -->
		<div class="mb-5">
			<h3 class="text-primary mb-3">Analysis</h3>
			<p><strong>Top 3 expenses account for:</strong> <%= String.format("%.2f", top3Percent) %> % of your total spending.</p>
			<p><strong>Monthly Spending Trend:</strong> 
				<%= trend %>
				<c:if test="${not empty lastMonth}">
					(<%= lastMonth %>: <%= currencyFormat.format(lastMonthTotal) %>, <%= prevMonth %>: <%= currencyFormat.format(prevMonthTotal) %>)
				</c:if>
			</p>
			<c:if test="${not empty alertMsg}">
				<div class="alert alert-danger"><%= alertMsg %></div>
			</c:if>
		</div>

		<!-- Top 3 Expenses Table -->
		<div class="mb-5">
			<h3 class="text-primary mb-3">Top 3 Most Expensive Expenses</h3>
			<table class="table table-bordered text-center shadow-sm">
				<thead class="table-warning">
					<tr>
						<th>Title</th>
						<th>Date</th>
						<th>Price (₹)</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="topExp" items="${top3}">
						<%
							double priceTop = 0;
							try {
								priceTop = Double.parseDouble(((Expense)pageContext.getAttribute("topExp")).getPrice());
							} catch(Exception ex) {
								priceTop = 0;
							}
						%>
						<tr>
							<td>${topExp.title}</td>
							<td>${topExp.date}</td>
							<td><%= currencyFormat.format(priceTop) %></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<!-- Monthly Breakdown Table -->
		<div>
			<h3 class="text-primary mb-3">Monthly Expense Breakdown</h3>
			<table class="table table-striped text-center shadow-sm">
				<thead>
					<tr>
						<th>Month</th>
						<th>Total Expenses</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="month" items="${monthsSorted}">
						<tr>
							<td>${month}</td>
							<td><c:out value="${monthlyTotals[month]}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
</body>
</html>
