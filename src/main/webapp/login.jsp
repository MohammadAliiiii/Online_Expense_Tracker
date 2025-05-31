<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Login | Expense Tracker</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="components/all_css.jsp"%>
<style>
body {
	background: linear-gradient(to left, #f6d365, #fda085); /* 1 */
}

.card {
	border-radius: 1rem; /* 2 */
}

.form-control:focus {
	box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* 3 */
}
</style>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container py-5">
		<!-- 4 -->
		<div class="row justify-content-center">
			<div class="col-md-5 col-sm-10">
				<!-- 5 -->
				<div class="card shadow-lg">
					<!-- 6 -->
					<div class="card-header bg-primary text-white text-center">
						<h4 class="fw-bold">Login to Your Account</h4>
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
						<!-- 7 -->
					</div>
					<div class="card-body">
						<form action="login" method="post" novalidate>
							<!-- 8 -->

							<!-- Email -->
							<div class="mb-3">
								<label for="email" class="form-label">Email address <span
									class="text-danger">*</span></label>
								<!-- 9 -->
								<input type="email" class="form-control" id="email" name="email"
									required placeholder="name@example.com"
									aria-describedby="emailHelp">
								<!-- 10 -->
								<div id="emailHelp" class="form-text">We respect your
									privacy.</div>
								<!-- 11 -->
							</div>

							<!-- Password -->
							<div class="mb-3 position-relative">
								<label for="password" class="form-label">Password <span
									class="text-danger">*</span></label>
								<!-- 12 -->
								<input type="password" class="form-control" id="password"
									name="password" required minlength="6" maxlength="20"
									aria-describedby="pwdHelp">
								<!-- 13 -->
								<div id="pwdHelp" class="form-text">Must be 6–20
									characters long.</div>
								<!-- 14 -->
							</div>

							<!-- Remember Me -->
							<div class="form-check mb-3">
								<!-- 15 -->
								<input type="checkbox" class="form-check-input" id="rememberMe">
								<label class="form-check-label" for="rememberMe">Remember
									me</label>
							</div>

							<!-- Submit Button -->
							<div class="d-grid mb-3">
								<button type="submit" class="btn btn-success btn-lg">Login</button>
								<!-- 16 -->
							</div>

							<!-- Extra Actions -->
							<div class="text-center">
								<small><a href="forgotPassword.jsp">Forgot password?</a></small>
								<!-- 17 -->
								<br> <small>Don't have an account? <a
									href="register.jsp">Register here</a></small>
								<!-- 18 -->
							</div>

						</form>
					</div>
					<div class="card-footer text-muted text-center">
						&copy; 2025 Expense Tracker
						<!-- 19 -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- JavaScript Enhancements (20–25) -->
	<script>
		// Password Visibility Toggle (26–28)
		const pwdField = document.getElementById("password");
		pwdField.setAttribute("type", "password");
		pwdField.addEventListener("dblclick", function() {
			pwdField.type = pwdField.type === "password" ? "text" : "password";
		});

		// Form Validation Warning (29–32)
		const form = document.querySelector("form");
		form.addEventListener("submit", function(e) {
			if (!form.checkValidity()) {
				e.preventDefault();
				alert("Please fill all required fields correctly.");
			}
		});
	</script>

</body>
</html>
