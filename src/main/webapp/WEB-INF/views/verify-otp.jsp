<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verify OTP</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="card shadow-sm p-4" style="max-width: 400px; width: 100%;">
            <h2 class="card-title text-center mb-4">Verify OTP</h2>
            
            <!-- Display error message if exists -->
            <c:if test="${not empty errorOtp}">
                <div class="alert alert-danger text-center">${errorOtp}</div>
            </c:if>

            <!-- Display success message if exists -->
            <c:if test="${not empty message}">
                <div class="alert alert-success text-center">${message}</div>
            </c:if>

            <form action="verifyOtp" method="post">
                <div class="mb-3">
                    <label for="otp" class="form-label">Enter OTP</label>
                    <input type="text" class="form-control" id="otp" name="otp" required pattern="\d{6}" title="OTP should be a 6-digit number" placeholder="6-digit number">
                </div>

                <button type="submit" class="btn btn-primary w-100">Verify OTP</button>

                <p class="mt-3 text-center">Didn't receive an OTP? 
   					 <a href="<c:url value='/resendOtp'/>">Resend OTP</a>
				</p>
            </form>
        </div>
    </div>

    <!-- Bootstrap 5 JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
