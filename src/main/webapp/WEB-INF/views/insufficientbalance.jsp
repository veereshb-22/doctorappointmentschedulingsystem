<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insufficient Balance</title>
    <style>
        body {
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
        h4 {
            font-weight: bold; /* Makes the text bold */
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
</head>
<body>
    <div>
        <h1>Insufficient Balance</h1>
        <h4>
            <a class="logout-link" href="<c:url value='/user/userhome'/>">
                <i class="fa fa-credit-card"></i> Recharge
            </a>
        </h4>
    </div>

    <!-- Include Font Awesome for icon (make sure this is available) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</body>
</html>
