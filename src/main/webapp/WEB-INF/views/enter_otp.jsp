<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enter OTP</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h2 class="card-title text-center mb-4">Enter OTP</h2>
				
				 <form action="verify-login-Otp" method="POST">
				    <!-- OTP Input -->
				    <div class="mb-3">
				        <label for="otp" class="form-label">Enter OTP</label>
				        <input type="text" id="otp" name="otp" class="form-control" required>
				        <c:if test="${not empty OtpInvalid}">
				            <div class="text-danger mt-2">${OtpInvalid}</div>
				        </c:if>
				    </div>
				
				    <!-- Hidden field to pass email -->
				    <input type="hidden" name="email" value="${email}">  <!-- Make sure this is present -->
				    
				    <!-- Submit Button -->
				    <div class="d-grid">
				        <button type="submit" class="btn btn-primary">Verify OTP</button>
				    </div>
				</form>
                
                    <div class="text-center mt-3">
                      <a href="<c:url value='/resend-Otp'/>">Resend OTP</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap 5 JS (Optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
