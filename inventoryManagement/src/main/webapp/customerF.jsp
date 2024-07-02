<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- custome css  -->
    <link rel="stylesheet" href="./loginForm.css">
    <title>Registration</title>
</head>
<body class="login-body">
    <div class="main-parent">
        <div class="form-wrap">
            <form action="customer" method="post">
                <h1><span>Customer</span></h1>
                
                <div class="single-input">
                    <input id="fname" type="number" placeholder="enter the id" name="customerId">
                </div>
                <div class="single-input">
                    <input id="fname" type="text" placeholder="First name" name="fname">
                </div>
                <div class="single-input">
                    <input id="lname" type="text" placeholder="Last name" name="lname">
                </div>
                <div class="single-input">
                    <input id="fname" type="text" placeholder="Enter your contact number" name="number">
                </div>
                <div class="single-input">
                    <input id="fname" type="date" placeholder="Enter your date" name="date">
                </div>
         	    <div class="single-input">
                    <textarea rows="5" cols=41" placeholder="Enter your full address" name="address"></textarea>
                </div>
                <div class="submit-button">
                    <button class="button" type="submit">Submit</button>
                </div>
                <div class="account-have">
                    <a href="login.jsp">Have an account please Login</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>