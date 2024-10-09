<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Register Doctor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            color: #343a40;
            margin: 0;
        }
        .register-container {
            max-width: 500px;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 0.5rem;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            margin: auto;
            margin-top: 50px;
        }
        .error {
            color: red;
            font-size: 0.875em;
            display: none; /* Hidden by default */
        }
        .form-group {
            margin-bottom: 1rem;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const inputs = {
                name: document.getElementById('patientName'),
                phone: document.getElementById('phoneNumber'),
                email: document.getElementById('patientEmail'),
                password: document.getElementById('patientPassword'),
                date: document.getElementById('dateOfBirth'),
                address: document.getElementById('patientAddress'),
                gender: document.getElementById('gender'),
                wallet: document.getElementById('wallet')
            };

            const errors = {
                name: document.getElementById('nameError'),
                phone: document.getElementById('phoneError'),
                email: document.getElementById('emailError'),
                password: document.getElementById('passwordError'),
                date: document.getElementById('dateError'),
                address: document.getElementById('addressError'),
                wallet: document.getElementById('walletError')
            };

            const registerButton = document.querySelector('form button[type="submit"]');

            const validateInput = (input, errorElement, validationFunc) => {
                const value = input.value.trim();
                
                if (value === '') {
                    errorElement.style.display = 'none'; // No error message for empty fields
                    return true; // Treat empty input as valid for button logic
                } else {
                    const isValid = validationFunc(value);
                    errorElement.style.display = isValid ? 'none' : 'block';
                    return isValid;
                }
            };

            const validations = {
                name: value => value.length >= 3 && value.length <= 30,
                phone: value => /^[789]\d{9}$/.test(value),
                email: value => /^[^\s@]+@[^\s@]+\.[a-z]{2,}$/.test(value),
                password: value => /^(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/.test(value),
                date: value => new Date(value) <= new Date(),
                address: value => value.length >= 4 && value.length <= 150,
                wallet: value => value === '' || (parseFloat(value) >= 0) // Allow empty or positive numbers
            };

            const validateAll = () => {
                const isNameValid = validateInput(inputs.name, errors.name, validations.name);
                const isPhoneValid = validateInput(inputs.phone, errors.phone, validations.phone);
                const isEmailValid = validateInput(inputs.email, errors.email, validations.email);
                const isPasswordValid = validateInput(inputs.password, errors.password, validations.password);
                const isDateValid = validateInput(inputs.date, errors.date, validations.date);
                const isAddressValid = validateInput(inputs.address, errors.address, validations.address);
                const isWalletValid = validateInput(inputs.wallet, errors.wallet, validations.wallet);

                // Check if any fields are empty
                const allFieldsFilled = Object.values(inputs).every(input => input.value.trim() !== '');

                // Enable the button only if all validations pass and all fields are filled
                registerButton.disabled = !(isNameValid && isPhoneValid && isEmailValid && isPasswordValid && isDateValid && isAddressValid && isWalletValid && allFieldsFilled);
            };

            Object.values(inputs).forEach(input => {
                input.addEventListener('input', validateAll);
            });

            validateAll(); // Initial validation state
        });
        window.onload = function() {
            const errorMessage = '<%= session.getAttribute("errorMessage") != null ? session.getAttribute("errorMessage") : "" %>';
            if (errorMessage) {
                document.getElementById('globalError').style.display = 'block';
                document.getElementById('globalError').innerText = errorMessage;

                // Remove the error message from session after displaying it
                <%
                    session.removeAttribute("errorMessage");
                %>
            }
        };

    </script>
</head>
<body>
    <jsp:include page="generalheader.jsp"></jsp:include>
    <div class="container register-container">
        <h3 class="text-center">Register</h3>
        <div class="card">
            <div class="card-body">
                <form:form action="add" method="post" modelAttribute="patient">
                	 <div id="globalError" class="alert alert-danger" style="display: <%=(session.getAttribute("errorMessage") != null) ? "block" : "none"%>;">
	                    <c:if test="${not empty error}">
	                        ${error}
	                    </c:if>
               		 </div>
                    <div class="form-group">
                        <label for="patientName">Name:</label>
                        <form:input path="patientName" id="patientName" class="form-control" />
                        <div id="nameError" class="error">Name must be between 3 and 30 characters.</div>
                    </div>
                    <div class="form-group">
                        <label for="phoneNumber">Phone Number:</label>
                        <form:input path="phoneNumber" id="phoneNumber" class="form-control" />
                        <div id="phoneError" class="error">Phone number must be 10 digits long and start with 7, 8, or 9.</div>
                    </div>
                    <div class="form-group">
                        <label for="patientEmail">Email:</label>
                        <form:input path="patientEmail" id="patientEmail" class="form-control" />
                        <div id="emailError" class="error">Please enter a valid email address.</div>
                    </div>
                    <div class="form-group">
                        <label for="patientPassword">Password:</label>
                        <form:input path="patientPassword" type="password" id="patientPassword" class="form-control" />
                        <div id="passwordError" class="error">Password must be at least 8 characters long and include at least one special character.</div>
                    </div>
                    <div class="form-group">
                        <label for="dateOfBirth">Date of Birth:</label>
                        <form:input path="dateOfBirth" type="date" id="dateOfBirth" class="form-control" />
                        <div id="dateError" class="error">Date of birth cannot be in the future.</div>
                    </div>
                    <div class="form-group">
                        <label for="patientAddress">Address:</label>
                        <form:input path="patientAddress" id="patientAddress" class="form-control" />
                        <div id="addressError" class="error">Address must be between 4 and 150 characters.</div>
                    </div>
                    <div class="form-group">
                        <label for="gender">Gender:</label>
                        <form:select path="patientGender" id="gender" class="form-control">
                            <form:option value="">Select Gender</form:option>
                            <form:option value="Male">Male</form:option>
                            <form:option value="Female">Female</form:option>
                        </form:select>
                        <div id="genderError" class="error">Please select a gender.</div>
                    </div>
                    <div class="form-group">
                        <label for="wallet">Wallet:</label>
                        <form:input path="wallet" type="number" min="0" id="wallet" class="form-control" />
                        <div id="walletError" class="error">Wallet must be a non-negative number.</div>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary" disabled>Register</button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</body>
</html>
