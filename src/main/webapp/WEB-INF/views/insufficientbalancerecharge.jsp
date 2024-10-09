<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insufficient Balance</title>
    <style>
    	
        body {
        	 background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDiOfVz_op2JIBb0xGP9Zg-fF6poQnV2cP_A&s'); /* Background image URL */
            background-size: cover; /* Ensures the image covers the entire background */
            background-position: center; /* Centers the image */
            background-repeat: no-repeat; /* Prevents the image from repeating */
            color: #343a40; /* Text color to ensure readability against the background */
            padding-top: 56px; /* Ensures content is not hidden behind the fixed navbar */
            font-family: Arial, sans-serif;
            text-align: center; /* Center-aligns content */
            background-color: #f0f8ff; /* Light blue background for the page */
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        h1 {
            font-weight: bold; /* Makes the text bold */
            color: #000080; /* Dark blue color for the header */
        }
        h3 {
            font-weight: bold; /* Makes the text bold */
            margin-top: 20px; /* Adds space between h1 and h3 */
        }
        .logout-link {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background-color: #87CEEB; /* Light blue background for the button */
            color: #ffffff; /* White text */
            padding: 10px 20px;
            border-radius: 5px; /* Rounded corners for the button */
            text-decoration: none; /* Removes underline */
            font-weight: bold; /* Makes the text bold */
        }
        .logout-link i {
            margin-right: 8px; /* Space between icon and text */
        }
    </style>
    <!-- Include Font Awesome for icon (make sure this is available) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div>
        <h1>Insufficient Balance Please Recharge</h1>
        
        <h3>
            <a class="logout-link" href="/doctorappointmentschedulingsystem/user/viewprofile">
                <i class="fa fa-user"></i> Recharge
            </a>
        </h3>
    </div>
</body>
</html>
