<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .is-invalid {
            border-color: red;
        }
    </style>

    <script>
        function validatePasswords() {
            const password = document.getElementById("newPassword").value;
            const confirmPassword = document.getElementById("confirmPassword").value;

            // Check if password has at least 6 characters
            if (password.length < 6) {
                document.getElementById("newPassword").classList.add("is-invalid");
                document.getElementById("passwordError").style.display = "block"; // Show the error message
                return false; // Prevent form submission
            } else {
                document.getElementById("newPassword").classList.remove("is-invalid");
                document.getElementById("passwordError").style.display = "none"; // Hide the error message
            }

            // Check if password and confirm password match
            if (password !== confirmPassword) {
                document.getElementById("confirmPassword").classList.add("is-invalid");
                return false; // Prevent form submission
            }

            // If both are valid, remove error highlights
            document.getElementById("newPassword").classList.remove("is-invalid");
            document.getElementById("confirmPassword").classList.remove("is-invalid");
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
                    <h2 class="card-title text-center mb-4">Reset Password</h2>

                    <!-- Password reset form -->
                    <form action="resetPassword" method="POST" onsubmit="return validatePasswords();">
                        <!-- Hidden field to pass the email -->
                        <input type="hidden" name="email" value="${email}">

                        <!-- New Password Input -->
                        <div class="mb-3">
                            <label for="newPassword" class="form-label">New Password</label>
                            <input type="password" id="newPassword" name="newPassword" class="form-control" required>
                            <div id="passwordError" class="invalid-feedback">
                                Password must be at least 6 characters long.
                            </div>
                        </div>

                        <!-- Confirm Password Input -->
                        <div class="mb-3">
                            <label for="confirmPassword" class="form-label">Confirm Password</label>
                            <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required>
                            <c:if test="${not empty PasswordMismatch}">
                                <div class="text-danger mt-2">${PasswordMismatch}</div>
                            </c:if>
                        </div>

                        <!-- Submit Button -->
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">Reset Password</button>
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
