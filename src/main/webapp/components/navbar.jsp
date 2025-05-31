<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Expense Tracker</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />

</head>
<body class="bg-light text-dark">

	<!-- Navbar -->
	<nav
		class="navbar navbar-expand-lg navbar-light bg-white shadow rounded-bottom"
		role="navigation" aria-label="Main Navigation">
		<div class="container-fluid">
			<a class="navbar-brand fw-bold fs-4 text-primary" href="${pageContext.request.contextPath}/index.jsp">Expense
				Tracker</a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
				aria-controls="navbarNavAltMarkup" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse justify-content-end"
				id="navbarNavAltMarkup">
				<div class="navbar-nav text-center">
					<a
						class="nav-link active fw-semibold text-dark d-flex align-items-center"
						href="${pageContext.request.contextPath}/index.jsp"
						aria-current="page"> <i class="fa-solid fa-house me-2"></i>
						Home
					</a> <a
						class="nav-link fw-semibold text-dark d-flex align-items-center"
						href="${pageContext.request.contextPath}/about.jsp"> <i
						class="fa-solid fa-address-card me-2"></i> About
					</a>
					<c:if test="${not empty loginUser }">
						<a
							class="nav-link fw-semibold text-dark d-flex align-items-center"
							href="${pageContext.request.contextPath}/user/add_expense.jsp">
							<i class="fa-solid fa-plus me-2"></i> Add Expense
						</a>
						<a
							class="nav-link fw-semibold text-dark d-flex align-items-center"
							href="${pageContext.request.contextPath}/user/view_expense.jsp">
							<i class="fa-solid fa-eye me-2"></i> View Expense
						</a>
						<a
							class="nav-link fw-semibold text-dark d-flex align-items-center"
							href="${pageContext.request.contextPath}/user/home.jsp"> <i
							class="fa-solid fa-gauge me-2"></i> DashBoard
						</a>
						<a
							class="nav-link fw-semibold text-dark d-flex align-items-center"
							href="${pageContext.request.contextPath}/logout"> <i
							class="fa-solid fa-user-minus me-2"></i> Logout
						</a>
					</c:if>
					<c:if test="${empty loginUser }">
						<a
							class="nav-link fw-semibold text-dark d-flex align-items-center"
							href="login.jsp"> <i
							class="fa-solid fa-right-to-bracket me-2"></i> Login
						</a>
						<a
							class="nav-link fw-semibold text-dark d-flex align-items-center"
							href="register.jsp"> <i class="fa-solid fa-user-plus me-2"></i>
							Register
						</a>
					</c:if>
				</div>
			</div>
		</div>
	</nav>
</body>
</html>
