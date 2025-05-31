<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Register | Expense Tracker</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="components/all_css.jsp"%>
<style>
body {
	background: linear-gradient(to right, #74ebd5, #ACB6E5); /* 1 */
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
			<div class="col-md-6 col-lg-5 col-sm-8">
				<!-- 5 -->
				<div class="card shadow-lg">
					<!-- 6 -->
					<div class="card-header bg-dark text-white text-center">
						<h4 class="fw-bold">Create Account</h4>
						<c:if test="${not empty msg}">
							<p>${msg}</p>
							<c:remove var="msg" />

						</c:if>
						<!-- 7 -->
					</div>
					<div class="card-body">
						<form action="userRegister" method="post" novalidate>
							<!-- 8 -->

							<!-- Full Name -->
							<div class="mb-3">
								<label for="name" class="form-label">Full Name <span
									class="text-danger">*</span></label>
								<!-- 9 -->
								<input type="text" class="form-control" id="name" name="name"
									required placeholder="Enter your full name"
									aria-describedby="nameHelp">
								<!-- 10 -->
								<div class="form-text" id="nameHelp">This will appear on
									your profile.</div>
								<!-- 11 -->
							</div>

							<!-- Email -->
							<div class="mb-3">
								<label for="email" class="form-label">Email address <span
									class="text-danger">*</span></label>
								<!-- 12 -->
								<input type="email" class="form-control" id="email" name="email"
									required placeholder="name@example.com"
									aria-describedby="emailHelp">
								<!-- 13 -->
								<div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div>
								<!-- 14 -->
							</div>

							<!-- Password -->
							<div class="mb-3 position-relative">
								<!-- 15 -->
								<label for="password" class="form-label">Password <span
									class="text-danger">*</span></label> <input type="password"
									class="form-control" id="password" name="password" required
									aria-describedby="pwdHelp" minlength="6" maxlength="20">
								<!-- 16 -->
								<small id="pwdHelp" class="form-text text-muted">6-20
									characters. Use letters and numbers.</small>
								<!-- 17 -->
							</div>

							<!-- Confirm Password -->
							<div class="mb-3">
								<label for="confirmPassword" class="form-label">Confirm
									Password</label>
								<!-- 18 -->
								<input type="password" class="form-control" id="confirmPassword"
									name="confirmPassword" required>
							</div>

							<!-- Terms and Conditions -->
							<div class="form-check mb-3">
								<!-- 19 -->
								<input class="form-check-input" type="checkbox" value=""
									id="terms" required> <label class="form-check-label"
									for="terms"> I agree to the <a href="#">terms and
										conditions</a>
								</label>
							</div>

							<!-- Submit Button -->
							<div class="d-grid mb-3">
								<button type="submit" class="btn btn-success btn-lg">Register</button>
								<!-- 20 -->
							</div>

							<!-- Login redirect -->
							<div class="text-center">
								Already have an account? <a href="login.jsp">Login here</a>
								<!-- 21 -->
							</div>
						</form>
					</div>
					<div class="card-footer text-muted text-center">
						&copy; 2025 Expense Tracker
						<!-- 22 -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap Tooltips (23-25) -->
	<script>
    document.querySelectorAll('[data-bs-toggle="tooltip"]').forEach(el => {
      new bootstrap.Tooltip(el);
    });
  </script>

	<!-- Password Strength (26-30) -->
	<script>
    document.getElementById('password').addEventListener('input', function() {
      const pwd = this.value;
      const strength = document.getElementById('pwdHelp');
      if (pwd.length < 6) {
        strength.textContent = "Too short";
        strength.style.color = "red";
      } else if (pwd.match(/[0-9]/) && pwd.match(/[a-z]/i)) {
        strength.textContent = "Strong password";
        strength.style.color = "green";
      } else {
        strength.textContent = "Weak password";
        strength.style.color = "orange";
      }
    });
  </script>

	<!-- Simple Client-side Validation (31–35) -->
	<script>
    const form = document.querySelector("form");
    form.addEventListener("submit", function (e) {
      const pwd = document.getElementById('password').value;
      const confirmPwd = document.getElementById('confirmPassword').value;
      if (pwd !== confirmPwd) {
        e.preventDefault();
        alert("Passwords do not match!");
      }
    });
  </script>

</body>
</html>
