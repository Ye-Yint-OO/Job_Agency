<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Company Registration</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .form-box {
            max-width: 500px;
            margin: auto;
            padding: 15px;
            border: 1px solid #f0f0f0;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            background-color: #ffffff;
        }
        form .mb-3, form .row {
            margin-bottom: 10px;
        }
    </style>
</head>

<body class="bg-light">
    <div class="container mt-5">
        <!-- Error messages -->
        <c:if test="${not empty EmailInvalid}">
            <div class="alert alert-danger" role="alert">${EmailInvalid}</div>
        </c:if>
        <c:if test="${not empty PhoneInvalid}">
            <div class="alert alert-danger" role="alert">${PhoneInvalid}</div>
        </c:if>

        <!-- Registration Form Box -->
        <div class="form-box">
            <form action="doRegister" method="post" >
                <h3 class="text-center mb-3">Company Registration</h3>

                <div class="mb-3">
                    <label for="main_contact_name" class="form-label">Email</label>
                    <input type="text" class="form-control" id="email" name="email" required>
                </div>
                
                <div class="mb-3">
                    <label for="main_contact_name" class="form-label">Password</label>
                    <input type="text" class="form-control" id="password" name="password" required>
                </div>
                
                <div class="mb-3">
                    <label for="main_contact_name" class="form-label">Main Contact Name</label>
                    <input type="text" class="form-control" id="main_contact_name" name="main_contact_name" required>
                </div>

                <div class="mb-3">
                    <label for="company_name" class="form-label">Company Name</label>
                    <input type="text" class="form-control" id="company_name" name="company_name" required>
                </div>

                <div class="mb-3">
                    <label for="phone" class="form-label">Phone Number</label>
                    <input type="tel" class="form-control" id="phone" name="phone" placeholder="e.g., 09123456789" required>
                </div>
                
                <div class="mb-3">
                    <label for="phone" class="form-label">Address</label>
                    <input type="tel" class="form-control" id="address" name="address" placeholder="no,street" required>
                </div>

                 <div class="mb-3">
                   <label for="city" class="form-label">City</label>
                   <select class="form-select" id="city" name="city" required>
        <option value="" disabled selected>Select city name</option>
        <option value="yangon">Yangon</option>
    <option value="mandalay">Mandalay</option>
    <option value="naypyidaw">Naypyidaw</option>
    <option value="bagan">Bagan</option>
    <option value="taunggyi">Taunggyi</option>
    <option value="pyay">Pyay</option>
    <option value="myeik">Myeik</option>
    <option value="sittwe">Sittwe</option>
                   </select>
                </div>
                
                <div class="mb-3">
                   <label for="township" class="form-label">Township</label>
                   <select class="form-select" id="township" name="township" required>
        <option value="" disabled selected>Select township name</option>
         <option value="hlaing">Hlaing</option>
    <option value="dagon">Dagon</option>
    <option value="kamayut">Kamayut</option>
    <option value="sanchaung">Sanchaung</option>
    <option value="mingaladon">Mingaladon</option>
    <option value="tamwe">Tamwe</option>
    <option value="thingangyun">Thingangyun</option>
    <option value="thanlyin">Thanlyin</option>
    <option value="latha">Latha</option>
    <option value="bahan">Bahan</option>
                   </select>
                </div>
                
                
                <div class="mb-3">
                   <label for="state" class="form-label">State</label>
                   <select class="form-select" id="state" name="state" required>
        <option value="" disabled selected>Select state name</option>
        <option value="yangon">Yangon Region</option>
    <option value="mandalay">Mandalay Region</option>
    <option value="naypyidaw">Naypyidaw Union Territory</option>
    <option value="shan">Shan State</option>
    <option value="kayin">Kayin State</option>
    <option value="kachin">Kachin State</option>
    <option value="mon">Mon State</option>
    <option value="chin">Chin State</option>
    <option value="rakhine">Rakhine State</option>
    <option value="sagaing">Sagaing Region</option>
    <option value="magway">Magway Region</option>
    <option value="bago">Bago Region</option>
    <option value="tanintharyi">Tanintharyi Region</option>
    <option value="ayeyarwady">Ayeyarwady Region</option>
                   </select>
                </div>
                

                <div class="mb-3">
                    <label for="industry" class="form-label">Industry</label>
                    <select class="form-select" id="industry" name="industry" required>
                        <option value="" disabled selected>Select Industry</option>
                        <option value="technology">Informaion Technology</option>
                        <option value="finance">Finance</option>
                        <option value="healthcare">Healthcare</option>
                        <option value="education">Education</option>
                        <option value="retail">Retail</option>
                        <option value="manufacturing">Manufacturing</option>
                        <option value="other">Other</option>
                    </select>
                </div>

    <div class="mb-3">
    <label for="number_of_employees" class="form-label">Number of Employees</label>
    <select class="form-select" id="number_of_employees" name="number_of_employees" required>
        <option value="" disabled selected>Select Number of Employees</option>
        <option value="1-10">1-10</option>
        <option value="11-50">11-50</option>
        <option value="51-100">51-100</option>
        <option value="101-500">101-500</option>
        <option value="501-1000">501-1000</option>
        <option value="1000+">1000+</option>
    </select>
</div>

                
              

                <button type="submit" class="btn btn-primary w-100">Register</button>
                <p class="text-center mt-3">Already have an account? <a href="login">Signin</a></p>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>