<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Select Date for Appointment</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <style>
        body {
            background-image: url('https://blog.digitalinfobytes.com/wp-content/uploads/2022/06/software-for-healthcare-organizations-2048x874.jpg'); /* Background image URL */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: #fff; /* White text color */
            height: 100vh; /* Full viewport height */
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0; /* Remove default margin */
        }
        .container {
            max-width: 600px; /* Set a max-width for better alignment */
            background-color: rgba(255, 255, 255, 0.7); /* Semi-transparent white background for form */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            text-align: center; /* Center-align text and form */
        }
        .btn-primary {
            background-color: #87CEEB; /* Light blue background */
            border: none; /* Remove default border */
            color: #ffffff; /* White text */
        }
        .btn-primary:hover {
            background-color: #add8e6; /* Slightly lighter blue for hover effect */
        }
        h1 {
            margin-bottom: 20px; /* Space below the heading */
        }
    </style>
</head>
<body>
    <jsp:include page="userheader.jsp"></jsp:include>
    <div class="container">
       <h1 style="color: #003366;">Select a Date and Doctor</h1>
        <form action="${pageContext.request.contextPath}/appointment/showtimeslots" method="get">
            <input type="hidden" id="hiddenDoctorID" name="doctorID" value="${doctorPatientSession.doctorID}">
            <div class="form-group">
                <label for="appointmentDate" style="color: #003366;">Select Date:</label>
                <input type="date" id="appointmentDate" name="appointmentDate" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">View Available Slots</button>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
