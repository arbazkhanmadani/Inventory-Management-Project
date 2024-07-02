<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ims.dbconnection.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IMS-login</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" >
   
<style><%@include file="loginForm.css" %></style>
</head>
<body class="login-body">
   
<div class="main-parent">
        <div class="loginHeader">
            <h1>IMS</h1>
            <p><b>INVENTORY MANAGEMENT SYSTEM</b></p>
        </div>
        <div class="form-wrap">
            <form action="loginServlet" method="post">
                <h1><span>Login</span></h1>
                <%
                	String s = (String)session.getAttribute("uli");
                	System.out.println(s+"login");
                	if("invalid".equals(s)){
                		
          		%>
          		<div class="single-input">
                  <div class="alert alert-danger" role="alert">Opps!!, either your password or username is wrong</div>
				</div>                
          		
          		<%}
                	String logout = (String)session.getAttribute("logedout");
                	if(logout!=null){
          		%>
          			<div class="single-input">
                  	<div class="alert alert-danger" role="alert">Succesfully log out</div>
					</div>                
          		<%session.removeAttribute("logedout");}%>
                <div class="single-input">
                    <input id="emailAddress" type="text" placeholder="enter your username" name="uname" required>
                </div>
                <div class="single-input">
                    <input id="passWord" type="password" placeholder="enter your Password" name="pwd" required>
                </div>
                <div class="submit-button ">
                    <button class="button">Login</button>
                </div>
                <div class="account-have">
                    <a href="">Forget Password?</a>
                    <a href="register.jsp">Create new account?</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>