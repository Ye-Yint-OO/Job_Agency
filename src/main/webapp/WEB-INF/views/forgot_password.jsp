<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .is-invalid {
            border-color: red;
        }
    </style>

    <script>
        function validateEmailFormat() {
            const email = document.getElementById("email").value;
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // Simple email regex pattern

            // Check if the email matches the pattern
            if (!emailPattern.test(email)) {
                document.getElementById("email").classList.add("is-invalid");
                document.getElementById("emailError").style.display = "block"; // Show error message
                return false; // Prevent form submission
            }

            document.getElementById("email").classList.remove("is-invalid");
            document.getElementById("emailError").style.display = "none"; // Hide error message
            return true; // Allow form submission
        }
    </script>
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h2 class="card-title text-center mb-4">Forgot Password</h2>

                    <!-- Forgot password form with email validation -->
                    <form action="sendOtp" method="POST" onsubmit="return validateEmailFormat();">
                        <!-- Email Input -->
                        <div class="mb-3">
                            <label for="email" class="form-label">Enter your email</label>
                            <input type="email" id="email" name="email" class="form-control" required>
                            <!-- Error message for invalid email format -->
                            <div id="emailError" class="invalid-feedback" style="display: none;">
                                Please enter a valid email address.
                            </div>
                            <!-- Server-side error message (if email not found) -->
                            <c:if test="${not empty EmailNotExist}">
                                <div class="text-danger mt-2">${EmailNotExist}</div>
                            </c:if>
                        </div>

                        <!-- Submit Button -->
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">Send OTP</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap 5 JS (Optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
