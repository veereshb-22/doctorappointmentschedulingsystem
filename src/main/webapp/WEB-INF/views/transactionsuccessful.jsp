<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Completed Transaction</title>
    <!-- Include Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
    
        body {
          background-image: url('data:image/jpeg;base64,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'); /* Background image URL */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff; /* White text color */
        }
        .container {
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
            padding: 40px; /* Increased padding for a larger size */
            border-radius: 8px;
            text-align: center;
            width: 400px; /* Increased width */
            box-shadow: none; /* No shadow for full transparency */
        }
        
        .container h2, .container h4 {
            color: white; /* White text color */
            margin-bottom: 20px;
        }
        
        .container a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background-color: #87CEEB; /* Light blue background */
            color: white; /* White text color */
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px; /* Icon and text size */
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        
        .container a:hover {
            background-color: #add8e6; /* Slightly lighter blue on hover */
        }
        
        .container .fa-home {
            margin-right: 10px; /* Space between icon and text */
            color: #ADD8E6; /* Light blue for icon */
        }
        
    </style>
</head>
<body>
    <div class="container">
		<h2 style="font-weight: bold; text-transform: uppercase; font-size: 24px; margin-bottom: 20px; letter-spacing: 2px;">Slot Booked</h2>
        <h4><a class="nav-link logout-link" href="/doctorappointmentschedulingsystem/user/userhome"><i class="fa fa-home"></i>Home</a></h4> 
    </div>
</body>
</html>
