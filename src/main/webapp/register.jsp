<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Electronics: Register</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Registration Page</h4>

						<c:if test="${not empty succMsg }">
							<P class="text-center text-success">${succMsg }</P>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<c:if test="${not empty failedMsg }">
							<P class="text-center text-danger">${failedMsg }</P>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<form action="register" id="contactForm" method="post">

							<div class="form-group">
								<label for="exampleInputEmail1">Enter Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="fname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone No.</label> <input
									type="number" class="form-control" id="exampleInputPhone1"
									aria-describedby="emailHelp" required="required" name="phno">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="password">
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree terms & conditions</label>
							</div>
							<div class="text-center p-2">
							<button type="submit" class="btn btn-primary btn-block btn-sm">Register</button>
							</div>
							
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
	
	<script>
	 document.getElementById('contactForm').addEventListener('submit', function(event) {
        
         var phoneInput = document.getElementById('exampleInputPhone1');
         var phoneValue = phoneInput.value;

         
         // Regular expression for phone number validation (exactly 10 digits)
         var phonePattern = /^\d{10}$/;

        
         var phoneValid = phonePattern.test(phoneValue);

        

         if (!phoneValid) {
             alert('Please enter a valid 10-digit phone number.');
         }
         if (!phoneValid) {
             event.preventDefault(); // Prevent form submission if validation fails
         }

     });
    </script>
</body>
</html>