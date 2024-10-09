<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About Us - Raja General Hospital</title>
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
    .about-container {
        display: flex;
        justify-content: center; /* Center horizontally */
        align-items: center; /* Center vertically */
        height: calc(100vh - 56px); /* Full height minus the navbar */
        text-align: center;
    }
    .about-card {
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
    
    <div class="about-container">
        <div class="about-card">
            <h2>About Raja General Hospital</h2>
            <p>Welcome to Raja General Hospital, where we are dedicated to providing high-quality healthcare services to our community. Established with the vision of promoting health and wellness, our hospital combines state-of-the-art medical technology with compassionate care.</p>
            <p>Our mission is to enhance the health and well-being of our patients through comprehensive medical services, patient education, and community outreach. We strive to deliver exceptional care in a safe, respectful, and nurturing environment.</p>
            <p>Join us on the journey to better health and explore our services today!</p>
        </div>
    </div>
</body>
</html>
