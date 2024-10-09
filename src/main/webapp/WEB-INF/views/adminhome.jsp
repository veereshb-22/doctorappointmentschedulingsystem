<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Home</title>
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
            background-size: cover; 
            background-position: center; 
            background-repeat: no-repeat; 
            color: #343a40; 
            padding-top: 56px; 
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            min-height: 100vh;
            position: relative;
        }
		
        .overlay {
            position: absolute;
           
            background: rgba(0, 0, 0, 0.5);
            z-index: -1; 
        }

        .container {
            position: relative;
            z-index: 1; 
            max-width: 400px;
            width: 100%; 
            padding: 20px; 
            background-color: rgba(255, 255, 255, 0.8); 
            border-radius: 8px; /* Rounded corners 
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); 
        }

        h1 {
            color: #343a40; /* Dark color for better readability */
        }

        p {
            color: #6c757d; /* Lighter gray color for the paragraph text */
        }
    </style>
</head>
<body>
	<jsp:include page="adminheader.jsp"></jsp:include>
    <div class="overlay"></div>
    <div class="container">
        <h1>Admin Page</h1>
        <p>Welcome to the Admin Dashboard</p>
    </div>

    <!-- Bootstrap JS Bundle with Popper from CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-5nQwJ9VnV2N/O4A6k4fU5D6o5t3v3X7F9B1z2T7K9G5x06t4sIHh5lW/7/E7d54O" crossorigin="anonymous"></script>
</body>
</html>
