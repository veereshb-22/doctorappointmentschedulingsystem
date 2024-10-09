<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Bootstrap CSS from CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <meta charset="ISO-8859-1">
    <title>Register Doctor</title>
    <style>
        body {
            background-color: #f0f8ff; 
        }
        .register-container {
            max-width: 500px;
            margin: 0 auto;
            padding-top: 50px;
            background-color: #e6f7ff; 
            padding: 20px;
            border-radius: 8px;
        }
        .register-button {
            background-color: #add8e6; 
            color: white;
        }
        .register-button:hover {
            background-color: #87ceeb; 
        }
        .form-label {
            font-weight: normal;
        }
        .error {
            color: red;
            font-size: 0.875em;
            display: none;
        }
        .btn-container {
            text-align: center;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const fields = {
                name: document.getElementById('doctorName'),
                phone: document.getElementById('doctorPhonenumber'),
                email: document.getElementById('doctorEmail'),
                password: document.getElementById('doctorPassword'),
                nmcUid: document.getElementById('doctorNmcUID'),
                speciality: document.getElementById('doctorSpeciality'),
                experience: document.getElementById('doctorExperience'),
                description: document.getElementById('doctorDescription'),
                image: document.getElementById('doctorImage')
            };

            const errorMessages = {
                name: document.getElementById('nameError'),
                phone: document.getElementById('phoneError'),
                email: document.getElementById('emailError'),
                password: document.getElementById('passwordError'),
                nmcUid: document.getElementById('nmcUidError'),
                speciality: document.getElementById('specialityError'),
                experience: document.getElementById('experienceError'),
                description: document.getElementById('descriptionError'),
                image: document.getElementById('imageUrlError')
            };

            const validateField = (key) => {
                let isValid = false;
                const value = fields[key].value.trim();

                switch (key) {
                    case 'name':
                        isValid = value.length >= 3 && value.length <= 30;
                        break;
                    case 'phone':
                        const phoneRegex = /^[789]\d{9}$/;
                        isValid = phoneRegex.test(value);
                        break;
                    case 'email':
                        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                        isValid = emailRegex.test(value);
                        break;
                    case 'password':
                        const passwordRegex = /^(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/;
                        isValid = passwordRegex.test(value);
                        break;
                    case 'nmcUid':
                        const nmcUidRegex = /^\d{12}$/;
                        isValid = nmcUidRegex.test(value);
                        break;
                    case 'speciality':
                        isValid = value.length >= 3;
                        break;
                    case 'experience':
                        isValid = !isNaN(value) && value.trim() >= 0;
                        break;
                    case 'description':
                        isValid = value.length >= 4 && value.length <= 150;
                        break;
                    case 'image':
                        isValid = value !== '';
                        break;
                }

                if (value === '') {
                    errorMessages[key].style.display = 'none'; // Hide if the field is empty
                } else {
                    errorMessages[key].style.display = isValid ? 'none' : 'block'; // Show or hide based on validity
                }

                return isValid;
            };

            const validateAll = () => {
                const allValid = Object.keys(fields).every(key => validateField(key));
                document.querySelector('button[type="submit"]').disabled = !allValid;
            };

            Object.keys(fields).forEach(key => {
                fields[key].addEventListener('input', function() {
                    validateField(key);
                    validateAll(); // Check overall form validity
                });
            });

            validateAll(); // Initial validation state
        });
    </script>
</head>
<body>
    <jsp:include page="adminheader.jsp"></jsp:include>
    <div class="container register-container">
        <h2 class="text-center" style="color: #add8e6;">Register Doctor</h2>
        <div class="card">
            <div class="card-body">
                <!-- Display error message if present -->
                <c:if test="${not empty sessionScope.message}">
                    <div class="alert alert-danger">
                        ${sessionScope.message}
                        <c:remove var="message"/>
                    </div>
                </c:if>

                <!-- Registration form -->
                <form:form action="registerdoctorcomplete" method="post" modelAttribute="doctor" cssClass="form-horizontal">
                    <div class="mb-3">
                        <label for="doctorName" class="form-label">Name</label>
                        <form:input path="doctorName" type="text" class="form-control" id="doctorName"/>
                        <div id="nameError" class="error">Name must be between 3 and 30 characters.</div>
                    </div>
                    
                    <div class="mb-3">
                        <label for="doctorPhonenumber" class="form-label">Phone Number</label>
                        <form:input path="doctorPhonenumber" type="text" class="form-control" id="doctorPhonenumber"/>
                        <div id="phoneError" class="error">Phone number must be 10 digits long and start with 7, 8, or 9.</div>
                    </div>
                    
                    <div class="mb-3">
                        <label for="doctorEmail" class="form-label">Email</label>
                        <form:input path="doctorEmail" type="email" class="form-control" id="doctorEmail"/>
                        <div id="emailError" class="error">Please enter a valid email address.</div>
                    </div>
                    
                    <div class="mb-3">
                        <label for="doctorPassword" class="form-label">Password</label>
                        <form:input path="doctorPassword" type="password" class="form-control" id="doctorPassword"/>
                        <div id="passwordError" class="error">Password must be at least 8 characters long and include at least one special character.</div>
                    </div>
                    
                    <div class="mb-3">
                        <label for="doctorNmcUID" class="form-label">NMC UID</label>
                        <form:input path="doctorNmcUID" type="text" class="form-control" id="doctorNmcUID"/>
                        <div id="nmcUidError" class="error">NMC UID must be exactly 12 digits.</div>
                    </div>
                    
                    <div class="mb-3">
                        <label for="doctorSpeciality" class="form-label">Speciality</label>
                        <form:input path="doctorSpeciality" type="text" class="form-control" id="doctorSpeciality"/>
                        <div id="specialityError" class="error">Speciality must be at least 3 characters.</div>
                    </div>
                    
                    <div class="mb-3">
                        <label for="doctorExperience" class="form-label">Experience (Years)</label>
                        <form:input path="doctorExperience" type="number" class="form-control" id="doctorExperience"/>
                        <div id="experienceError" class="error">Experience must be a positive number or zero.</div>
                    </div>
                    
                    <div class="mb-3">
                        <label for="doctorDescription" class="form-label">Description</label>
                        <form:input path="doctorDescription" type="text" class="form-control" id="doctorDescription"/>
                        <div id="descriptionError" class="error">Description must be between 4 and 150 characters.</div>
                    </div>
                    
                    <div class="mb-3">
                        <label for="doctorImage" class="form-label">Image URL</label>
                        <form:input path="doctorImage" type="url" class="form-control" id="doctorImage"/>
                        <div id="imageUrlError" class="error">Image URL cannot be empty.</div>
                    </div>

                    <div class="btn-container">
                       <button type="submit" class="btn register-button" disabled>Register</button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies from CDN -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zyiW9WzIm1A2UR8B45ZpF1L7E9e8aP4gHfxh87QmD" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-pprnP6Z/ccKZB5F2nM0D09r4vwEv6A0mWmG1o5tbtbRO5tWgOsYpJuvxQsoT9btbA" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-pzjw8f+ua7Kw1TIqGtn63s4k5l+0I6o6ChxY+shU4E5o9oxqj40W1o4om2Ff+G3wC" crossorigin="anonymous"></script>
</body>
</html>
