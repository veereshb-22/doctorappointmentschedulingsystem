<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Home</title>
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
        .container {
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            height: 100vh; /* Full height of viewport */
        }
        .card {
            background-color: rgba(255, 255, 255, 0.8); /* More opaque semi-transparent background */
            color: #003366; /* Navy blue text color */
            border: none; /* Remove border for transparency effect */
            border-radius: 10px; /* Rounded corners */
            padding: 40px; /* Increased padding for larger card */
            width: 80%; /* Set width for larger size */
            max-width: 600px; /* Maximum width */
        }
        h2 {
            font-size: 2rem; /* Larger font size for welcome message */
            font-weight: bold; /* Bold text */
            margin-bottom: 20px; /* Space below the heading */
        }
        h5 {
            font-size: 1.5rem; /* Slightly larger font size for subtitles */
            font-weight: 600; /* Medium bold */
            margin-bottom: 15px; /* Space below subtitle */
        }
        p {
            font-size: 1.2rem; /* Larger font size for paragraph text */
            margin-bottom: 10px; /* Space between paragraphs */
        }
    </style>
</head>
<body>
    <jsp:include page="userheader.jsp"></jsp:include>
    <div class="container">
        <div class="card mt-5">
            <div class="card-body">
                <h2>Welcome 
                    <% 
                        String patientName = (String) session.getAttribute("patientNameSession");
                        out.print(patientName != null ? patientName : "Guest");
                    %>
                </h2>
              
                <p class="card-text"><strong>User ID:</strong> 
                    <% 
                        String patientID = (String) session.getAttribute("patientIDSession");
                        out.print(patientID != null ? patientID : "Not Available");
                    %>
                </p>
                <p class="card-text"><strong>User Email:</strong> 
                    <% 
                        String patientEmail = (String) session.getAttribute("patientEmailSession");
                        out.print(patientID != null ? patientID : "Not Available");
                    %>
                </p>
                <p class="card-text"><strong>Wallet Balance:</strong> 
                    <% 
                        Integer patientWallet = (Integer) session.getAttribute("patientwalletSession");
                        out.print(patientWallet != null ? patientWallet : "Not Available");
                        session.setAttribute("POO", (patientWallet + 13));
                    %>
                </p>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
