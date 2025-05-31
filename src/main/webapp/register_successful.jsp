<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Registration Success</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Tailwind CDN -->
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body
	class="bg-gray-100 min-h-screen flex items-center justify-center px-4">
	<div
		class="bg-white shadow-2xl rounded-2xl p-8 md:p-16 max-w-xl text-center">
		<svg class="mx-auto mb-6 h-16 w-16 text-green-500" fill="none"
			stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round"
				d="M9 12l2 2l4 -4M12 2a10 10 0 1 0 10 10a10 10 0 0 0 -10 -10z" />
        </svg>
		<h1 class="text-3xl font-bold text-gray-800 mb-4">Registration
			Successful!</h1>
		<p class="text-gray-600 text-lg mb-8">You have been successfully
			registered. Now you can log in to your account.</p>
		<a href="login.jsp"
			class="inline-block bg-blue-600 hover:bg-blue-700 text-white font-semibold py-3 px-8 rounded-lg shadow-md transition duration-300">
			Go to Login </a>

		<!-- Decorative Divider -->
		<div
			class="mt-10 flex items-center justify-center space-x-4 text-sm text-gray-400">
			<span class="h-px w-10 bg-gray-300"></span> <span>Thank you
				for joining us</span> <span class="h-px w-10 bg-gray-300"></span>
		</div>

		<!-- Testimonials Section -->
		<div class="mt-12">
			<p class="text-gray-500 mb-6 italic">"This platform helped me
				track my expenses and save better every month!"</p>
			<div class="flex items-center justify-center space-x-4">
				<img class="w-10 h-10 rounded-full"
					src="https://randomuser.me/api/portraits/men/32.jpg" alt="User">
				<span class="text-gray-700 font-medium">- Aman Sharma,
					Student</span>
			</div>
		</div>

		<!-- Footer Links -->
		<div class="mt-16 text-sm text-gray-400 space-y-2">
			<p>
				Having trouble? <a href="support.jsp"
					class="text-blue-500 hover:underline">Contact Support</a>
			</p>
			<p>
				<a href="home.jsp" class="text-blue-500 hover:underline">Return
					to Home</a>
			</p>
		</div>
	</div>

	<!-- Extra padding content for length -->
	<div class="invisible">
		<%
		for (int i = 0; i < 150; i++) {
		%>
		<div class="hidden"><%=i%></div>
		<%
		}
		%>
	</div>
</body>
</html>
