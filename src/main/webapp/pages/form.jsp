<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!doctype html>
<html lang="en">

<head>
<!-- t src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.0.0/crypto-js.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.1.1/crypto-js.min.js"></script> -->

	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
<!-- <script src="http://crypto-js.googlecode.com/svn/tags/3.1.2/build/rollups/md5.js"></script> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://kit.fontawesome.com/e38070cbc2.js"
	crossorigin="anonymous"></script>



<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<style>
.form {
	padding: 5px 40px;
}

.form-control {
	margin-bottom: 5px;
	padding-bottom: 16px;
	position: relative;
	border-style: none;
}

.form-control label {
	display: inline-block;
	margin-bottom: 5px;
}

.form-control input {
	border: 2px solid #f0f0f0;
	border-radius: 4px;
	display: block;
	font-family: inherit;
	font-size: 14px;
	padding: 10px;
	width: 100%;
}

.form-control input:focus {
	outline: 0;
	border-color: #777;
}

.form-control.success input {
	border-color: #2ecc71;
}

.form-control.error input {
	border-color: #e74c3c;
}

.form-control i {
	visibility: hidden;
	position: absolute;
	top: 50px;
	right: 20px;
}

.form-control.success i.fa-check-circle {
	color: #2ecc71;
	visibility: visible;
}

.form-control.error i.fa-exclamation-circle {
	color: #e74c3c;
	visibility: visible;
}

.form-control small {
	color: #e74c3c;
	position: absolute;
	bottom: 0;
	left: 0;
	visibility: hidden;
}

.form-control.error small {
	visibility: visible;
}

.form button {
	background-color: #8e44ad;
	border: 2px solid #8e44ad;
	border-radius: 4px;
	color: #fff;
	display: block;
	font-family: inherit;
	font-size: 16px;
	padding: 10px;
	margin-top: 20px;
	width: 100%;
}

/* for dropdown in navbar */
.dropdown:hover .dropdown-menu {
	display: block;
}

.form-control span {
	color: red;
	font-weight: bold;
}

#star {
	color: red;
	font-weight: bold;
}

#msgerr {
	color: red;
	font-size: 20px;
	font-weight: bold;
	text-align: center;
}
</style>

<title>Encrypt Decrypt</title>
</head>

<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">Encrypt Decrypt App</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
<!-- 
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="guest">Home<span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item">
                    <a class="nav-link" href="#">My Policies</a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="#">My Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact Us</a>
                </li>
			</ul>


			<div class="mx-2">
				<a href="login">
					<button class="btn btn-success">Login</button>
				</a> <a href="signup">
					<button class="btn btn-success">SignUp</button>
				</a>
			</div>
		</div>

 -->
	</nav>
	<br>

	<div class="alert alert-light" role="alert" style="color: red">
		<form:errors path="guestinvalid.*" />
	</div>

	<div class="container">
		<div class="row">
			<div
				class="col-lg-6 col-md-6 col-sm-6 container justify-content-center card">
				<h2 class="text-center">Enter Details</h2>
				<div class="card-body">
					
					<form action="/submitdata" method="POST" id="form" class="form" onsubmit="myFunction()"
						>
						<div class="form-control">

							<label for="accountNumber">Account Number</label><span> *</span> <input
								type="text" 
								placeholder="Enter Account Number" id="accountNumber" name="accountNumber" />
							<i class="fas fa-check-circle"></i> <i
								class="fas fa-exclamation-circle"></i> <small>Error
								message</small>
						</div>
						<div class="form-control">

							<label for="type">Type</label><span> *</span> <input
								type="text"  placeholder="Enter Type"
								id="acType" name="type" /> <i class="fas fa-check-circle"></i>
							<i class="fas fa-exclamation-circle"></i> <small>Error
								message</small>
						</div>
						<div class="form-control">
							<label for="amount">Amount</label> <span> *</span><input
								type="text"  placeholder="Enter Amount"
								id="amount" name="amount" /> <i class="fas fa-check-circle"></i>
							<i class="fas fa-exclamation-circle"></i> <small>Error
								message</small>
						</div>
						<div class="form-control">
							<label for="currency">Currency</label> <span> *</span> <input
								type="text" 
								placeholder="Enter Currency" id="currency" name="currency" /> <i
								class="fas fa-check-circle"></i> <i
								class="fas fa-exclamation-circle"></i> <small>Error
								message</small>
						</div>
						<div class="form-control">
							<label for="accountFrom">Account From</label> <span> *</span> <input
								type="text" 
								placeholder="Enter Account" id="accountFrom" name="accountFrom" /> <i
								class="fas fa-check-circle"></i> <i
								class="fas fa-exclamation-circle"></i> <small>Error
								message</small>
						</div>

						<button type="submit" class="btn btn-primary">Submit</button>
						<!-- <p style="text-align: center;">
							Already registered? <a href="login">Login</a>
						</p> -->
					</form>

				</div>
			</div>
		</div>
	</div>
	
<script>

	
	function myFunction() 
	{
	 	var text = "The quick brown fox jumps over the lazy dog.";
		var secret = "René Über";
		var encrypted = CryptoJS.AES.encrypt(text, secret);
		encrypted = encrypted.toString();
		console.log("Cipher text: " + encrypted); 
		
		var secret = "Baktara";
		var accountNumber = document.getElementById('accountNumber').value; 
		var type = document.getElementById('acType').value;
		var amount = document.getElementById('amount').value;
		var currency = document.getElementById('currency').value;  
		var accountFrom = document.getElementById('accountFrom').value; 
		
		var encryptedAccountNumber = CryptoJS.AES.encrypt(accountNumber, secret);
		encryptedAccountNumber = encryptedAccountNumber.toString();
		document.getElementById('accountNumber').value = encryptedAccountNumber;
		console.log(encryptedAccountNumber);
		
		var encryptedtype = CryptoJS.AES.encrypt(type, secret);
		encryptedtype = encryptedtype.toString();
		document.getElementById('acType').value = encryptedtype;
		console.log(encryptedtype);
		
		var encryptedamount = CryptoJS.AES.encrypt(amount, secret);
		encryptedamount = encryptedamount.toString();
		document.getElementById('amount').value = encryptedamount; 
		console.log(encryptedamount);
		
		var encryptedcurrency = CryptoJS.AES.encrypt(currency, secret);
		encryptedcurrency = encryptedcurrency.toString();
		document.getElementById('currency').value = encryptedcurrency; 
		console.log(encryptedcurrency);
		
		var encryptedaccountFrom = CryptoJS.AES.encrypt(accountFrom, secret);
		encryptedaccountFrom = encryptedaccountFrom.toString();
		document.getElementById('accountFrom').value = encryptedaccountFrom; 
		console.log(encryptedaccountFrom);
		
	}
</script>

<!-- 
	<script>
		const form = document.getElementById('form');
		const username = document.getElementById('username');
		const email = document.getElementById('email');
		const password = document.getElementById('password');
		const password2 = document.getElementById('password2');

		const lastname = document.getElementById('lastname');

		const mobile = document.getElementById('mobile');

		const yob = document.getElementById('yob');

		const address = document.getElementById('address');

		//for particular field check on TAB

		function checkfirst() {
			const usernameValue = username.value.trim();
			if (usernameValue === '') {
				setErrorFor(username, 'Username cannot be blank');

			} else if (usernameValue.length < 3) {
				setErrorFor(username, 'name not valid');
			} else {
				setSuccessFor(username);

			}
		}

		function checklast() {
			const lastnameValue = lastname.value.trim();
			if (lastnameValue === '') {
				setErrorFor(lastname, 'Lastname cannot be blank');

			} else if (lastnameValue.length < 3) {
				setErrorFor(lastname, 'lastname not valid');
			} else {
				setSuccessFor(lastname);

			}
		}

		function checkemail() {
			const emailValue = email.value.trim();
			if (emailValue === '') {
				setErrorFor(email, 'Email cannot be blank');

			} else if (!isEmail(emailValue)) {
				setErrorFor(email, 'Not a valid email');

			} else {
				setSuccessFor(email);
			}
		}

		function checkPassword1() {
			const passwordValue = password.value.trim();
			if (passwordValue === '') {
				setErrorFor(password, 'Password cannot be blank');
			} else if (passwordValue.length < 5) {
				setErrorFor(password, 'Password not valid');
			} else {
				setSuccessFor(password);

			}
		}
		function checkPassword2() {
			const passwordValue = password.value.trim();
			const password2Value = password2.value.trim();
			if (password2Value === '') {
				setErrorFor(password2, 'Password cannot be blank');

			} else if (passwordValue !== password2Value) {
				setErrorFor(password2, 'Passwords does not match');

			} else {
				setSuccessFor(password2);

			}
		}

		function checkmob() {
			const mobilevalue = mobile.value.trim();

			if (/^\d{10}$/.test(mobilevalue)) {
				setSuccessFor(mobile);

			} else {
				setErrorFor(mobile, 'Please enter valid number!');
			}
		}

		function checkYear() {
			const yobvalue = yob.value.trim();

			var parts = yobvalue.split("/");
			var day = parseInt(parts[2], 10);
			var month = parseInt(parts[1], 10);
			var year = parseInt(parts[0], 10);

			var monthLength = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
			// Adjust for leap years
			if (year % 400 == 0 || (year % 100 != 0 && year % 4 == 0))
				monthLength[1] = 29;
			// Check the ranges of month and year
			// if (yobvalue === '') {
			// 			setErrorFor(yob, 'year cannot be blank');

			// 		}
			if (yobvalue === '') {
				setErrorFor(yob, 'Year cannot be blank');}
			
			else if (year > new Date().getFullYear() - 80 && year < new Date().getFullYear() - 5) {
				
				setSuccessFor(yob);
			}
			else {
				setErrorFor(yob, 'Invalid date of birth');

			}

		}
		

		function checkaddress() {
			const addressValue = address.value.trim();
			if (addressValue === '') {
				setErrorFor(address, 'Address cannot be blank');

			} else if (addressValue.length < 5) {
				setErrorFor(address, 'address not valid');
			} else {
				setSuccessFor(address);
			}
		}

		//for submitting the form all checks will be there

		function checkInputs() {
			// trim to remove the whitespaces

			var flag = 0;
			const usernameValue = username.value.trim();
			const emailValue = email.value.trim();
			const passwordValue = password.value.trim();
			const password2Value = password2.value.trim();

			const lastnameValue = lastname.value.trim();
			if (lastnameValue === '') {
				setErrorFor(lastname, 'Lastname cannot be blank');
				flag = 0;
			} else {
				setSuccessFor(lastname);
				flag = 1;
			}

			// const gender =document.getElementById('inlineRadio1');
			// if(document.getElementById('inlineRadio1').checked || document.getElementById('inlineRadio2').checked) {
			// 	flag=1;
			//   }
			// else {
			// 	document.getElementById("radioerr").innerHTML = "Please select one !" ;
			//         document.getElementById("err").style.color = "red";
			// 		flag=0;
			// }

			if (usernameValue === '') {
				setErrorFor(username, 'Username cannot be blank');
				flag = 0;
			} else {
				setSuccessFor(username);
				flag = 1;
			}

			if (emailValue === '') {
				setErrorFor(email, 'Email cannot be blank');
				flag = 0;
			} else if (!isEmail(emailValue)) {
				setErrorFor(email, 'Not a valid email');
				flag = 0;
			} else {
				setSuccessFor(email);
				//flag = 1;
			}

			if (passwordValue === '') {
				setErrorFor(password, 'Password cannot be blank');
				flag = 0;
			} else {
				setSuccessFor(password);
				//flag = 1;
			}

			if (password2Value === '') {
				setErrorFor(password2, 'Password cannot be blank');
				flag = 0;
			} else if (passwordValue !== password2Value) {
				setErrorFor(password2, 'Passwords does not match');
				flag = 0;
			} else {
				setSuccessFor(password2);
				var hash=CryptoJS.MD5(passwordValue);
				document.getElementById('password').value=hash;
				
				var hash=CryptoJS.MD5(password2Value);
				document.getElementById('password2').value=hash;
				//flag = 1;
			}

			const mobilevalue = mobile.value.trim();

			if (/^\d{10}$/.test(mobilevalue)) {
				setSuccessFor(mobile);
				//flag = 1;
			} else {
				setErrorFor(mobile, 'Please enter valid number!');
				flag = 0;
			}

			const yobvalue = yob.value.trim();

			var parts = yobvalue.split("/");
			var day = parseInt(parts[2], 10);
			var month = parseInt(parts[1], 10);
			var year = parseInt(parts[0], 10);

			var monthLength = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
			// Adjust for leap years
			if (year % 400 == 0 || (year % 100 != 0 && year % 4 == 0))
				monthLength[1] = 29;
			// Check the ranges of month and year
			// if (yobvalue === '') {
			// 			setErrorFor(yob, 'year cannot be blank');

			// 		}
			if (yobvalue === '') {
				setErrorFor(yob, 'Year cannot be blank');
				flag=0;}
			
			else if (year > new Date().getFullYear() - 80 && year < new Date().getFullYear() - 5) {
				
				setSuccessFor(yob);
			}
			else {
				setErrorFor(yob, 'Invalid date of birth');
					flag=0;
			}

			const addressValue = address.value.trim();
			if (addressValue === '') {
				setErrorFor(address, 'Address cannot be blank');
				flag = 0;
			} else {
				setSuccessFor(address);
				//flag = 1;
			}

			return Boolean(flag);

		}

		function setErrorFor(input, message) {
			const formControl = input.parentElement;
			const small = formControl.querySelector('small');
			formControl.className = 'form-control error';
			small.innerText = message;
		}

		function setSuccessFor(input) {
			const formControl = input.parentElement;
			formControl.className = 'form-control success';
		}

		function isEmail(email) {
			return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
					.test(email);
		}
	</script>
 -->

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>

</html>