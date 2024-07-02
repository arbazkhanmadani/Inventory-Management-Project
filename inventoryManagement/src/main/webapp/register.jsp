<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- custome css  -->
    <link rel="stylesheet" href="./loginForm.css">
    
    <title>Registration</title>
</head>
<body class="login-body">
    <div class="main-parent">
        <div class="form-wrap">
            <form action="register1" method="post">
                <h1><span>Registration</span></h1>
                
                
                <%
            
               // String msg1 = (String)session.getAttribute("msg");
           		//if(msg1.equals("err")){
           		//%>
               <!-- <div class="single-input">
                   <div class="alert alert-danger" role="alert">Opps!!, your didn't register yet plss register first</div>
                </div>-->
                <%//}%>
                
                <div class="single-input">
                    <input id="uname" type="text" placeholder="create your username" name="uname" >
                </div>
                <div class="single-input">
                    <input id="fname" type="text" placeholder="First name" name="fname">
                </div>
                <div class="single-input">
                    <input id="lname" type="text" placeholder="Last name" name="lname">
                </div>
                <div class="single-input">
                    <input id="email" type="email" placeholder="Email Address" name="email">
                </div>
                <div class="single-input">
                    <input id="pass" type="password" placeholder="Password" name="password">
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