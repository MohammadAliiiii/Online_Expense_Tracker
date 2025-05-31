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
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@include file="../components/all_css.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Expenses</title>
</head>
<body>
	<%@include file="../components/navbar.jsp"%>

	<div class="container mt-5">
		<h2 class="text-center text-primary mb-4">Your Expenses</h2>

		<%
		User user = (User) session.getAttribute("loginUser");
		if (user == null) {
			response.sendRedirect("../login.jsp");
			return;
		}
		ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());
		List<Expense> expenses = dao.getAllExpenseByUser(user);
		request.setAttribute("expenses", expenses);

		// Currency formatter for Indian locale
		NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new java.util.Locale("en", "IN"));

		// Calculate totals and max price, prepare list for top 3
		double total = 0;
		double max = 0;
		int count = expenses.size();

		// Clone list for sorting top 3 expenses
		List<Expense> expensesCopy = new ArrayList<Expense>(expenses);

		for (Expense e : expenses) {
			double price = 0;
			try {
				price = Double.parseDouble(e.getPrice());
			} catch (Exception ex) {
				price = 0;
			}
			total += price;
			if (price > max)
				max = price;
		}
		double avg = count > 0 ? total / count : 0;

		// Sort expensesCopy by price descending (simple bubble sort for compatibility)
		for (int i = 0; i < expensesCopy.size() - 1; i++) {
			for (int j = 0; j < expensesCopy.size() - i - 1; j++) {
				double p1 = 0, p2 = 0;
				try {
			p1 = Double.parseDouble(expensesCopy.get(j).getPrice());
			p2 = Double.parseDouble(expensesCopy.get(j + 1).getPrice());
				} catch (Exception ex) {
				}
				if (p1 < p2) {
			Expense temp = expensesCopy.get(j);
			expensesCopy.set(j, expensesCopy.get(j + 1));
			expensesCopy.set(j + 1, temp);
				}
			}
		}

		// Get top 3 expenses or less
		List<Expense> top3 = new ArrayList<Expense>();
		for (int i = 0; i < Math.min(3, expensesCopy.size()); i++) {
			top3.add(expensesCopy.get(i));
		}

		// Monthly totals map
		Map<String, Double> monthlyTotals = new HashMap<String, Double>();
		SimpleDateFormat sdfInput = new SimpleDateFormat("yyyy-MM-dd"); // Expected format
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

		// Sort months ascending
		List<String> monthsSorted = new ArrayList<String>(monthlyTotals.keySet());
		Collections.sort(monthsSorted);

		request.setAttribute("totalExpense", total);
		request.setAttribute("maxExpense", max);
		request.setAttribute("avgExpense", avg);
		request.setAttribute("monthlyTotals", monthlyTotals);
		request.setAttribute("monthsSorted", monthsSorted);
		request.setAttribute("top3", top3);
		request.setAttribute("currencyFormat", currencyFormat);
		%>

		<c:if test="${not empty expenses}">
			<c:if test="${not empty sessionScope.msg}">
				<div
					class="alert alert-danger alert-dismissible fade show mt-3 text-center shadow-sm rounded"
					role="alert" style="max-width: 500px; margin: auto;">
					${sessionScope.msg}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
				<c:remove var="msg" scope="session" />
			</c:if>
			<table class="table table-bordered table-hover text-center shadow-sm">
				<thead class="table-primary">
					<tr>
						<th>Title</th>
						<th>Date</th>
						<th>Time</th>
						<th>Description</th>
						<th>Price (₹)</th>
						<th>Relative Cost</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="exp" items="${expenses}">
						<%
						double price = 0;
						try {
							price = Double.parseDouble(((Expense) pageContext.getAttribute("exp")).getPrice());
						} catch (Exception ex) {
							price = 0;
						}
						double maxPrice = (double) request.getAttribute("maxExpense");
						int barWidth = maxPrice > 0 ? (int) ((price / maxPrice) * 100) : 0;
						%>
						<tr>
							<td>${exp.title}</td>
							<td>${exp.date}</td>
							<td>${exp.time}</td>
							<td>${exp.description}</td>
							<td><%=currencyFormat.format(price)%></td>
							<td>
								<div class="progress" style="height: 20px;">
									<div class="progress-bar bg-info" role="progressbar"
										style="width: <%=barWidth%>%;" aria-valuenow="<%=barWidth%>"
										aria-valuemin="0" aria-valuemax="100"><%=barWidth%>%
									</div>
								</div>
							</td>

							<!-- Edit button -->
							<td><a href="edit_expense.jsp?id=${exp.id}"
								class="btn btn-warning btn-sm">Edit</a></td>

							<!-- Delete button -->
							<td>
								<form action="../deleteExpense" method="get"
									onsubmit="return confirm('Are you sure you want to delete this expense?');">
									<input type="hidden" name="id" value="${exp.id}" />
									<button type="submit" class="btn btn-danger btn-sm">Delete</button>
								</form>



							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!-- Summary -->
			<div class="mt-4 p-3 border rounded shadow-sm bg-light">
				<h4 class="text-secondary mb-3">Expense Summary</h4>
				<ul class="list-group">
					<li
						class="list-group-item d-flex justify-content-between align-items-center">
						Total Expenses <span class="badge bg-primary rounded-pill"><%=currencyFormat.format(total)%></span>
					</li>
					<li
						class="list-group-item d-flex justify-content-between align-items-center">
						Maximum Single Expense <span class="badge bg-success rounded-pill"><%=currencyFormat.format(max)%></span>
					</li>
					<li
						class="list-group-item d-flex justify-content-between align-items-center">
						Average Expense <span class="badge bg-info rounded-pill"><%=currencyFormat.format(avg)%></span>
					</li>
					<li
						class="list-group-item d-flex justify-content-between align-items-center">
						Total Number of Expenses <span
						class="badge bg-secondary rounded-pill"><%=count%></span>
					</li>
				</ul>
			</div>

			<!-- Monthly Breakdown -->
			<div class="mt-4 p-3 border rounded shadow-sm bg-white">
				<h4 class="text-secondary mb-3">Monthly Expense Breakdown</h4>
				<table class="table table-sm table-striped text-center">
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

			<!-- Top 3 Expenses -->
			<div class="mt-4 p-3 border rounded shadow-sm bg-white">
				<h4 class="text-secondary mb-3">Top 3 Most Expensive Expenses</h4>
				<table class="table table-bordered text-center">
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
								priceTop = Double.parseDouble(((Expense) pageContext.getAttribute("topExp")).getPrice());
							} catch (Exception ex) {
								priceTop = 0;
							}
							%>
							<tr>
								<td>${topExp.title}</td>
								<td>${topExp.date}</td>
								<td><%=currencyFormat.format(priceTop)%></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</c:if>

		<c:if test="${empty expenses}">
			<p class="text-center text-danger mt-5">No expenses found. Add
				your expenses first.</p>
		</c:if>
	</div>


</body>
</html>
