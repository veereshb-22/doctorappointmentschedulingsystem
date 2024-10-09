<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Contact Us</title>
    <!-- Bootstrap CSS from CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Font Awesome for icons (optional) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        /* Custom Styles */
        html, body {
            height: 100%; /* Ensures the html and body elements occupy the full viewport height */
            margin: 0; /* Removes default margin */
        }
        body {
            background-image: url('https://blog.digitalinfobytes.com/wp-content/uploads/2022/06/software-for-healthcare-organizations-2048x874.jpg'); /* Background image URL */
            background-size: cover; /* Ensures the image covers the entire background */
            background-position: center; /* Centers the image */
            background-repeat: no-repeat; /* Prevents the image from repeating */
            color: #343a40; /* Text color to ensure readability against the background */
            padding-top: 56px; /* Ensures content is not hidden behind the fixed navbar */
        }
        .contact-container {
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            height: calc(100vh - 56px); /* Full height minus the navbar */
            text-align: center;
        }
        .contact-card {
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent background */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 600px; /* Limit width */
        }
        p {
            color: #6c757d; /* Lighter gray color for the paragraph text */
        }
    </style>
</head>
<body>
    <jsp:include page="generalheader.jsp"></jsp:include>
    
    <div class="contact-container">
        <div class="contact-card">
            <h3>Contact Us</h3>
            <p><strong>Address:</strong> 2nd Main 10th Cross Vijay Nagar, Bangarapet</p>
            <p><strong>Phone:</strong>08153-254995</p>
            <p><strong>Email:</strong> contact@rajageneralhospital.com</p>
         
            <p>We look forward to hearing from you!</p>
        </div>
    </div>
</body>
</html>
