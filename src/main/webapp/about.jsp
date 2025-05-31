<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>About Us | Expense Tracker</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="components/all_css.jsp"%>

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
/* Section Styling */
.hero {
	background: linear-gradient(to right, #6a11cb, #2575fc); /* 1 */
	color: white;
	padding: 80px 20px; /* 2 */
	text-shadow: 1px 1px 2px #000; /* 3 */
}

.card {
	border-radius: 1rem; /* 4 */
	transition: transform 0.3s ease, box-shadow 0.3s ease; /* 5 */
}

.card:hover {
	transform: scale(1.02); /* 6 */
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15); /* 7 */
}

.feature-icon {
	font-size: 3rem; /* 8 */
	color: #0d6efd;
}

.team-icon {
	font-size: 5rem; /* 9 */
	color: #198754;
}

.section-title {
	font-weight: 700;
	letter-spacing: 0.5px;
}

.text-justify {
	text-align: justify; /* 10 */
}

.bg-lightblue {
	background-color: #f0f8ff; /* 11 */
}
</style>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<!-- Hero Section -->
	<section class="hero text-center">
		<div class="container">
			<h1 class="display-4 fw-bold">About Expense Tracker</h1>
			<!-- 12 -->
			<p class="lead">Built for people who want to manage money
				smarter.</p>
			<!-- 13 -->
		</div>
	</section>

	<!-- Mission Section -->
	<div class="container py-5">
		<div class="row align-items-center">
			<div class="col-md-6 mb-4 order-md-2">
				<i class="fas fa-wallet fa-7x text-primary d-block text-center mb-3"></i>
				<!-- 14 -->
			</div>
			<div class="col-md-6 order-md-1">
				<h2 class="section-title mb-3">Why We Exist</h2>
				<!-- 15 -->
				<p class="text-justify">Managing your personal finances
					shouldn't feel overwhelming. Expense Tracker helps you make clear
					and confident financial decisions with an easy-to-use interface.</p>
				<!-- 16 -->
				<p class="text-justify">Our goal is to simplify how you track
					income, control spending, and plan for the future.</p>
				<!-- 17 -->
			</div>
		</div>
	</div>

	<!-- Feature Section -->
	<div class="bg-lightblue py-5">
		<div class="container">
			<h3 class="text-center fw-bold mb-5">What We Offer</h3>
			<!-- 18 -->
			<div class="row g-4">
				<div class="col-md-4">
					<div class="card text-center h-100">
						<div class="card-body">
							<i class="fas fa-chart-line feature-icon mb-3"></i>
							<!-- 19 -->
							<h5 class="card-title">Insightful Reports</h5>
							<p class="card-text">Visual summaries of your financial
								trends.</p>
							<!-- 20 -->
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card text-center h-100">
						<div class="card-body">
							<i class="fas fa-lock feature-icon mb-3"></i>
							<h5 class="card-title">Secure & Private</h5>
							<p class="card-text">Data stays encrypted (safely scrambled)
								and secure.</p>
							<!-- 21 -->
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card text-center h-100">
						<div class="card-body">
							<i class="fas fa-bolt feature-icon mb-3"></i>
							<h5 class="card-title">Fast & Easy</h5>
							<p class="card-text">Minimal steps to record and view
								transactions.</p>
							<!-- 22 -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Team Section -->
	<div class="container py-5">
		<h3 class="text-center fw-bold mb-5">Meet Our Team</h3>
		<div class="row justify-content-center g-4">
			<div class="col-md-4 col-sm-6">
				<div class="card text-center h-100">
					<div class="card-body">
						<i class="fas fa-user-circle team-icon mb-3"></i>
						<!-- 23 -->
						<h5 class="fw-bold">Mohammad Ali</h5>
						<p class="text-muted">Founder & Full Stack Developer</p>
						<!-- 24 -->
						<p class="small">Believes in building useful tools that
							simplify life.</p>
						<!-- 25 -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="bg-dark text-white py-4 text-center">
		<div class="container">
			<p class="mb-1">&copy; 2025 Expense Tracker. All rights reserved.</p>
			<a href="contact.jsp" class="text-decoration-none text-info">Contact
				Us</a>
			<!-- 26 -->
		</div>
	</footer>
</body>
</html>
