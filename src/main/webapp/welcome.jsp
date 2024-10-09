<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Landing Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            background-image: url('https://blog.digitalinfobytes.com/wp-content/uploads/2022/06/software-for-healthcare-organizations-2048x874.jpg'); /* Background image URL */
            background-size: cover;
            background-position: center;
            color: white; /* Text color */
            margin: 0;
            height: 100vh; /* Full height */
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }
        .icon-link {
            display: flex;
            align-items: center; /* Center icon and text vertically */
            justify-content: center; /* Center content */
            padding: 15px 30px; /* Button padding */
            background-color: #003366; /* Light navy blue */
            color: white; /* Text color */
            text-decoration: none; /* Remove underline */
            font-size: 24px; /* Font size for text */
            border-radius: 5px; /* Rounded corners */
            transition: background-color 0.3s; /* Smooth background transition */
        }
        .icon-link:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }
        .icon {
            margin-right: 10px; /* Space between icon and text */
        }
    </style>
</head>
<body>
    <a href="/doctorappointmentschedulingsystem/user/generalhome" class="icon-link">
        <i class="fas fa-book icon"></i> <!-- Book icon -->
        Go to Home
    </a>
</body>
</html>
