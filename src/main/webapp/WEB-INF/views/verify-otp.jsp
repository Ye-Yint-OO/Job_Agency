<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Verify OTP</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        .title {
            font-size: 24px;
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        .input-group {
            margin-bottom: 15px;
        }

        .input-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .input-group input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            outline: none;
        }

        .input-group input:focus {
            border-color: royalblue;
        }

        .submit {
            width: 100%;
            padding: 10px;
            background-color: royalblue;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit:hover {
            background-color: darkblue;
        }

        .message {
            text-align: center;
            font-size: 14px;
            color: #555;
        }

        .message a {
            color: royalblue;
            text-decoration: none;
        }

        .message a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>

    <div class="container">
        <h2 class="title">Verify OTP</h2>
        <form action="VerifyOtp" method="post">
            <div class="input-group">
                <label for="otp">Enter OTP</label>
                <input type="text" id="otp" name="otp" required pattern="\d{6}" title="OTP should be a 6-digit number" placeholder="123456">
            </div>
            
            <button type="submit" class="submit">Verify OTP</button>

            <p class="message">Didn't receive an OTP? <a href="resend-otp.jsp">Resend OTP</a></p>
        </form>
    </div>

</body>
</html>
