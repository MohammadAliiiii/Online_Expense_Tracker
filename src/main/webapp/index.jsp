<%@page import="com.db.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Expense Tracker</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@include file="components/all_css.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<!-- Bootstrap Carousel (Hero Section) -->
	<div id="expenseCarousel"
		class="carousel slide carousel-fade mt-4 mx-auto shadow-lg rounded"
		data-bs-ride="carousel" style="max-width: 900px;"
		aria-label="Expense Tracker Highlights">

		<!-- Indicators -->
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#expenseCarousel"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#expenseCarousel"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#expenseCarousel"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>

		<!-- Carousel Inner -->
		<div class="carousel-inner rounded">
			<div class="carousel-item active">
				<img
					src="https://images.pexels.com/photos/669615/pexels-photo-669615.jpeg"
					class="d-block w-100 rounded" alt="Track Your Expenses Easily"
					loading="lazy" />
				<div
					class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded p-3">
					<h5 class="fw-bold">Track Your Expenses Easily</h5>
					<p class="fs-6">Stay on top of your spending with our
						user-friendly dashboard.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img
					src="https://images.pexels.com/photos/7009864/pexels-photo-7009864.jpeg"
					class="d-block w-100 rounded" alt="Set Budget Goals" loading="lazy" />
				<div
					class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded p-3">
					<h5 class="fw-bold">Set Budget Goals</h5>
					<p class="fs-6">Plan your finances smartly to save more every
						month.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img
					src="https://images.pexels.com/photos/6801639/pexels-photo-6801639.jpeg"
					class="d-block w-100 rounded" alt="Detailed Expense Reports"
					loading="lazy" />
				<div
					class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded p-3">
					<h5 class="fw-bold">Detailed Expense Reports</h5>
					<p class="fs-6">Analyze your spending patterns with insightful
						reports.</p>
				</div>
			</div>
		</div>

		<!-- Controls -->
		<button class="carousel-control-prev" type="button"
			data-bs-target="#expenseCarousel" data-bs-slide="prev"
			aria-label="Previous Slide">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#expenseCarousel" data-bs-slide="next"
			aria-label="Next Slide">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
		</button>
	</div>

	<!-- Feature Section -->
	<div class="container mt-5">
		<h2 class="text-center text-primary mb-4">Why Choose Our Expense
			Tracker?</h2>
		<div class="row text-center">
			<div class="col-md-4">
				<div class="card shadow-sm mb-3">
					<div class="card-body">
						<h5 class="card-title">Fast & Simple</h5>
						<p class="card-text">Record expenses in just a few clicks with
							a clean, clutter-free (uncomplicated) UI.</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card shadow-sm mb-3">
					<div class="card-body">
						<h5 class="card-title">Visual Reports</h5>
						<p class="card-text">Get charts and tables that help you
							understand your spending trends easily.</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card shadow-sm mb-3">
					<div class="card-body">
						<h5 class="card-title">Secure Data</h5>
						<p class="card-text">Your financial records are stored safely
							with encrypted (protected) connections.</p>
					</div>
				</div>
			</div>
		</div>

		<!-- CTA (Call To Action) -->
		<div class="text-center mt-4">
			<a href="login.jsp" class="btn btn-primary btn-lg px-4">Get
				Started</a>
		</div>
	</div>

</body>
</html>
