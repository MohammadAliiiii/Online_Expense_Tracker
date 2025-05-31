<%@page import="com.entity.Expense"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="com.dao.ExpenseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../components/all_css.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Expense</title>
</head>
<body>
	<%@include file="../components/navbar.jsp"%>

	<c:if test="${empty loginUser}">
		<c:redirect url="/login.jsp"></c:redirect>
	</c:if>

	<%
	int id = Integer.parseInt(request.getParameter("id"));
	ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());
	Expense ex = dao.getExpenseById(id);
	%>

	<div class="container mt-5">
		<h2 class="mb-4 text-center text-primary">Edit Expense</h2>
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

		<form action="../updateExpense" method="post" class="card p-4 shadow-sm">
			<!-- Hidden field to pass ID -->
			<input type="hidden" name="id" value="<%=ex.getId()%>">

			<div class="mb-3">
				<label for="title" class="form-label">Title</label> <input
					type="text" class="form-control" id="title" name="title" required
					value="<%=ex.getTitle()%>">
			</div>

			<div class="mb-3">
				<label for="date" class="form-label">Date</label> <input type="date"
					class="form-control" id="date" name="date" required
					value="<%=ex.getDate()%>">
			</div>

			<div class="mb-3">
				<label for="time" class="form-label">Time</label> <input type="time"
					class="form-control" id="time" name="time" required
					value="<%=ex.getTime()%>">
			</div>

			<div class="mb-3">
				<label for="description" class="form-label">Description</label>
				<textarea class="form-control" id="description" name="description"
					rows="3"><%=ex.getDescription()%></textarea>
			</div>

			<div class="mb-3">
				<label for="price" class="form-label">Price (₹)</label> <input
					type="number" step="0.01" class="form-control" id="price"
					name="price" required value="<%=ex.getPrice()%>">
			</div>

			<div class="text-center">
				<input type="hidden" name="id" value="<%=ex.getId()%>">
				<button type="submit" class="btn btn-success">Update
					Expense</button>
			</div>
		</form>
	</div>

</body>
</html>
