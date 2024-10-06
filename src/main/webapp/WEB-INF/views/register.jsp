<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Custom styles for the form box */
        .form-box {
            max-width: 500px;
            margin: auto;
            padding: 15px; /* Reduced padding */
            border: 1px solid #f0f0f0;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            background-color: #ffffff;
        }
        form .mb-3, form .row {
            margin-bottom: 10px; /* Reduce spacing between fields */
        }
       
        }
    </style>
    <script>
        function validatePasswords() {
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirmPassword").value;

            if (password !== confirmPassword) {
                showToast("Passwords do not match.", "danger");
                return false; // Prevent form submission
            }
            return true; // Allow form submission
        }
    </script>
</head>

<body class="bg-light">
    <div class="container mt-5">
   <!-- Error messages -->
        <c:if test="${not empty EmailInvalid}">
            <div class="alert alert-danger" role="alert">${EmailInvalid}</div>
        </c:if>
        <c:if test="${not empty EmailExist}">
            <div class="alert alert-danger" role="alert">${EmailExist}</div>
        </c:if>
        <c:if test="${not empty PhoneInvalid}">
            <div class="alert alert-danger" role="alert">${PhoneInvalid}</div>
        </c:if>
        <c:if test="${not empty PhoneExist}">
            <div class="alert alert-danger" role="alert">${PhoneExist}</div>
        </c:if>
        <c:if test="${not empty sessionExpired}">
            <div class="alert alert-danger" role="alert">${sessionExpired}</div>
        </c:if>
        <c:if test="${not empty errorOtp}">
            <div class="alert alert-danger" role="alert">${errorOtp}</div>
        </c:if>

        <!-- Registration Form Box -->
        <div class="form-box">
            <form action="doRegister" method="post" onsubmit="return validatePasswords();">
                <h3 class="text-center mb-3">Register</h3> <!-- Slightly reduced margin -->
                <div class="row mb-3">
                    <div class="col">
                        <label for="firstname" class="form-label">Firstname</label>
                        <input type="text" class="form-control" id="first_name" name="first_name" required>
                    </div>
                    <div class="col">
                        <label for="lastname" class="form-label">Lastname</label>
                        <input type="text" class="form-control" id="last_name" name="last_name" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>

                <div class="mb-3">
                    <label for="phone" class="form-label">Phone Number</label>
                    <input type="tel" class="form-control" id="phone" name="phone"  placeholder="e.g., 09123456789" required>
                </div>

                <div class="row mb-3">
                    <div class="col">
                        <label for="gender" class="form-label">Gender</label>
                        <select class="form-select" id="gender" name="gender" required>
                            <option value="" disabled selected>Select Gender</option>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                            <option value="other">Other</option>
                        </select>
                    </div>
                    <div class="col">
                        <label for="age" class="form-label">Age</label>
                        <input type="number" class="form-control" id="age" name="age" min="18" max="100" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>

                <div class="mb-3">
                    <label for="confirmPassword" class="form-label">Confirm Password</label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                </div>

                <button type="submit" class="btn btn-primary w-100">Register</button>
                <p class="text-center mt-3">Already have an account? <a href="login.jsp">Signin</a></p>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
