<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="ISO-8859-1">
    <title>Login</title>
    <style>
        body {
            background-color: #e6f7ff; /* Light blue background */
        }
        .login-container {
            max-width: 400px;
            margin: 0 auto;
            padding-top: 50px;
        }
        .login-button {
            background-color: #001f3f; /* Navy blue */
            color: white;
        }
        h3 {
            color: #001f3f; /* Navy blue for the heading */
        }
        .card {
            background-color: rgba(255, 255, 255, 0.9); /* Blend with background */
            border-radius: 0.5rem;
        }
        .error {
            color: red;
            font-size: 0.875em;
            display: none; /* Hide initially */
        }
    </style>
</head>
<body>
    <jsp:include page="generalheader.jsp"></jsp:include>
    <br>
    <div class="container login-container">
        <h3 class="text-center">Login</h3>
        <div class="card">
            <div class="card-body">
                <!-- Global error div -->
                <div id="globalError" class="alert alert-danger" style="display: <%=(session.getAttribute("errorMessage") != null) ? "block" : "none"%>;">
                    <c:if test="${not empty error}">
                        ${error}
                    </c:if>
                </div>

                <!-- Login form -->
                <form:form action="login" method="post" modelAttribute="user" cssClass="form-horizontal">
                    <div class="mb-3">
                        <label for="userEmail" class="form-label">Email</label>
                        <form:input path="userEmail" type="email" cssClass="form-control" id="email" oninput="validateEmail()" />
                        <div id="emailError" class="error">Please enter a valid email</div>
                    </div>
                    <div class="mb-3">
                        <label for="userPassword" class="form-label">Password</label>
                        <form:input path="userPassword" type="password" cssClass="form-control" id="password" oninput="validatePassword()" />
                        <div id="passwordError" class="error">Password must be at least 8 characters.</div>
                    </div>
                    <div class="text-center">
                        <form:button cssClass="btn login-button" style="background-color: #000080; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer;">Login</form:button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>

    <script>
        // Show modal if there's an error
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

        function validateEmail() {
            const emailInput = document.getElementById('email');
            const emailError = document.getElementById('emailError');
            const emailRegex = /^[^\s@]+@[^\s@]+\.[a-z]{2,}$/; // Basic email regex
            const emailValue = emailInput.value.trim();
            const dotComCount = (emailValue.match(/\.com/g) || []).length;

            if (!emailRegex.test(emailValue) || dotComCount > 1) {
                emailError.style.display = 'block';
            } else {
                emailError.style.display = 'none';
            }
        }

        function validatePassword() {
            const passwordInput = document.getElementById('password');
            const passwordError = document.getElementById('passwordError');

            if (passwordInput.value.length < 8) {
                passwordError.style.display = 'block';
            } else {
                passwordError.style.display = 'none';
            }
        }
    </script>

    <!-- Bootstrap JS and dependencies from CDN -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zyiW9WzIm1A2UR8B45ZpF1L7E9e8aP4gHfxh87QmD" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-pprnP6Z/ccKZB5F2nM0D09r4vwEv6A0mWmG1o5tbtbRO5tWgOsYpJuvxQsoT9btbA" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-pzjw8f+ua7Kw1TIqGtn63s4k5l+0I6o6ChxY+shU4E5o9oxqj40W1o4om2Ff+G3wC" crossorigin="anonymous"></script>
</body>
</html>
