<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
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
            display: flex; /* Use flexbox to center the content */
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
        }
        body {
            background-image: url('https://blog.digitalinfobytes.com/wp-content/uploads/2022/06/software-for-healthcare-organizations-2048x874.jpg'); /* Background image URL */
            background-size: cover; /* Ensures the image covers the entire background */
            background-position: center; /* Centers the image */
            background-repeat: no-repeat; /* Prevents the image from repeating */
            color: #343a40; /* Text color to ensure readability against the background */
        }
        .card {
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent background */
            border: none; /* Remove border */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Shadow effect */
        }
        p {
            color: #6c757d; /* Lighter gray color for the paragraph text */
        }
    </style>
</head>
<body>
    <jsp:include page="doctorheader.jsp"></jsp:include>
    <div class="container">
        <div class="card mt-5">
            <div class="card-body text-center">
                <h2>Welcome, Doctor</h2>
                <p class="card-text"><strong>Doctor Email:</strong> 
                    <% 
                        String doctorEmail = (String) session.getAttribute("doctorEmail");
                        out.print(doctorEmail != null ? doctorEmail : "Not Available");
                    %>
                </p>  
            </div>
        </div>
    </div>
    <!-- Bootstrap JS Bundle with Popper from CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-5nQwJ9VnV2N/O4A6k4fU5D6o5t3v3X7F9B1z2T7K9G5x06t4sIHh5lW/7/E7d54O" crossorigin="anonymous"></script>
</body>
</html>
